<?xml version="1.0"?>

<!--
    Document   : timetable.xsl
    Created on : April 5, 2016, 12:42 PM
    Author     : sivanalkalay
    Description:
        Purpose of transformation follows.
-->


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Timetable for Lab10</title>
            </head>
            <h2>Timetable by Periods</h2>
            <table>
                <xsl:call-template name='titles'/>
                <xsl:call-template name='blocks'/>
            </table>
        </html>
    </xsl:template>
    
    <xsl:template name='titles'>
        <thead>
            <tr>
                <th></th>
                <xsl:for-each select='/timetable/periods/period'>
                    <th>
                        <xsl:value-of select='./@time'/>
                    </th>
                </xsl:for-each>
            </tr>
        </thead>        
    </xsl:template>
    
    <xsl:template name='blocks'>            
        <xsl:for-each select='/timetable/days/day'>
            <xsl:variable name='currentDay' select='./@whicday'/>
            <tr>
                <td>
                    <xsl:value-of select='$currentDay'/>
                </td>
                <xsl:for-each select='/timetable/periods/period'>
                    <td>
                        <xsl:for-each select='./pslot'>
                            <xsl:if test='./@whichday = $currentDay'>
                                <xsl:value-of select='./type'/>
                                <br/>
                                <xsl:value-of select='./instructor'/>
                                <br/>
                                <xsl:value-of select='./room'/>
                                <br/>
                                <xsl:value-of select='./course'/>
                                <br/>
                            </xsl:if>
                        </xsl:for-each>
                    </td>              
                </xsl:for-each> 
            </tr> 
        </xsl:for-each>               
    </xsl:template>
</xsl:stylesheet>