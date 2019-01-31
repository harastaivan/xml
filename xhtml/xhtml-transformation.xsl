<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                encoding="utf-8" indent="yes"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
            <head>
                <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
                <meta http-equiv="content-language" content="en"/>
                <meta name="author" content="Ivan Harašta"/>
                <title>xHTML Countries</title>
                <link rel="stylesheet" type="text/css" href="./css/github-markdown.css"/>
            </head>
            <body>
                <div id="main" class="markdown-body centered">
                    <div id="content" class="countries">
                        <div>
                            <h3>The World Factbook of Countries</h3>
                            <p>harasiva</p>
                        </div>
                        <hr/>
                                <xsl:for-each select="countries/country">
                                    <div class="country">
                                        <h1>
                                            <xsl:value-of select="name"/>
                                        </h1>

                                        <xsl:if test="string(images)">
                                            <div class="right-box">
                                                <xsl:element name="img">
                                                    <xsl:attribute name="src">../resources/<xsl:value-of select="@id"/>/<xsl:value-of select="images/image/filename"/></xsl:attribute>
                                                    <xsl:attribute name="class">smaller</xsl:attribute>
                                                    <xsl:attribute name="align">right</xsl:attribute>
                                                    <xsl:attribute name="alt"><xsl:value-of select="images/image/text"/></xsl:attribute>
                                                </xsl:element>
                                            </div>
                                        </xsl:if>

                                        <h2>Government</h2>
                                        <ul>
                                            <li>
                                                <strong>Chief of State: </strong>
                                                <xsl:value-of select="government/chief-of-state/person/name"/>
                                            </li>
                                            <li>
                                                <strong>Head of Government: </strong>
                                                <xsl:value-of select="government/head-of-government/person/name"/>
                                            </li>
                                            <li>
                                                <strong>Government Type: </strong>
                                                <xsl:value-of select="government/government-type/text"/>
                                            </li>
                                            <li>
                                                <strong>Capital: </strong>
                                                <xsl:value-of select="government/capital/city/name"/>
                                            </li>
                                            <li>
                                                <strong>Legislature: </strong>
                                                <ul>
                                                    <xsl:for-each select="government/legislature/house">
                                                        <li>
                                                            <xsl:value-of select="./name"/> or <xsl:value-of select="./original-name"/> (<xsl:value-of select="./seats"/> seats)
                                                        </li>
                                                    </xsl:for-each>
                                                </ul>
                                            </li>
                                            <li>
                                                <strong>Judiciary: </strong>
                                                <ul>
                                                    <xsl:for-each select="government/judiciary/court">
                                                        <li>
                                                            <xsl:value-of select="./name"/> (<xsl:value-of select="./members"/> members)
                                                        </li>
                                                    </xsl:for-each>
                                                </ul>
                                            </li>
                                        </ul>

                                        <h2>Geography</h2>
                                        <ul>
                                            <li><strong>Area: </strong>
                                                <ul>
                                                    <li>
                                                        Total: <xsl:value-of select="geography/area/total"/>&#160;<xsl:value-of
                                                            select="geography/area/unit"/>
                                                    </li>
                                                    <li>
                                                        Land: <xsl:value-of select="geography/area/land"/>&#160;<xsl:value-of
                                                            select="geography/area/unit"/>
                                                    </li>
                                                    <li>
                                                        Water: <xsl:value-of select="geography/area/water"/>&#160;<xsl:value-of
                                                            select="geography/area/unit"/>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><strong>Climate: </strong>
                                                <ul>
                                                    <xsl:for-each select="geography/climate/text">
                                                        <li>
                                                            <xsl:value-of select="."/>
                                                        </li>
                                                    </xsl:for-each>
                                                </ul>
                                            </li>
                                            <li><strong>Natural resources: </strong>
                                                <ul>
                                                    <xsl:for-each select="geography/natural-resources/natural-resource">
                                                        <li>
                                                            <xsl:value-of select="."/>
                                                        </li>
                                                    </xsl:for-each>
                                                </ul>
                                            </li>
                                        </ul>

                                        <h2>Society</h2>
                                        <ul>
                                            <li>
                                                <strong>Population: </strong>
                                                <xsl:value-of select="society/population/total"/>&#160;<xsl:value-of select="society/population/unit"/>
                                            </li>
                                            <li>
                                                <strong>Language: </strong>
                                                <xsl:value-of select="society/language/official/name"/> (official) <xsl:value-of select="society/language/official/percentage"/>%
                                                <xsl:for-each select="society/language/unofficial">, <xsl:value-of select="./name"/>&#160;<xsl:value-of select="./percentage"/>%</xsl:for-each>,
                                                other <xsl:value-of select="society/language/other/percentage"/>%
                                            </li>
                                        </ul>

                                        <h2>Economy</h2>
                                        <ul>
                                            <li>
                                                <strong>Economic Overview: </strong>
                                                <xsl:value-of select="economy/overview/text"/>
                                            </li>
                                            <li>
                                                <strong>GDP: </strong>
                                                $<xsl:value-of select="economy/gdp/dollar"/>&#160;<xsl:value-of select="economy/gdp/unit"/>
                                            </li>
                                            <li>
                                                <strong>GDP per capita: </strong>
                                                $<xsl:value-of select="economy/gdp-per-capita/dollar"/>
                                            </li>
                                        </ul>
                                    </div>
                                </xsl:for-each>
                    </div>

                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
