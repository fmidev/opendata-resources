<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld      http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>Hydroclass</Name>
    <UserStyle>
      <Name>Hydroclass</Name>
      <Title>Hydroclass</Title>
      <Abstract>Hydroclass</Abstract>
      <FeatureTypeStyle>
        <Rule>
          <RasterSymbolizer>
            <Opacity>1.0</Opacity>
            <ChannelSelection>
              <GrayChannel>
                <SourceChannelName>1</SourceChannelName>
              </GrayChannel>
            </ChannelSelection>
            <ColorMap type="values">      
              <ColorMapEntry color="#754a01" quantity="1" label="ei-meteorologinen kohde" opacity="0"/>             
              <ColorMapEntry color="#04857a" quantity="2" label="vesisade" opacity="0.8" />
              <ColorMapEntry color="#33d3fa" quantity="3" label="m?rk? lumi" opacity="0.8" />
              <ColorMapEntry color="#046fa6" quantity="4" label="kuiva lumi" opacity="0.8" />
              <ColorMapEntry color="#fca50c" quantity="5" label="lumirakeita" opacity="0.8" />
              <ColorMapEntry color="#bb1717" quantity="6" label="j??rakeita" opacity="0.8" />
              <ColorMapEntry color="#cccccc" quantity="255" label="nodata" opacity="0.15" />                                                  
            </ColorMap>
          </RasterSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>