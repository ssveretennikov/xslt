<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"
				encoding="UTF-8"
				indent="yes"/>

	<xsl:variable name="vUpper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
	<xsl:variable name="vLower" select="'abcdefghijklmnopqrstuvwxyz'"/>
	<xsl:variable name="vAlpha" select="concat($vUpper, $vLower)"/>

	<xsl:key name="authors" match="/library/authors/author" use="id"/>

	<!--	копирование всего xml-->
	<xsl:import href="_identity.xsl"/>

	<!--	мьютим лишних авторов -->
	<xsl:template match="book/authors/id
			[
				string-length(key('authors', .)/name)
				=
				string-length(translate(key('authors', .)/name, $vAlpha, ''))
			]
		">
	</xsl:template>

	<!--	убираем тег authors если нет авторов -->
	<xsl:template match="//book/authors
			[
			count(id[string-length(key('authors', .)/name) = string-length(translate(key('authors', .)/name, $vAlpha, ''))])
			= count(id)
			]
	">
	</xsl:template>

	<!--	мьютим справочник авторов-->
	<xsl:template match="library/authors"/>

</xsl:stylesheet>