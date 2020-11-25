# How To Fetch Weather Data From SmartMet Server's HTTP API <!-- omit in toc -->

Collection of example URLs for SmartMet Server's Timeseries-, WFS- and
WMS-plugins. Use `format=debug` for a HTML-table and `format=json` for 
JSON-data.

- [Daily Maximum Values](#daily-maximum-values)
- [Present Weather](#present-weather)
- [Past Weather Observations](#past-weather-observations)
- [How Much Rain (aka. Precipitation Aount)](#how-much-rain-aka-precipitation-aount)
- [Strongest Wind Past 24 hours](#strongest-wind-past-24-hours)
- [Highest Temperature Past 24 hours](#highest-temperature-past-24-hours)

## Daily Maximum Values

Parameter `tmax18` is an observation that contains the maximum temperature from
previous 18 utc to next day 18 utc.

```text
/timeseries?param=utctime,stationname,region,name,tmax18&format=debug&producer=daily&endtime=201904160000&starttime=201904150000&lang=fi&place=Kumpula&tz=utc&precision=double&hour=18
```

## Present Weather

TODO

## Past Weather Observations

TODO

## How Much Rain (aka. Precipitation Aount)

TODO

## Strongest Wind Past 24 hours

TODO

## Highest Temperature Past 24 hours

TODO

