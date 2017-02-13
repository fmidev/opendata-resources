import os,sys,string,argparse,requests,re,datetime
import xml.etree.ElementTree as ET
from pprint import pprint
from os import listdir
from os.path import isfile, join


class FMIOpenDataIO:
    def __init__(self, verbose=False):
        self.verbose = verbose

    def set_verbose(self, verbose=True):
        self.verbose = verbose

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
    
    def print_files(self, files):
        """ Print files to command line """
        print "Found following files:"
        for key in files:
            print '    -' + key + ': '
            print '      ' + files[key]['url']
        
    def fill_dir(self, files, dir):
        """ Mirror files got from WFS response and in given directory """
        
        existing_files = [f for f in listdir(dir) if isfile(join(dir, f))]
        available_files = files.keys()

        to_download = list(set(available_files) - set(existing_files))
        
        if self.verbose:
            print 'Downloading following files:'
            for file in to_download:
                print ' '+file

        for file in to_download:            
            self.download_file(file, files[file]['url'], dir)

    def download_file(self, file, url, dir):
        """ Download file and save it given dir """

        if self.verbose:
            print 'Starting to download file '+file+'...'

        with open(dir+'/'+file, 'wb') as handle:
            response = requests.get(url, stream=True)
        
            if not response.ok:                
                print "Error while getting the file ("+str(response.status_code)+')'

            if response.status_code == 408:
                handle.close()
                self.download_file(file, url, dir)
                
            for block in response.iter_content(1024):
                if block:
                    handle.write(block)

                    
