# Weather observation data, GridSeriesObservation with MultiPointCoverage result

## Finnish ground weather observations meteorological observation stations

Meteorological observations encoded as a MultiPointCoverage.

### Request

	`http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=GetFeature&version=2.0.0&service=WFS&storedquery_id=fmi::observations::weather::cities::multipointcoverage`

Parameter      | Value
---------------|----------------
service        | WFS
version        | 2.0.0
request        | GetFeature
storedquery_id | fmi::observations::weather::cities::multipointcoverage

### Response

Property               | Value
-----------------------|-------------------
FeatureType            | omso:GridSeriesObservation
observedProperty       | `http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/meta?observableProperty=observation&amp;param=WS_10MIN,WD_10MIN,WG_10MIN,T,RH,TD,P_SEA,R_1H,VIS,N_MAN,WAWA&amp;language=eng`
procedure              | http://xml.fmi.fi/inspire/process/opendata
result coverage type   | gmlcov:MultiPointCoverage
result domain set type | gmlcov:SimpleMultiPoint
CRS of the domain set  | http://xml.fmi.fi/gml/crs/compoundCRS.php?crs=4258&amp;time=unixtime (3-dim, EPSG:4258 + time)
result range set type  | gml:DataBlock

[XML file](./fmi-wfs-weather-observations-surface-cities-multipoint.xml)

Remarks:

* Sampled feature is presented as a feature collection of locations (cities in this case), and the corresponding the sampling feature as having a MultiPoint shape.
* The time dimension axis is using numerical unix time (number of seconds after 1.1.1970 00:00) as coordinates.
* The grid is regular in time, but irregular in space (city locations)

## Lightning observations

Registered lightning strike observations encoded as a MultiPointCoverage.

### Request

	`http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=GetFeature&version=2.0.0&service=WFS&storedquery_id=fmi::observations::lightning::multipointcoverage`

Parameter      | Value
---------------|----------------
service        | WFS
version        | 2.0.0
request        | GetFeature
storedquery_id | fmi::observations::lightning::multipointcoverage

### Response

Property               | Value
-----------------------|-------------------
FeatureType            | omso:GridSeriesObservation
observedProperty       | `http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/meta?observableProperty=observation&amp;param=WS_10MIN,WD_10MIN,WG_10MIN,T,RH,TD,P_SEA,R_1H,VIS,N_MAN,WAWA&amp;language=eng`
procedure              | http://xml.fmi.fi/inspire/process/lightning
result coverage type   | gmlcov:MultiPointCoverage
result domain set type | gmlcov:SimpleMultiPoint
CRS of the domain set  | http://xml.fmi.fi/gml/crs/compoundCRS.php?crs=4258&amp;time=unixtime (3-dim, EPSG:4258 + time)
result range set type  | gml:DataBlock

[XML file](./fmi-wfs-lightning-strikes-multipoint.xml)

Remarks:

* Sampled feature is presented as a observation region, and the corresponding the sampling feature as having a Polygon shape covering Finland. The grid points are contained within this polygon geometry.
* The time dimension axis is using numerical unix time (number of seconds after 1.1.1970 00:00) as coordinates.
* The grid is completely irregular, as each individual lightning strike has it's own grid point (in space and time).


Other stored queries in FMI's WFS service with similar coverage-valued results:

* [fmi::observations::airquality::hourly::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::observations::airquality::hourly::multipointcoverage)
* [fmi::observations::mareograph::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::observations::mareograph::multipointcoverage)
* [fmi::observations::radiation::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::observations::radiation::multipointcoverage)
* [fmi::observations::soil::hourly::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::observations::soil::hourly::multipointcoverage)
* [fmi::observations::wave::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::observations::wave::multipointcoverage)
* [fmi::observations::weather::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::observations::weather::multipointcoverage)
* [fmi::observations::weather::cities::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::observations::weather::cities::multipointcoverage)
* [fmi::observations::weather::daily::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::observations::weather::daily::multipointcoverage)
* [fmi::observations::weather::monthly::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::observations::weather::monthly::multipointcoverage)
* [fmi::observations::weather::monthly::30year::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::observations::weather::monthly::30year::multipointcoverage)
* [fmi::observations::weather::yearly::30year::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::observations::weather::yearly::30year::multipointcoverage)
* [livi::observations::road::default::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=livi::observations::road::default::multipointcoverage)
* [livi::observations::road::finland::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=livi::observations::road::finland::multipointcoverage)
* [livi::observations::road::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=livi::observations::road::multipointcoverage)
* [stuk::observations::external-radiation::latest::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=stuk::observations::external-radiation::latest::multipointcoverage)
* [stuk::observations::external-radiation::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=stuk::observations::external-radiation::multipointcoverage)

