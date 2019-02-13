<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">

    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

      <fo:layout-master-set>
         <fo:simple-page-master master-name="maintmpl" page-height="29.7cm" page-width="21.0cm"
                                margin-top="1.5cm" margin-bottom="1.5cm" margin-left="1.5cm" margin-right="1.5cm">

            <fo:region-body margin-top="1cm" margin-bottom="0.2cm" />
            <fo:region-before extent="1cm"/>
            <fo:region-after extent="1.5cm"/>

         </fo:simple-page-master>
     </fo:layout-master-set>

     <fo:page-sequence master-reference="maintmpl">

        <fo:static-content flow-name="xsl-region-before">
            <fo:block line-height="13pt" font-size="13pt" border-after-width="thin" border-after-style="solid" padding-bottom="2px"
                      text-align-last="justify">
                The World Factbook of Countries
                  <fo:leader leader-pattern="space" />
                harasiva
            </fo:block>
        </fo:static-content>

        <fo:static-content flow-name="xsl-region-after">
           <fo:block font-size="11pt" text-align="center" border-before-width="thin" border-before-style="solid" padding-top="10px" margin-top="5px">
            Page <fo:inline font-weight="bold"><fo:page-number/></fo:inline> of <fo:page-number-citation ref-id="last-page"/>
           </fo:block>
        </fo:static-content>

        <fo:flow flow-name="xsl-region-body">
            <fo:block break-before="page">

               <fo:block font-size="25pt" text-align="center" font-weight="bold" margin-bottom="20mm">
                  Navigation
               </fo:block>

               <xsl:for-each select="countries/country">
                 <fo:block text-align="left" font-weight="bold" font-size="25pt" margin-bottom="2mm">
                   <fo:basic-link internal-destination="{@id}">
                     <xsl:value-of select="name" />
                   </fo:basic-link>
                 </fo:block>
                 <fo:block text-align="left" font-size="14pt" margin-bottom="2mm">
                   <fo:basic-link internal-destination="{@id}_government">
                     Government
                   </fo:basic-link>
                 </fo:block>
                <fo:block text-align="left" font-size="14pt" margin-bottom="2mm">
                   <fo:basic-link internal-destination="{@id}_geography">
                     Geography
                   </fo:basic-link>
                 </fo:block>
                 <fo:block text-align="left" font-size="14pt" margin-bottom="2mm">
                   <fo:basic-link internal-destination="{@id}_society">
                     Society
                   </fo:basic-link>
                 </fo:block>
                 <fo:block text-align="left" font-size="14pt" margin-bottom="10mm">
                   <fo:basic-link internal-destination="{@id}_economy">
                     Economy
                   </fo:basic-link>
                 </fo:block>
               </xsl:for-each>

            </fo:block>
            <xsl:for-each select="countries/country">
              <fo:block break-before="page">

                 <fo:block text-align="center" font-weight="bold" font-size="25pt" id="{@id}">
                    <xsl:value-of select="name" />
                 </fo:block>
                 <fo:table table-layout="auto">
                   <fo:table-column column-width="50%"/>
                   <fo:table-column column-width="50%"/>
                   <fo:table-body>
                     <fo:table-row>
                        <xsl:for-each select="images/image">
                          <fo:table-cell>
                            <fo:block text-align="center">
                              <xsl:element name="fo:external-graphic">
                                 <xsl:attribute name="src">
                                       ./resources/<xsl:value-of select="../../@id"/>/<xsl:value-of select="./filename" />
                                 </xsl:attribute>
                                 <xsl:attribute name="content-width">200px</xsl:attribute>
                                 <xsl:attribute name="width">200px</xsl:attribute>
                              </xsl:element>
                            </fo:block>
                          </fo:table-cell>
                        </xsl:for-each>
                      </fo:table-row>
                    </fo:table-body>
                 </fo:table>
                 <fo:block text-align="left" font-weight="bold" font-size="18pt" id="{@id}_government" margin-bottom="4mm">
                    Government:
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Chief of State:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="government/chief-of-state/person/name" />
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Head of Government:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="government/head-of-government/person/name" />
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Government type:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="government/government-type/text" />
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Capital:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="government/capital/city/name" />
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Legislature:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:for-each select="government/legislature/house">
                        <xsl:if test="(position( )) > 1">, </xsl:if>
                        <xsl:value-of select="./original-name"/> or <xsl:value-of select="./name"/> (<xsl:value-of select="./seats"/> seats)
                    </xsl:for-each>
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Legislature:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:for-each select="government/judiciary/court">
                        <xsl:if test="(position( )) > 1">, </xsl:if>
                        <xsl:value-of select="./name"/> (<xsl:value-of select="./members"/> members)
                    </xsl:for-each>
                 </fo:block>
                  <fo:block text-align="left" font-weight="bold" font-size="18pt" id="{@id}_geography" margin-bottom="4mm">
                    Geography:
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Area:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    Total: <xsl:value-of select="geography/area/total" />&#160;<xsl:value-of select="geography/area/unit"/>,
                    Land: <xsl:value-of select="geography/area/land" />&#160;<xsl:value-of select="geography/area/unit"/>,
                    Water: <xsl:value-of select="geography/area/water" />&#160;<xsl:value-of select="geography/area/unit"/>
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Climate:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:for-each select="geography/climate/text">
                        <xsl:if test="(position( )) > 1">; </xsl:if>
                        <xsl:value-of select="."/>
                    </xsl:for-each>
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Natural resources:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:for-each select="geography/natural-resources/natural-resource">
                        <xsl:if test="(position( )) > 1">, </xsl:if>
                        <xsl:value-of select="."/>
                    </xsl:for-each>
                 </fo:block>
                 <fo:block text-align="left" font-weight="bold" font-size="18pt" id="{@id}_society" margin-bottom="4mm">
                    Society:
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Population:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="society/population/total" />&#160;<xsl:value-of select="society/population/unit"/>
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Languages:
                 </fo:block>
                 <fo:block font-size="12pt">
                   <xsl:for-each select='society/language/official'>
                        <xsl:value-of select="./name"/> (official) <xsl:if test="string(./percentage)"><xsl:value-of
                           select="./percentage"/>%</xsl:if>,
                   </xsl:for-each>
                     <xsl:for-each select='society/language/unofficial'>
                        <xsl:value-of select="./name"/>&#160;<xsl:if test="string(./percentage)"><xsl:value-of
                           select="./percentage"/>%</xsl:if>,
                   </xsl:for-each>
                     other <xsl:value-of select="society/language/other/percentage"/>%
                 </fo:block>
                 <fo:block text-align="left" font-weight="bold" font-size="18pt" id="{@id}_economy" margin-bottom="4mm">
                    Economy:
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Overview:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="economy/overview/text" />
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Gdp:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    $<xsl:value-of select="economy/gdp/dollar"/>&#160;<xsl:value-of select="economy/gdp/unit"/>
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Gdp per capita:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    $<xsl:value-of select="economy/gdp-per-capita/dollar"/>
                 </fo:block>
              </fo:block>
            </xsl:for-each>
            <fo:block id="last-page"/>
        </fo:flow>

     </fo:page-sequence>

    </fo:root>

  </xsl:template>
</xsl:stylesheet>