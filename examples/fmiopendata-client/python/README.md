FMI OpenData Client
===================

Example implementation for python to interact with FMI Open Data WFS.

Usage:
```
positional arguments:
  what                  What to do (stored_queries | data | parameters |
                        coverages)

optional arguments:
  -h, --help            show this help message and exit
  --format [f]          Desired format for listing stored queris
  --stored_query [q]    Stored query name
  --bbox [b]            Bounding box (llon,llat,urlon,urlat
  --starttime [s]       Start time (Y-m-d)
  --endtime [e]         End time (Y-m-d)
  --file_prefix [file_prefix]
                        File name prefix (in case of downloading files)
  --file_format [file_format]
                        File format (in case of downloading files)
  --dir [dir]           Directory to fulfill with found files
  --verbose [v]         Verbose mode

Examples:
./fmiopendata --format=multipointcoverage stored_queries
./fmiopendata --stored_query=fmi::forecast::hirlam::surface::grid coverages
./fmiopendata --stored_query=fmi::observations::weather::multipointcoverage --bbox=19,59,25,65 --start=2015-01-01T00:00:00Z --end=2015-01-01T01:00:00Z data
./fmiopendata --stored_query=fmi::observations::weather::multipointcoverage --bbox=19,59,25,65 --start=2015-01-01T00:00:00Z --end=2015-01-01T01:00:00Z parameters
./fmiopendata --verbose=1 --stored_query=fmi::forecast::hirlam::surface::grid --file_prefix=hirlam --dir=gribs --file_format=grb2 coverages
```
