import os,sys,string,argparse,requests,re,datetime
import xml.etree.ElementTree as ET
from pprint import pprint
from os import listdir
from os.path import isfile, join


class FMIOpenData:
    def __init__(self, verbose=False):
        self.verbose = verbose

    def set_verbose(self, verbose=True):
        self.verbose = verbose

    def get_parameters(self, tree):
        """ Get parameters from response xml tree """
        
        for el in tree.iter(tag='{http://www.opengis.net/om/2.0}observedProperty'):
            url = el.get('{http://www.w3.org/1999/xlink}href')

            if self.verbose:
                print 'Fetching parameter information from ',url
            req = requests.get(url)
            params = {}
            if req.status_code == 200:
                xmlstring = req.content
                tree = ET.ElementTree(ET.fromstring(xmlstring))
                for p in tree.iter(tag='{http://inspire.ec.europa.eu/schemas/omop/2.9}ObservableProperty'):
                    params[p.get('{http://www.opengis.net/gml/3.2}id')] = p.find('{http://inspire.ec.europa.eu/schemas/omop/2.9}label').text

        self.params = params
        return params

    def do_req(self, apikey, stored_query, bbox, firstdate, lastdate):
        """ Do data request """
        url = 'http://data.fmi.fi/fmi-apikey/' + apikey + '/wfs?request=getFeature&storedquery_id='+stored_query
        try:
            url += '&bbox='+bbox
        except:
            pass
        try:
            url += '&starttime=' + firstdate
        except:
            pass
        try:
            url += '&endtime=' + lastdate
        except:
            pass

        if self.verbose:
            print 'Fetching data from ',url
        req = requests.get(url)
        return req
    
    def get_local_id(self, url):
        """ Get local id from INSPIRE procedure description """

        if self.verbose:
            print 'Loading local id from url '+url
        req = requests.get(url)
        
        id = 'modelname'
        if req.status_code == 200:
            xmlstring = req.content
            tree = ET.ElementTree(ET.fromstring(xmlstring))
            for el in tree.iter(tag='{http://inspire.ec.europa.eu/schemas/base/3.3}localId'):
                id = el.text
                
        return id
            
    def get_result_time(self, tree):
        """ Get result time from response """
                
        for el in tree.iter(tag='{http://www.opengis.net/om/2.0}resultTime'):
            for p in el.iter(tag='{http://www.opengis.net/gml/3.2}timePosition'):
                date_time_str = p.text.strip()
                dateStr = date_time_str.split('T').pop(0)
                timestamp = date_time_str.replace(':','').replace('-','')
                time = {'year': dateStr.split('-').pop(0),
                        'month': dateStr.split('-').pop(1),
                        'day': dateStr.split('-').pop(2),
                        'timestamp': timestamp,
                        'datetime': date_time_str}                

        return time
            
    def get_files(self, apikey, stored_query, bbox, firstdate, lastdate, file_prefix, file_format):
        """ Get downloadable coverages """

        req = self.do_req(apikey, stored_query, bbox, firstdate, lastdate)
        if req.status_code == 200:
            xmlstring = req.content
            tree = ET.ElementTree(ET.fromstring(xmlstring))
            files = self.parse_files(tree, file_prefix, file_format)
            
        return files

    def parse_files(self, tree, file_prefix, file_format):
        """ Parse files from the response """

        if self.verbose:
            print 'Splitting data...'
        files = {}    

        for el in tree.iter(tag='{http://www.opengis.net/wfs/2.0}member'):

            for procedure in el.iter(tag='{http://www.opengis.net/om/2.0}procedure'):
                model = self.get_local_id(procedure.get('{http://www.w3.org/1999/xlink}href'))

            time = self.get_result_time(el)
            
            i = 0
            for el in el.iter(tag='{http://www.opengis.net/gml/3.2}fileReference'):

                for pos in el.text.strip().split("\n"):
                    i += 1
                    # Prefer file_prefix given from command line
                    if file_prefix is None:
                        model_name = model
                    else:
                        model_name = file_prefix
                        
                    name = model_name + '-'+time['timestamp']
                    
                    # Add file format if given
                    if file_format is not None:
                        name = name + '.'+file_format
                        
                    files[name] = {'url': pos.strip().split(' ').pop(),
                                   'model': model_name,
                                   'time': time,
                                   'dir': str(time['year']) + '/' + str(time['month']) + '/' + str(time['day'])+'/'}

        return files
       
    def parse_multipointcoverage(self, tree):
        """ Parse multipointcoverage answers """
            
        params = self.get_parameters(tree)

        if self.verbose:
            print 'Splitting data...'
        data = []
        for el in tree.iter(tag='{http://www.opengis.net/gml/3.2}doubleOrNilReasonTupleList'):
            for pos in el.text.strip().split("\n"):
                data.append(pos.strip().split(' '))

        if self.verbose:
            print 'Fetching positions...'
        positions = {}
        for el in tree.iter(tag='{http://www.opengis.net/gmlcov/1.0}positions'):
            pos = el.text.split()
            i = 0
            while len(pos) > 0:
                lat = pos.pop(0)
                lon = pos.pop(0)
                timestamp = float(pos.pop(0))
            
                spatial_pos = lat+','+lon
                temporal_pos = datetime.datetime.fromtimestamp(timestamp)
                moment = {'time': temporal_pos}
                j = 0

                for id,p in params.iteritems():
                    moment[id] = data[i][j]
                    j = j+1
                    
                if(spatial_pos not in positions):
                    positions[spatial_pos] = []

                positions[spatial_pos].append(moment)
                i = i+1

        return positions, params

    def print_parameters(self, params):
        for p,label in params.iteritems():
            print p+': '+label

    def print_positions(self, positions, params):
        """ Print data """
        
        for pos in positions:
            print ''
            print pos
            print 4*'-'
            for moment in positions[pos]:                
                print ' '+moment['time'].isoformat()
                for p,value in moment.iteritems():
                    if p != 'time' and value != 'NaN':
                        print '  '+params[p],value

    def get_data(self, apikey,stored_query,bbox,firstdate,lastdate):
        """ Get data """

        req = self.do_req(apikey, stored_query, bbox, firstdate, lastdate)
        data = {}
    
        if req.status_code == 200:
            xmlstring = req.content
            tree = ET.ElementTree(ET.fromstring(xmlstring))
            positions, params = self.parse_multipointcoverage(tree)
            
        return positions, params

    def get_storedqueries(self, apikey, format=''):
        """ Print stored queries """
        
        url='http://data.fmi.fi/fmi-apikey/' + apikey + '/wfs?request=listStoredQueries'

        if self.verbose:
            print "Fetching stored queries from ",url
        req = requests.get(url)

        data = []
        if req.status_code == 200:
            xmlstring=req.content
            tree = ET.ElementTree(ET.fromstring(xmlstring))

            for el in tree.iter(tag='{http://www.opengis.net/wfs/2.0}StoredQuery'):
                id = el.get('id')
                elf = id.rsplit(':',1)
                try:
                    if(format == ''):
                        print id
                    elif elf[1] == format:
                        print id
                except (KeyError, IndexError):
                    pass            


