<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld      http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>Radar rr</Name>
    <UserStyle>
      <Name>Radar rr</Name>
      <Title>Radar rr</Title>
      <Abstract>Radar rr</Abstract>
      <FeatureTypeStyle>
        <Rule>
          <RasterSymbolizer>
            <Opacity>1.0</Opacity>
            <ChannelSelection>
              <GrayChannel>
                <SourceChannelName>1</SourceChannelName>
              </GrayChannel>
            </ChannelSelection>
            <ColorMap>        
              <ColorMapEntry color="#CCCCCC" quantity="0" label="nodata" opacity="0" />
              <ColorMapEntry color="#6cebf3" quantity="7" label="0,07 mm/h" opacity="0" />
              <ColorMapEntry color="#6cebf3" quantity="7" label="0,07 mm/h" opacity="1" />
              <ColorMapEntry color="#58c797" quantity="14" label="0.1 mm/h" opacity="1 "/>             
              <ColorMapEntry color="#409857" quantity="34" label="0.3 mm/h" opacity="1" />
              <ColorMapEntry color="#f1f35a" quantity="86" label="0,9 mm/h" opacity="1" />
              <ColorMapEntry color="#dfc40a" quantity="216" label="2,2 mm/h" opacity="1" />
              <ColorMapEntry color="#eb951a" quantity="398" label="4 mm/h" opacity="1" />
              <ColorMapEntry color="#e85616" quantity="1000" label="10 mm/h" opacity="1" />
              <ColorMapEntry color="#ce0202" quantity="2513" label="25 mm/h" opacity="1" />              
              <ColorMapEntry color="#830a46" quantity="6313" label="> 25 mm/h" opacity="1" />             
              <ColorMapEntry color="#cccccc" quantity="65530" label="nodata" opacity="0.15" />             
              <ColorMapEntry color="#cccccc" quantity="65535" label="nodata" opacity="0.15" />             
            </ColorMap>
          </RasterSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>