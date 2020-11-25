# How To Fetch Weather Data From SmartMet Server's HTTP API <!-- omit in toc -->

Collection of example URLs for SmartMet Server's Timeseries-, WFS- and
WMS-plugins. Use `format=debug` for a HTML-table and `format=json` for 
JSON-data.

- [Lightning Strikes in Finland](#lightning-strikes-in-finland)
- [Daily Maximum Values](#daily-maximum-values)
- [Present Weather](#present-weather)
- [Past Weather Observations](#past-weather-observations)
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

## Daily Maximum Values

Parameter `tmax18` is an observation that contains the maximum temperature from
previous 18 utc to next day 18 utc.

```text
/timeseries?param=utctime,stationname,region,name,tmax18&format=debug&producer=daily&endtime=201904160000&starttime=201904150000&lang=fi&place=Kumpula&tz=utc&precision=double&hour=18
```

## Present Weather

TODO

## Past Weather Observations

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

