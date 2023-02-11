<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!--	копирование всего xml. * импорт должен осуществляться до всех других операций	-->
	<xsl:import href="_identity.xsl"/>

	<xsl:output method="xml"
				encoding="UTF-8"
				indent="yes"/>

	<xsl:variable name="vUpper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
	<xsl:variable name="vLower" select="'abcdefghijklmnopqrstuvwxyz'"/>
	<xsl:variable name="vAlpha" select="concat($vUpper, $vLower)"/>

	<xsl:key name="authors" match="/library/authors/author" use="id"/>

	<!--	мьютим лишние книги-->
	<xsl:template match="book
			[
			count(authors/id[string-length(key('authors', .)/name) = string-length(translate(key('authors', .)/name, $vAlpha, ''))])
			= count(authors/id)
			]
		">
	</xsl:template>

	<!--	мьютим справочник авторов-->
	<xsl:template match="library/authors"/>

</xsl:stylesheet>