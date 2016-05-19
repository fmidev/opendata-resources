# Weather forecast data, GridSeriesObservation with RectifiedCoverage result

## Numerical weather model (HIRLAM) forecast with multiple vertical levels and forecast times

Predicted values of a set of weather parameters at several heights (atmospheric pressure-based vertical axis)

### Request

	http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=GetFeature&version=2.0.0&service=WFS&storedquery_id=fmi::forecast::hirlam::pressure::grid

Parameter      | Value
---------------|----------------
service        | WFS
version        | 2.0.0
request        | GetFeature
storedquery_id | fmi::forecast::hirlam::pressure::grid

### Response

Property               | Value
-----------------------|-------------------
FeatureType            | omso:GridSeriesObservation
observedProperty       | `http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/meta?observableProperty=forecast&param=Humidity,Temperature,GeopHeight,VelocityPotential,WindUMS,WindVMS,PseudoAdiabaticPotentialTemperature,DewPoint&language=eng&units=grib`
procedure              | http://xml.fmi.fi/inspire/process/hirlam_painepinta
result coverage type   | gmlcov:RectifiedGridCoverage
result domain set type | gmlcov:RectifiedGrid
CRS of the domain set  | http://www.opengis.net/def/crs/EPSG/0/4326
result range set type  | gml:File pointing to an external download access point `http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/download?producer=hirlam_painepinta&param=Humidity,Temperature,GeopHeight,VelocityPotential,WindUMS,WindVMS,PseudoAdiabaticPotentialTemperature,DewPoint&bbox=-180,25.6476611861807,180,89.9999445853145&origintime=2016-05-11T18:00:00Z&starttime=2016-05-11T18:00:00Z&endtime=2016-05-14T00:00:00Z&format=grib2&projection=epsg:4326&levels=1000,925,850,700,500,400,300,250,200,100,50`

[Example XML file](./fmi-wfs-forecast-hirlam-levels.xml)

Remarks:

* Sampled feature is presented as a forecast region, and the corresponding the sampling feature as having a Polygon shape.
* The RectifiedGrid used as the domain set value only has 2 dimensions instead of 4 (lat, lon, time, height). The missing time dimension is just an error, it could be given using the Unix time axis as in the [MultiPointCoverage example](../gridseriesobservation_multipointcoverage/README.md), but the height dimension is more trick due to the unevenly spaced vertical levels. This could be solved using ReferenceableGrid, but as all the other axes here a evenly spaced, it seems like an overkill. CIS 1.1 grids allowing a mix of regular and unregular axes would be very handly here.
* The time dimension has evenly spaced values between 2016-05-11T18:00:00Z and 2016-05-14T00:00:00Z (1 hour resolution), but since this dimension is not described in the domain set, there is really no way to know that.
* The range set of the coverage is retrieved from an external URL (proprietary binary download service) encoded in GRIB format.

Other stored queries in FMI's WFS service with similar coverage-valued results:

* [fmi::forecast::climatology::scenario::grid](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::forecast::climatology::scenario::grid)
* [fmi::forecast::hbm::grid](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::forecast::hbm::grid)
* [fmi::forecast::helmi::grid](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::forecast::helmi::grid)
* [fmi::forecast::hirlam::surface::finland::grid](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=hirlam::surface::finland::grid) (only the surface level included)
* [fmi::forecast::wam::grid](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::forecast::wam::grid)
* [fmi::transportmodel::hilatar::surface::scandinavia::grid](http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=DescribeStoredQueries&version=2.0.0&service=WFS&storedquery_id=fmi::transportmodel::hilatar::surface::scandinavia::grid)
