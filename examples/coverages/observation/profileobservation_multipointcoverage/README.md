# Weather observation data, ProfileObservation with MultiPointCoverage result

## Weather observation profile measured from a radio mast

Weather parameter observations made at the same time along at different heights along a radio mast.

### Request

	http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/wfs?request=GetFeature&version=2.0.0&service=WFS&storedquery_id=fmi::observations::weather::mast::multipointcoverage

Parameter      | Value
---------------|----------------
service        | WFS
version        | 2.0.0
request        | GetFeature
storedquery_id | fmi::observations::weather::mast::multipointcoverage

### Response

Property               | Value
-----------------------|-------------------
FeatureType            | omso:ProfileObservation
observedProperty       | `http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/meta?observableProperty=observation&amp;param=TA&language=eng` or `http://data.fmi.fi/fmi-apikey/<insert-apikey-here>/meta?observableProperty=observation&param=TD&language=eng`
procedure              | http://xml.fmi.fi/inspire/process/mast
result coverage type   | gmlcov:MultiPointCoverage
result domain set type | gmlcov:SimpleMultiPoint
CRS of the domain set  | http://xml.fmi.fi/gml/crs/mastSRS.php?id=fmisid-101000 (Local CRS for this particular mast, defined using GML 3.3 linear referencing)
result range set type  | gml:DataBlock

[Example XML file](./fmi-wfs-mast-observations-multipoint.xml)

Remarks:

* Each observation is an instantaneous measurement of a single weather parameter (like temperature) at different heights along the radio mast.
* GML 3.3 linear referencing is used to define a local 1D coordinate reference system for the mast, starting from the ground and including all positions along the mast geometry until the top.
* The measurement instruments for different parameters are not always present at the same heights, thus the 1D profile coverages for different parameters are contained in different ProfileObservations.
* The sampledFeature property is empty, it should contain a feature covering a volume of air around the mast.
* The samplingFeature contains a relatedSamplingFeature describing a ground weather observation station for mast.