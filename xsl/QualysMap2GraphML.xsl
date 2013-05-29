<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" encoding="UTF-8"/>

<xsl:template match="/">
<graphml xmlns="http://graphml.graphdrawing.org/xmlns"
	 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	 xsi:schemaLocation="http://graphml.graphdrawing.org/xmlns http://graphml.graphdrawing.org/xmlns/1.0/graphml.xsd">
	<!-- Definition des keys -->
	<key id="hostname" for="node" attr.name="hostname" attr.type="string"/>
	<key id="netbios" for="node" attr.name="netbios" attr.type="string"/>
	<key id="os" for="node" attr.name="os" attr.type="string"/>
	<key id="live" for="node" attr.name="live" attr.type="int"/>
	<key id="scannable" for="node" attr.name="scannable" attr.type="int"/>
	<key id="approved" for="node" attr.name="approved" attr.type="int"/>
	<!-- Debut du graphique -->
	<graph id="Qualys-MAP" edgedefault="undirected">
		<!-- Recuperation de tous les HOST -->
		<xsl:apply-templates select="/MAPREPORT/HOST_LIST/HOST"/>
	</graph>
</graphml>
</xsl:template>

<xsl:template match="HOST" xmlns="http://graphml.graphdrawing.org/xmlns">
	<!-- Pour chaque HOST, on definit un node ayant comme id l'adresse IP, donc unique -->
	 <node 	id="{IP}">
	 	<data key="hostname"><xsl:value-of select="HOSTNAME"/></data>
	 	<data key="netbios"><xsl:value-of select="NETBIOS"/></data>
	 	<data key="os"><xsl:value-of select="OS"/></data>
	 	<data key="live"><xsl:value-of select="LIVE"/></data>
	 	<data key="scannable"><xsl:value-of select="SCANNABLE"/></data>
	 	<data key="approved"><xsl:value-of select="APPROVED"/></data>
	 </node>
	  <!-- Si cet HOST a un ROUTER, ajouter un node ayant comme id l'IP du ROUTER,
               ainsi qu'un arc entre le ROUTER (target) et l'HOST (source) -->
	 <xsl:if test="ROUTER != ''">
		<node id="{ROUTER}"/>
		<edge source="{IP}" target="{ROUTER}"/>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>
