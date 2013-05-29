<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" encoding="UTF-8"/>

 <xsl:template match="/">
	<MAPREPORT>
		<HOST_LIST>
			
			<xsl:copy-of select="document('Map_Results_username_qualys_20130405_0.xml')/MAPREPORT/HOST_LIST/HOST"/>
			<xsl:copy-of select="document('Map_Results_username_qualys_20130405_1.xml')/MAPREPORT/HOST_LIST/HOST"/>
			<xsl:copy-of select="document('Map_Results_username_qualys_20130405_2.xml')/MAPREPORT/HOST_LIST/HOST"/>
			
		</HOST_LIST>
	</MAPREPORT>
 </xsl:template>
</xsl:stylesheet>
