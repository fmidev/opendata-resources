<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld      http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>Radar doppler</Name>
    <UserStyle>
      <Name>>Radar doppler</Name>
      <Title>>Radar doppler</Title>
      <Abstract>>Radar doppler speed colors</Abstract>
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
              <ColorMapEntry color="#CCCCCC" quantity="0.9" label="nodata" opacity="0" />
              
              <ColorMapEntry color="#0b0683" quantity="1" label="48 m/s kohti" opacity="1" />
              <ColorMapEntry color="#b2affa" quantity="21" label="40 m/s kohti" opacity="1" />
              <ColorMapEntry color="#38fc54" quantity="22" label="40 m/s kohti" opacity="1" />
              <ColorMapEntry color="#01430f" quantity="74" label="20 m/s kohti" opacity="1" />
              <ColorMapEntry color="#014e4b" quantity="75" label="20 m/s kohti" opacity="1" />             
              <ColorMapEntry color="#43fbf5" quantity="126" label="> 0 m/s kohti" opacity="1" />
              <ColorMapEntry color="#eaf6f6" quantity="127" label="> 0 m/s kohti" opacity="1" />
              
              <ColorMapEntry color="#ffffff" quantity="128" label="0 m/s" opacity="1" />
              
              <ColorMapEntry color="#f3e4e4" quantity="129" label="> 0 m/s pois" opacity="1" />
              <ColorMapEntry color="#fa4845" quantity="130" label="10 m/s pois" opacity="1" />
              <ColorMapEntry color="#640206" quantity="180" label="20 m/s pois" opacity="1" />
              <ColorMapEntry color="#e74303" quantity="181" label="20 m/s pois" opacity="1" />
              <ColorMapEntry color="#fdec78" quantity="233" label="40 m/s pois" opacity="1" />
              <ColorMapEntry color="#f98ef3" quantity="234" label="40 m/s pois" opacity="1" />
              <ColorMapEntry color="#9d0394" quantity="253" label="48 m/s pois" opacity="1" />
              
              <ColorMapEntry color="#CCCCCC" quantity="254" label="nodata" opacity="0.15"/>
              <ColorMapEntry color="#CCCCCC" quantity="255" label="nodata" opacity="0.15"/>                
            </ColorMap>
          </RasterSymbolizer>
          <!--<RasterSymbolizer>
            <Opacity>1.0</Opacity>
            <ChannelSelection>
              <GrayChannel>                
                <SourceChannelName>2</SourceChannelName>                
                </GrayChannel>
            </ChannelSelection>
            <ColorMap>        
              <ColorMapEntry color="#CCCCCC" quantity="0" label="nodata" opacity="0.15" />              
            </ColorMap>
          </RasterSymbolizer>-->
        </Rule>        
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>