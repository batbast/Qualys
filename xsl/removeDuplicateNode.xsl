<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:graphml="http://graphml.graphdrawing.org/xmlns">
<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" encoding="UTF-8"/>

<!--
Identity transform: copy elements and attributes from input file as is
-->
<xsl:template match="node() | @*">
	<xsl:copy>
		<xsl:apply-templates select="node() | @*"/>
	</xsl:copy>
</xsl:template>

<!--
Drop <node> elements with a preceding <node> sibling that has the same
@id attribute value as the current element
-->
<xsl:template match="graphml:node[preceding-sibling::graphml:node[@id = current()/@id]]"/>

<!--
Drop <edge> elements with a preceding <edge> sibling that has the same
@target AND @source attributes values as the current element
@target and @source can be swaped
-->
<xsl:template match="graphml:edge[preceding-sibling::graphml:edge[(@target = current()/@target and @source = current()/@source) or (@source = current()/@target and @target = current()/@source)]]"/>

</xsl:stylesheet>
