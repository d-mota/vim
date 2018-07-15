<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:template match="/">
		<xsl:for-each select="//form-bean">
			<xsl:call-template name="forms"/>
		</xsl:for-each>
		<xsl:for-each select="//action">
			<xsl:call-template name="actions"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="forms">
		<xsl:text>form,</xsl:text>
		<xsl:value-of select="@type"/>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="@name"/>
		<xsl:text>
</xsl:text>
	</xsl:template>
	<xsl:template name="actions">
		<xsl:text>action,</xsl:text>
		<xsl:value-of select="@type"/>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="@name"/>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="@path"/>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="@input"/>
		<xsl:text>
</xsl:text>
	</xsl:template>
</xsl:stylesheet>
