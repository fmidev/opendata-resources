# Particle observation data, PointObservation with MultiPointCoverage result

## Radionuclide observation data

Radioactivity in outdoor air measured using collector, analyzed at specific time intervals.
This data set is produced by the Finnish Radiation and Nuclear Safety Authority (Stuk).

### Request

	http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=GetFeature&version=2.0.0&service=WFS&storedquery_id=stuk::observations::air::radionuclide-activity-concentration::multipointcoverage

Parameter      | Value
---------------|----------------
service        | WFS
version        | 2.0.0
request        | GetFeature
storedquery_id | stuk::observations::air::radionuclide-activity-concentration::multipointcoverage

### Response

Property               | Value
-----------------------|-------------------
FeatureType            | omso:PointObservation
observedProperty       | `http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/meta?observableProperty=observation&param=AC_P7D_avg&language=eng`
procedure              | http://xml.fmi.fi/inspire/process/stuk/air_radionuclides
result coverage type   | gmlcov:MultiPointCoverage
result domain set type | gmlcov:SimpleMultiPoint
CRS of the domain set  | http://www.opengis.net/def/crs/EPSG/0/4258
result range set type  | gml:DataBlock

[Example XML file](./stuk-radionuclide-observations-multipoint.xml)

Remarks:

* Each feature represents a single measurement done at a single measurement location during the phenomenonTime period. The observation is not instantaneous as it takes several days to collect a single sample.
* The domain set of the coverage consists of a single 2D point. Thus the domain set type could also simply be a gml:Point.
* The data is not encoded as PointTimeSeriesObservation because only the detected radionuclides for each observation period are reported. Thus the range set and range type of the coverages may change from observation to the next even if the location stays the same.
* The result contains both the radionuclide activity concentration for each detected nuclide as Bq/m3 and the uncertainty of the result percent (+/- X%) at sigma 1 (~68%) confidence interval.
