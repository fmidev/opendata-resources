# Weather forecast data, GridSeriesObservation with MultiPointCoverage result

## Numerical weather model (HIRLAM) point surface forecast

Predicted values of a set of weather parameters at specified points (major cities in Finland) at ground level (2m).

### Request

	`http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=GetFeature&version=2.0.0&service=WFS&storedquery_id=fmi::forecast::hirlam::surface::cities::multipointcoverage`

Parameter      | Value
---------------|----------------
service        | WFS
version        | 2.0.0
request        | GetFeature
storedquery_id | fmi::forecast::hirlam::surface::cities::multipointcoverage

### Response

Property               | Value
-----------------------|-------------------
FeatureType            | omso:GridSeriesObservation
observedProperty       | `http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/meta?observableProperty=forecast&amp;param=GeopHeight,Temperature,Pressure,Humidity,WindDirection,WindSpeedMS,WindUMS,WindVMS,MaximumWind,WindGust,DewPoint,TotalCloudCover,WeatherSymbol3,LowCloudCover,MediumCloudCover,HighCloudCover,Precipitation1h,PrecipitationAmount,RadiationGlobalAccumulation,RadiationLWAccumulation,RadiationNetSurfaceLWAccumulation,RadiationNetSurfaceSWAccumulation,RadiationDiffuseAccumulation&amp;language=eng`
procedure              | http://xml.fmi.fi/inspire/process/hirlam
result coverage type   | gmlcov:MultiPointCoverage
result domain set type | gmlcov:SimpleMultiPoint
CRS of the domain set  | http://xml.fmi.fi/gml/crs/compoundCRS.php?crs=4258&amp;time=unixtime (3-dim EPSG:4258 + time)
result range set type  | gml:DataBlock

[XML file](./fmi-wfs-forecast-hirlam-surface-cities-multipoint.xml)

Remarks:

* There is an error in the `om:name` process parameter property: the value of xlink:href should be 'http://inspire.ec.europa.eu/codeList/ProcessParameterValue/value/numericalModel/analysisTime' instead of 'http://xml.fmi.fi/inspire/process/hirlam' 
* Sampled feature is presented as a feature collection of locations (cities in this case), and the corresponding the sampling feature as having a MultiPoint shape. One grid point is located at each of the points of this MultiPoint.
* The time dimension axis is using numerical unix time (number of seconds after 1.1.1970 00:00) as coordinates.

Other stored queries in FMI's WFS service with similar coverage-valued results:

* [fmi::forecast::hbm::point::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::forecast::hbm::point::multipointcoverage)
* [fmi::forecast::hirlam::surface::obsstations::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::forecast::hirlam::surface::obsstations::multipointcoverage)
* [fmi::forecast::hirlam::surface::point::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::forecast::hirlam::surface::point::multipointcoverage)
* [fmi::forecast::oaas::sealevel::point::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::forecast::oaas::sealevel::point::multipointcoverage)
* [fmi::forecast::wam::point::multipointcoverage](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::forecast::wam::point::multipointcoverage)
