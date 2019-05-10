import requests
import datetime as dt
import xml.etree.ElementTree as ET
import numpy as np
import re
import argparse

def get_param_names(url):
    """ Get parameters metadata """
    req = requests.get(url)
    params = {}

    if req.status_code == 200:
        xmlstring = req.content
        tree = ET.ElementTree(ET.fromstring(xmlstring))
        for p in tree.iter(tag='{http://inspire.ec.europa.eu/schemas/omop/2.9}ObservableProperty'):
            params[p.get('{http://www.opengis.net/gml/3.2}id')] = p.find('{http://inspire.ec.europa.eu/schemas/omop/2.9}label').text
    return params

def get_params(tree):
    """ Get parameters from response xml tree """

    retParams = []
    for el in tree.iter(tag='{http://www.opengis.net/om/2.0}observedProperty'):
        url = el.get('{http://www.w3.org/1999/xlink}href')
        params = re.findall(r"(?<=param=).*,.*(?=&)", url)[0].split(',')

        param_names = get_param_names(url)
        for p in params:
            retParams.append('{} ({})'.format(param_names[p], p))

    return retParams

def get_positions(tree):
    """
    Function to get times and coordinates from multipointcoverage answer
    """
    positions = []
    for el in tree.iter(tag='{http://www.opengis.net/gmlcov/1.0}positions'):
        pos = el.text.split()
        i = 0
        while len(pos) > 0:
            lat = float(pos.pop(0))
            lon = float(pos.pop(0))
            timestamp = int(pos.pop(0))
            positions.append([lat,lon,timestamp])
    return np.array(positions)

def main():
    """
    Get data from db and save it as csv
    """

    url = 'http://opendata.fmi.fi/wfs'
    daystep = 1

    starttime = dt.datetime.strptime(options.starttime, '%Y-%m-%d')
    endtime = dt.datetime.strptime(options.endtime, '%Y-%m-%d')

    start = starttime
    end = start + dt.timedelta(days=daystep)
    if end > endtime: end = endtime

    while end <= endtime and start < end:
        startStr = start.strftime('%Y-%m-%d')
        endStr = end.strftime('%Y-%m-%d')

        # Get data
        payload = {
            'request': 'getFeature',
            'storedquery_id': 'fmi::observations::weather::multipointcoverage',
            'bbox': '19,59,35,75',
            'starttime': startStr,
            'endtime': endStr,
            }
        r = requests.get(url, params=payload)

        # Construct XML tree
        tree = ET.ElementTree(ET.fromstring(r.content))

        # Get geospatial and temporal positions of data elements
        positions = get_positions(tree)

        # Extract data from XML tree
        d = []
        for el in tree.iter(tag='{http://www.opengis.net/gml/3.2}doubleOrNilReasonTupleList'):
            for pos in el.text.strip().split("\n"):
                d.append(pos.strip().split(' '))

        # Assign data values to positions
        junk = np.append(positions, np.array(d), axis=1)
        try:
            data = np.append(data, junk, axis=0)
        except NameError:
            data = junk

        print('Time interval {} - {} provided {} rows'.format(startStr, endStr, junk.shape[0]))

        start = end
        end = start + dt.timedelta(days=daystep)
        if end > endtime: end = endtime

    print('Done fetching data. Final dimensions of the result: {}'.format(data.shape))

    # Get params from the last XML tree element (they don't change over time)
    params = ['lat', 'lon', 'timestamp'] + get_params(tree)

    # Save
    np.savetxt(options.filename, data.astype(np.float32), fmt='%.5f', header=';'.join(params), delimiter=";")

if __name__=='__main__':

    parser = argparse.ArgumentParser()

    parser.add_argument('--filename', type=str, default=None, help='Filename to save the data')
    parser.add_argument('--starttime', type=str, default=None, help='Starttime in format Y-m-d')
    parser.add_argument('--endtime', type=str, default=None, help='Endtime in format Y-m-d')

    options = parser.parse_args()

    main()
