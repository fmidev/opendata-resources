# Title of folder

## Grid-interpolated Monthly precipitation rate and mean temperature observations

Monthly precipitation rate and mean temperature interpolated into a grid. The data is returned in GRIB format.

### Request

	http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=GetFeature&version=2.0.0&service=WFS&storedquery_id=fmi::observations::weather::monthly::grid

Parameter      | Value
---------------|----------------
service        | WFS
version        | 2.0.0
request        | GetFeature
storedquery_id | fmi::observations::weather::monthly::grid

### Response

Property               | Value
-----------------------|-------------------
FeatureType            | omso:GridSeriesObservation
observedProperty       | `http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/meta?observableProperty=forecast&param=MonthlyMeanTemperature,MonthlyPrecipitation&amp;language=eng&units=grib`
procedure              | http://xml.fmi.fi/inspire/process/monthly
result coverage type   | gmlcov:RectifiedCoverage
result domain set type | gmlcov:RectifiedGrid
CRS of the domain set  | not set
result range set type  | gml:File pointing to http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/download?producer=monthly&param=MonthlyMeanTemperature,MonthlyPrecipitation&bbox=15.9689043139365,59.6117693413028,33.0613124198255,70.0798784441389&origintime=1961-01-01T00:00:00Z&starttime=1961-01-01T00:00:00Z&endtime=2012-12-01T00:00:00Z&format=grib2&projection=epsg:4326

Remarks:

* The procedure referenced is missing.
* The RectifiedGrid used as the domain set value is missing a CRS definition. This is an error.
* The RectifiedGrid used as the domain set value only has 2 dimensions instead of 4 (lat, lon, time). The missing time dimension is just an error, it could be given using the Unix time axis as in the [MultiPointCoverage example](../gridseriesobservation_multipointcoverage/README.md), but the height dimension is more trick due to the unevenly spaced vertical levels. This could be solved using ReferenceableGrid, but as all the other axes here a evenly spaced, it seems like an overkill. CIS 1.1 grids allowing a mix of regular and unregular axes would be very handly here.
* The time dimension has evenly spaced values between 1961-01-01T00:00:00Z and 2012-12-01T00:00:00Z (1 month resolution), but since this dimension is not described in the domain set, there is really no way to know that.
* The range set of the coverage is retrieved from an external URL (proprietary binary download service) encoded in GRIB format.

[Example XML file](./fmi-wfs-observations-monthly-temp_and_prec_interpolated.xml)

