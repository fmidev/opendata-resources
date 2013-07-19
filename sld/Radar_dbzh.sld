<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld      http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>Radar dbz summer</Name>
    <UserStyle>
      <Name>Radar dbz summer</Name>
      <Title>Radar dbz summer</Title>
      <Abstract>Radar dbz summer</Abstract>
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
              <ColorMapEntry color="#CCCCCC" quantity="74" label="nodata" opacity="0" />              
              <ColorMapEntry color="#6cebf3" quantity="80" label="kohtalainen" opacity="1" />
              <ColorMapEntry color="#58c797" quantity="88" label="kohtalainen" opacity="1" />
              <ColorMapEntry color="#409857" quantity="100" label="sakea" opacity="1" />
              <ColorMapEntry color="#f1f35a" quantity="112" label="sakea" opacity="1" />
              <ColorMapEntry color="#dfc40a" quantity="124" label="hyvin sakea" opacity="1" />
              <ColorMapEntry color="#eb951a" quantity="132" label="hyvin sakea" opacity="1" />
              <ColorMapEntry color="#e85616" quantity="144" label="hyvin sakea" opacity="1" />
              <ColorMapEntry color="#ce0202" quantity="156" label="hyvin sakea" opacity="1" />
              <ColorMapEntry color="#830a46" quantity="168" label="hyvin sakea" opacity="1" />
              <ColorMapEntry color="#fa51a5" quantity="180" label="hyvin sakea" opacity="1" />              
              <ColorMapEntry color="#CCCCCC" quantity="201" label="nodata" opacity="0.2" />              
              <ColorMapEntry color="#CCCCCC" quantity="255" label="nodata" opacity="0.2" />              
            </ColorMap>
          </RasterSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>