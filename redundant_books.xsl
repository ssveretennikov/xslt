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

	<!--	мьютим лишние книги-->
	<xsl:template match="book
			[
				string-length(key('authors', authors/id)/name)
				=
				string-length(translate(key('authors', authors/id)/name, $vAlpha, ''))
			]
		">
	</xsl:template>

	<!--	мьютим справочник авторов-->
	<xsl:template match="library/authors"/>

</xsl:stylesheet>