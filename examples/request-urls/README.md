# How To Fetch Weather Data From SmartMet Server's HTTP API <!-- omit in toc -->

Collection of example URLs for SmartMet Server's Timeseries-, WFS- and
WMS-plugins. Use `format=debug` for a HTML-table and `format=json` for 
JSON-data.

Prefix your urls with `http://opendata.fmi.fi` when using FMI's Open Data
service, or your own host if you have your own SmartMet Server set up.

- [Lightning Strikes in Finland](#lightning-strikes-in-finland)
- [Forecast](#forecast)
- [Forecast for Selected Height (meters)](#forecast-for-selected-height-meters)
- [Forecast for Selected Height (pressure)](#forecast-for-selected-height-pressure)
- [Daily Maximum Values](#daily-maximum-values)
- [Past and Present Weather Observations](#past-and-present-weather-observations)
- [How Much Rain (aka. Precipitation Aount)](#how-much-rain-aka-precipitation-aount)
- [Strongest Wind Past 24 hours](#strongest-wind-past-24-hours)
- [Highest Temperature Past 24 hours](#highest-temperature-past-24-hours)

## Lightning Strikes in Finland

There is a WFS stored query available for reading latest lightning data. By
default it returns lightnings for the past 12 hours.

```text
/wfs?request=getFeature&storedquery_id=fmi::observations::lightning::simple
```

To fetch certain moment in time use starttime and endtime parameters.

```text
/wfs?request=getFeature&storedquery_id=fmi::observations::lightning::simple&starttime=2017-08-12T22:00:00Z&endtime=2017-08-12T23:00:00Z
```

For certain area set the bounding box value with bbox

```text
/wfs?request=getFeature&storedquery_id=fmi::observations::lightning::simple&bbox=20.64,58.65,32.03,62.63
```

## Forecast

Using source of MetCoOp model (previously called Harmonie).

For a selected location, use place-field. Example forecast in Helsinki.

```text
/wfs?request=getFeature&storedquery_id=fmi::forecast::harmonie::surface::point::multipointcoverage&place=helsinki
```

## Forecast for Selected Height (meters)

Using source of MetCoOp model (previously called Harmonie).

Using the "hybrid"-version of stored query. Default returns forecast for next
50 hours from 100 meters height.

```text
/wfs?request=getFeature&storedquery_id=fmi::forecast::harmonie::hybrid::point::multipointcoverage&place=Helsinki
```

Using height field, you can set the used surface. For example 1000 meters:

```text
/wfs?request=getFeature&storedquery_id=fmi::forecast::harmonie::hybrid::point::multipointcoverage&place=helsinki&height=1000
```

## Forecast for Selected Height (pressure)

Using source of MetCoOp model (previously called Harmonie).

Default level is usually 850 hPa, but it can be checked using 
describeStoredQueries as a request value.

```text
/wfs?request=getFeature&storedquery_id=fmi::forecast::harmonie::pressure::point::multipointcoverage&place=Helsinki
```

Using height field, you can set the used surface. For example height of 950 hPa:

```text
/wfs?request=getFeature&storedquery_id=fmi::forecast::harmonie::pressure::point::multipointcoverage&place=Helsinki&level=950
```

## Daily Maximum Values

Parameter `tmax18` is an observation that contains the maximum temperature from
previous 18 utc to next day 18 utc.

This example uses the Timeseries API that is available in some SmartMet Server
instances.

```text
/timeseries?param=utctime,stationname,region,name,tmax18&format=debug&producer=daily&endtime=201904160000&starttime=201904150000&lang=fi&place=Kumpula&tz=utc&precision=double&hour=18
```

## Past and Present Weather Observations

Using a WFS stored query.

```text
/wfs?request=getFeature&storedquery_id=fmi::observations::weather::cities::timevaluepair
```

Limit to certain parameters only using parameters-field.

```text
/wfs?request=getFeature&storedquery_id=fmi::observations::weather::cities::timevaluepair&parameters=ws_10min,wg_10min,wd_10min
```

Results in 10 min timesteps

```text
/wfs?request=getFeature&storedquery_id=fmi::observations::weather::cities::timevaluepair&timestep=10
```

## How Much Rain (aka. Precipitation Aount)

TODO

## Strongest Wind Past 24 hours

TODO

## Highest Temperature Past 24 hours

TODO

