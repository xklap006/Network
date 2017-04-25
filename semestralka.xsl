<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"/>
    
    <xsl:template match="/network">
        {
        "settings_privacy":[
        <xsl:for-each select="settings_privacy/user[gender = 'male'or gender = 'Male' or gender = 'MALE']">
            <xsl:sort select="username" order="descending"/>
            
            {
            "Email": "<xsl:value-of select="email" />",
            "Language": "<xsl:value-of select="language" />",
            "Gender": "<xsl:value-of select="gender" />",
            "Time Zone": "<xsl:value-of select="time_zone" />",
            "Email verification": "<xsl:value-of select="security/email_login_verification"/>",
            "Country": "<xsl:value-of select="content/country"/>"
                            
            "country": <xsl:choose>
                <xsl:when test="settings_privacy/user/content[country = 'Czech Republic']">
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
