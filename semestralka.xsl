<?xml version="1.0" encoding="UTF-8"?>
<!-- Odkaz na GitHub https://github.com/xklap006/Network/blob/master/semestralka.xsl -->
<!-- Vypíše uživatelé, kteří mají pohlaví "male" nebo "Male" nebo "MALE" a pokud jsou z "Czech Republic", tak vypíše "Country: Citizen" jinak "Foreigner" -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"/>
    
    <xsl:template match="/network">
        {
        "settings_privacy":[
        <xsl:for-each select="account/settings_privacy/user[gender = 'male'or gender = 'Male' or gender = 'MALE']">
            <xsl:sort select="account/settings_privacy/user/username" order="descending"/>
            
            {
            "Username": "<xsl:value-of select="username" />",
            "Email": "<xsl:value-of select="email" />",
            "Language": "<xsl:value-of select="language" />",
            "Gender": "<xsl:value-of select="gender" />",
            "Time Zone": "<xsl:value-of select="time_zone" />",
            "Email verification": "<xsl:value-of select="security/email_login_verification"/>",               
            "Country": <xsl:choose>
                <xsl:when test="content[country = 'Czech Republic']">
                    "Citizen"
                </xsl:when>
                <xsl:otherwise>
                    "Foreigner"    
                </xsl:otherwise>     
            </xsl:choose>        
            }<xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
        ]        
        }
    </xsl:template>

</xsl:stylesheet>
