<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld      http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>Radar rr12h and rr24h</Name>
    <UserStyle>
      <Name>Radar rr12h and rr24h</Name>
      <Title>Radar rr12h and rr24h</Title>
      <Abstract>Radar rr12h and rr24h</Abstract>
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
              <ColorMapEntry color="#CCCCCC" quantity="9.5" label="nodata" opacity="0" />        
              <ColorMapEntry label="0,1" quantity="10" color="#31399f" opacity="1" />
 <ColorMapEntry label="0,2" quantity="20" color="#5c67b6" opacity="1" />
<ColorMapEntry label="0,3" quantity="30" color="#8391c9" opacity="1" />
<ColorMapEntry label="0,4" quantity="40" color="#b5c6e4" opacity="1" />
<ColorMapEntry label="0,5" quantity="50" color="#25044" opacity="1" />
<ColorMapEntry label="0,6" quantity="60" color="#2d7257" opacity="1" />
<ColorMapEntry label="0,7" quantity="70" color="#589570" opacity="1" />
<ColorMapEntry label="0,8" quantity="80" color="#83b789" opacity="1" />
<ColorMapEntry label="0,9" quantity="90" color="#a1d394" opacity="1" />
<ColorMapEntry label="1" quantity="100" color="#d4eaf6" opacity="1" />
<ColorMapEntry label="1,5" quantity="150" color="#b5d9ed" opacity="1" />
<ColorMapEntry label="2" quantity="200" color="#93c6e4" opacity="1" />
<ColorMapEntry label="2,5" quantity="250" color="#5da9d5" opacity="1" />
<ColorMapEntry label="3" quantity="300" color="#3b91c1" opacity="1" />
<ColorMapEntry label="3,5" quantity="350" color="#2376a3" opacity="1" />
<ColorMapEntry label="4" quantity="400" color="#0e5d87" opacity="1" />
<ColorMapEntry label="4,5" quantity="450" color="#0e5d87" opacity="1" />
<ColorMapEntry label="5" quantity="500" color="#cef532" opacity="1" />
<ColorMapEntry label="5,5" quantity="550" color="#edf73b" opacity="1" />
<ColorMapEntry label="6" quantity="600" color="#eee10f" opacity="1" />
<ColorMapEntry label="6,5" quantity="650" color="#ebcb0d" opacity="1" />
<ColorMapEntry label="7" quantity="700" color="#e8b30a" opacity="1" />
<ColorMapEntry label="7,5" quantity="750" color="#e59b07" opacity="1" />
<ColorMapEntry label="8" quantity="800" color="#e18103" opacity="1" />
<ColorMapEntry label="8,5" quantity="850" color="#de6a01" opacity="1" />
<ColorMapEntry label="9" quantity="900" color="#d45802" opacity="1" />
<ColorMapEntry label="9,5" quantity="950" color="#cb4002" opacity="1" />
<ColorMapEntry label="10" quantity="1000" color="#6b0b01" opacity="1" />
<ColorMapEntry label="10,5" quantity="1050" color="#83231a" opacity="1" />
<ColorMapEntry label="11" quantity="1100" color="#9b3b32" opacity="1" />
<ColorMapEntry label="11,5" quantity="1150" color="#b3534a" opacity="1" />
<ColorMapEntry label="12" quantity="1200" color="#c5645c" opacity="1" />
<ColorMapEntry label="12,5" quantity="1250" color="#da7971" opacity="1" />
<ColorMapEntry label="13" quantity="1300" color="#ec8b82" opacity="1" />
<ColorMapEntry label="13,5" quantity="1350" color="#faa09a" opacity="1" />
<ColorMapEntry label="14" quantity="1400" color="#fdb9b4" opacity="1" />
<ColorMapEntry label="14,5" quantity="1450" color="#fcd2cf" opacity="1" />
<ColorMapEntry label="15" quantity="1500" color="#36023d" opacity="1" />
<ColorMapEntry label="16" quantity="1600" color="#460345" opacity="1" />
<ColorMapEntry label="17" quantity="1700" color="#5e0351" opacity="1" />
<ColorMapEntry label="18" quantity="1800" color="#761965" opacity="1" />
<ColorMapEntry label="19" quantity="1900" color="#852f76" opacity="1" />
<ColorMapEntry label="20" quantity="2000" color="#974889" opacity="1" />
<ColorMapEntry label="21" quantity="2100" color="#af6aa3" opacity="1" />
<ColorMapEntry label="22" quantity="2200" color="#c283b6" opacity="1" />
<ColorMapEntry label="23" quantity="2300" color="#d39bc9" opacity="1" />
<ColorMapEntry label="24" quantity="2400" color="#f0bae7" opacity="1" />
<ColorMapEntry label="25" quantity="2500" color="#2b0355" opacity="1" />
<ColorMapEntry label="27,5" quantity="2750" color="#3e1766" opacity="1" />
<ColorMapEntry label="30" quantity="3000" color="#502b77" opacity="1" />
<ColorMapEntry label="32,5" quantity="3250" color="#65418c" opacity="1" />
<ColorMapEntry label="35" quantity="3500" color="#7a579c" opacity="1" />
<ColorMapEntry label="37,5" quantity="3750" color="#9676b6" opacity="1" />
<ColorMapEntry label="40" quantity="4000" color="#b294cf" opacity="1" />
<ColorMapEntry label="42,5" quantity="4250" color="#c9aadc" opacity="1" />
<ColorMapEntry label="45" quantity="4500" color="#be8dd6" opacity="1" />
<ColorMapEntry label="47,5" quantity="4750" color="#d776e8" opacity="1" />
<ColorMapEntry label="50" quantity="5000" color="#f516f7" opacity="1" />
<ColorMapEntry label="55" quantity="5500" color="#f10d97" opacity="1" />
<ColorMapEntry label="60" quantity="6000" color="#e00963" opacity="1" />
<ColorMapEntry label="65" quantity="6500" color="#d00d0c" opacity="1" />
<ColorMapEntry label="70" quantity="7000" color="#e40617" opacity="1" />
<ColorMapEntry label="75" quantity="7500" color="#f90807" opacity="1" />
<ColorMapEntry label="80" quantity="8000" color="#db0c0e" opacity="1" />
<ColorMapEntry label="85" quantity="8500" color="#c1080a" opacity="1" />
<ColorMapEntry label="90" quantity="9000" color="#a6070a" opacity="1" />
<ColorMapEntry label="95" quantity="9500" color="#8d070a" opacity="1" />
<ColorMapEntry label="100" quantity="10000" color="#0309fb" opacity="1" />
<ColorMapEntry label="110" quantity="11000" color="#4347fa" opacity="1" />
<ColorMapEntry label="120" quantity="12000" color="#676bfa" opacity="1" />
<ColorMapEntry label="130" quantity="13000" color="#9799fa" opacity="1" />
<ColorMapEntry label="140" quantity="14000" color="#b5b7f9" opacity="1" />
<ColorMapEntry label="150" quantity="15000" color="#cacbf9" opacity="1" />
<ColorMapEntry label="160" quantity="16000" color="#dedff9" opacity="1" />
<ColorMapEntry label="170" quantity="17000" color="#f9f9fa" opacity="1" />
<ColorMapEntry label="180" quantity="18000" color="#dbdbdb" opacity="1" />
<ColorMapEntry label="190" quantity="19000" color="#bdbdbe" opacity="1" />
<ColorMapEntry label="200" quantity="20000" color="#8a8a8b" opacity="1" /> 
  <ColorMapEntry color="#cccccc" quantity="65530" label="nodata" opacity="0.15" />             
              <ColorMapEntry color="#cccccc" quantity="65535" label="nodata" opacity="0.15" />              
            </ColorMap>
          </RasterSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>