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
                <link rel="stylesheet" type="text/css" href="./css/xhtml-output.css"/>
            </head>
            <body>
                <div id="bg-stripes"></div>
                <div id="bg-top-line"></div>
                <div id="main-wrapper" class="centered">
                    <div id="header">
                        <div id="main-title" class="l-float c-white">HTML output of countries
                            <span class="c-red">(xHTML)</span>
                        </div>
                        <div id="log-info" class="r-float c-white">harasiva (BI-XML)</div>
                    </div>

                    <!-- ====== content ====== -->
                    <div id="content" class="b-yellow t-margin-15">
                        <div class="inner-pad-15">
                            <div id="inner-wrapper">

                                <xsl:for-each select="countries/country">
                                    <div class="box">
                                        <h2>
                                            <xsl:value-of select="name"/>
                                        </h2>

                                        <xsl:if test="string(images)">
                                            <div class="right-box">
                                                <xsl:element name="img">
                                                    <xsl:attribute name="src">../resources/<xsl:value-of select="@id"/>/<xsl:value-of select="images/image/filename"/></xsl:attribute>
                                                    <xsl:attribute name="class">main-logo</xsl:attribute>
                                                </xsl:element>
                                                <xsl:element name="span">
                                                    <xsl:value-of select="images/image/text"/>
                                                </xsl:element>
                                            </div>
                                        </xsl:if>

                                        <h3>Government</h3>
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

                                        <h3>Geography</h3>
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

                                        <h3>Society</h3>
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
                                    </div>
                                </xsl:for-each>

                            </div>
                        </div>
                    </div>
                    <!-- ====== content end ====== -->

                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
