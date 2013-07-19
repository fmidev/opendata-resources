<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld      http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>gtopo</Name>
    <UserStyle>
      <Name>dem</Name>
      <Title>Simple DEM style</Title>
      <Abstract>Classic elevation color progression</Abstract>
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
              <ColorMapEntry color="#CCCCCC" quantity="0" label="nodata" opacity="0.0" />              
              <ColorMapEntry label="0,1 km" color="#046a8f" quantity="1" opacity="0" />
              <ColorMapEntry label="0,1 km" color="#66dff8" quantity="2" opacity="1" />
              <ColorMapEntry label="1 km" color="#2a97b8" quantity="11" opacity="1" />
              <ColorMapEntry label="2 km" color="#7febfd" quantity="21" opacity="1" />
              <ColorMapEntry label="3 km" color="#318324" quantity="31" opacity="1" />
              <ColorMapEntry label="4 km" color="#acda31" quantity="41" opacity="1" />
              <ColorMapEntry label="5 km" color="#fdfa2c" quantity="51" opacity="1" />
              <ColorMapEntry label="6 km" color="#f9b217" quantity="61" opacity="1" />
              <!--<ColorMapEntry label="7 km" color="#f9b217" quantity="71" opacity="1" />
              <ColorMapEntry label="8 km" color="#f9b217" quantity="81" opacity="1" />-->
              <ColorMapEntry label="7 km" color="#a30f0f" quantity="91" opacity="1" />
              <ColorMapEntry label="8 km" color="#f562ce" quantity="101" opacity="1" />
              <ColorMapEntry label="9 km" color="#742aa4" quantity="111" opacity="1" />
              <ColorMapEntry label="10 km" color="#cc95fb" quantity="121" opacity="1" />
              <ColorMapEntry label="yli 10 km" color="#e7e0fa" quantity="122" opacity="1" />     
              <ColorMapEntry color="#CCCCCC" quantity="254" label="nodata" opacity="0.1" />              
              <ColorMapEntry color="#CCCCCC" quantity="255" label="nodata" opacity="0.1" />              
            </ColorMap>
          </RasterSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>