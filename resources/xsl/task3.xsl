<?xml version='1.0'?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--	old-->
<!--	<xsl:template match="/">-->
<!--		<xsl:for-each select="/library/authors/author/name">-->
<!--			<xsl:value-of select="'Author - '"/>-->
<!--			<xsl:value-of select="substring(self::*,1,6)"/>,-->
<!--			<xsl:text>&#10;</xsl:text>-->
<!--		</xsl:for-each>-->
<!--	</xsl:template>-->

	<xsl:template match="/">
		<xsl:apply-templates select="/library/authors/author/name"/>
	</xsl:template>

<!--	<xsl:template match="/library/authors/author/name">-->
	<xsl:template match="name">
<!--		<xsl:value-of select="'Author - '"/>-->
<!--		<xsl:value-of select="substring(.,1,6)"/>,-->
		<xsl:text>&#10;</xsl:text>
		<xsl:value-of select="concat('Author - ', substring(.,1,6), ',')"/>
	</xsl:template>

</xsl:stylesheet>