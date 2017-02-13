#!/usr/local/bin/python
# Tool for retrieving data via FMI open data API
#
import os,sys,string,argparse,requests,re,datetime
import xml.etree.ElementTree as ET
import fmiopendatahelper.fmiopendata as fmiopendata
import fmiopendatahelper.fmiopendataio as fmiio
from pprint import pprint
from os import listdir
from os.path import isfile, join

def main(argv):
    description = "Helper script to handle FMI Open Data WFS"
    epilog = '''
Examples: 
./fmiopendata --format=multipointcoverage stored_queries
./fmiopendata --stored_query=fmi::forecast::hirlam::surface::grid coverages
./fmiopendata --stored_query=fmi::observations::weather::multipointcoverage --bbox=19,59,25,65 --start=2015-01-01T00:00:00Z --end=2015-01-01T01:00:00Z data
./fmiopendata --stored_query=fmi::observations::weather::multipointcoverage --bbox=19,59,25,65 --start=2015-01-01T00:00:00Z --end=2015-01-01T01:00:00Z parameters
./fmiopendata --verbose=1 --stored_query=fmi::forecast::hirlam::surface::grid --file_prefix=hirlam --dir=gribs --file_format=grb2 coverages

'''
    
    parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,
                                     description=description, epilog=epilog)
    parser.add_argument('what', metavar='what', choices=['stored_queries', 'data', 'parameters', 'coverages'], nargs=1,
                    help='What to do (stored_queries | data | parameters | coverages)')
    parser.add_argument('--format', metavar='f', choices=['multipointcoverage', 'timevaluepair', 'simple', 'grid'], nargs='?',
                    help='Desired format for listing stored queris')
    parser.add_argument('--stored_query', metavar='q', nargs='?',
                    help='Stored query name')
    parser.add_argument('--bbox', metavar='b', nargs='?',
                        help='Bounding box (llon,llat,urlon,urlat')
    parser.add_argument('--starttime', metavar='s', nargs='?',
                        help='Start time (Y-m-d)')
    parser.add_argument('--endtime', metavar='e', nargs='?',
                        help='End time (Y-m-d)')
    parser.add_argument('--file_prefix', metavar='file_prefix', nargs='?',
                        help='File name prefix (in case of downloading files)')
    parser.add_argument('--file_format', metavar='file_format', nargs='?',
                        help='File format (in case of downloading files)')
    parser.add_argument('--dir', metavar='dir', nargs='?',
                        help='Directory to fulfill with found files')
    parser.add_argument('--verbose', metavar='v', nargs='?',
                        help='Verbose mode')    
    args = parser.parse_args()

    # Get proxy from env
    try:
        proxy_host = os.environ['https_proxy'].split(':').pop(0)
        proxy_port = os.environ['https_proxy'].split(':').pop(1)
    except:
        proxy_host = None
        proxy_port = None

    try:
        apikey = os.environ['fmi_apikey']
    except:
        print "Put following environment variables to your environment:"
        print "  export fmi_apikey=xxx"
        sys.exit(2)

    verbose = False
    if args.verbose is not None:
        verbose = True

    # Initialize
    fmiod = fmiopendata.FMIOpenData(verbose)
    io = fmiio.FMIOpenDataIO(verbose)
    
    # Execute
    if args.what[0] == 'stored_queries':
        try:
            fmiod.get_storedqueries(apikey, args.format)
        except (UnboundLocalError):
            sys.exit(2)
    elif args.what[0] == 'data':
        try:
            fmiod.print_positions(*fmiod.get_data(apikey, args.stored_query, args.bbox, args.starttime, args.endtime))
        except UnboundLocalError as e:
            print e
            sys.exit(2)
    elif args.what[0] == 'parameters':
        try:
            data, params = fmiod.get_data(apikey, args.stored_query, args.bbox, args.starttime, args.endtime)
            fmiod.print_parameters(params)
        except UnboundLocalError as e:
            print e
            sys.exit(2)
    elif args.what[0] == 'coverages':
        try:
            files = fmiod.get_files(apikey, args.stored_query, args.bbox, args.starttime, args.endtime, args.file_prefix, args.file_format)

            if verbose or args.dir is None:
                io.print_files(files)

            if args.dir is not None:
                io.fill_dir(files, args.dir)
                
        except UnboundLocalError as e:
            print e
            sys.exit(2)        


if __name__ == "__main__":
    main(sys.argv[1:])

