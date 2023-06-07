
# SmartSymbol symbol mapping guide

## Example

https://opendata.fmi.fi/timeseries?latlon=60.31722,24.96333&param=smartsymbol,smartsymboltext&lang=en

## Symbol mapping guide

### `# smartsymbol value = smartsymboltext value`

1 = clear  
2 = mostly clear  
4 = partly cloudy  
6 = mostly cloudy  
7 = overcast  
9 = fog  
71 = isolated thundershowers  
74 = scattered thundershowers  
77 = thundershowers  
21 = isolated showers  
24 = scattered showers  
27 = showers  
11 = drizzle  
14 = freezing drizzle  
17 = freezing rain  
31 = periods of light rain  
34 = periods of light rain  
37 = light rain  
32 = periods of moderate rain  
35 = periods of moderate rain  
38 = moderate rain  
33 = periods of heavy rain  
36 = periods of heavy rain  
39 = heavy rain  
41 = isolated light sleet showers  
44 = scattered light sleet showers  
47 = light sleet  
42 = isolated moderate sleet showers  
45 = scattered moderate sleet showers  
48 = moderate sleet  
43 = isolated heavy sleet showers  
46 = scattered heavy sleet showers  
49 = heavy sleet  
51 = isolated light snow showers  
54 = scattered light snow showers  
57 = light snowfall  
52 = isolated moderate snow showers  
55 = scattered moderate snow showers  
58 = moderate snowfall  
53 = isolated heavy snow showers  
56 = scattered heavy snow showers  
59 = heavy snowfall  
61 = isolated hail showers  
64 = scattered hail showers  
67 = hail showers  

`note`: if sun elevation is < 0° add 100 to SmartSymbol value. E.g. 1 -> 101.
