<?xml version = "1.0" ?>
<xsl:stylesheet version = "1.0" xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name='FirstTab' select='0'/>
	
	<xsl:template match = "/">
   		<html>	
   		<head>
		   	<style type='text/css'>
				body {  font-family: verdana; font-size:11; color: #000000}
				td {  font-family: verdana; font-size:11; color: #000000}
				
   			</style>
			
			<script type="text/javascript"><![CDATA[ 
			function PoptabDefender()
			{
				PopDiv( 0 )
			}

			function PoptabTalent2()
			{
				PopDiv( 1 )
			}
			
			function PoptabTalent3()
			{
				PopDiv( 2 )
			}
			
			function PoptabTalent4()
			{
				PopDiv( 3 )
			}
			
			function PoptabTalent5()
			{
				PopDiv( 4 )
			}
			
			function PoptabTalent6()
			{
				PopDiv( 5 )
			}

			function PopDiv( PopIdx )
			{
				var arrDivs = [ tabDefender, tabTalent2, tabTalent3, tabTalent4, tabTalent5, tabTalent6 ]
				var arrTabs = [ TabtabDefender, TabtabTalent2, TabtabTalent3, TabtabTalent4, TabtabTalent5, TabtabTalent6 ]
				for( i=0; i<6; i=i+1 ) {
					if( i == PopIdx ) {
						arrTabs[i].style.background="black"
						arrDivs[i].style.display = ""
					} 	else 	{
						arrTabs[i].style.background="grey"
						arrDivs[i].style.display = "none"
					}
				}
			}
			]]></script>

		</head>
   		<body bgcolor="white">
   			<xsl:apply-templates select="UI"/>
		</body>   			
   		</html>
	</xsl:template>

	<xsl:template match="UI">		<div style="left:5pt;position:absolute">
			<xsl:apply-templates select="Frame"/>		</div>
	</xsl:template>
	<xsl:template match="Frame">		<xsl:apply-templates select="Controls" />	</xsl:template>
	<xsl:template match="Controls">
		<xsl:apply-templates select="TabCtrl"/>
		<xsl:apply-templates select="TalentSlot"/>
		<xsl:apply-templates select="Picture"/>
	</xsl:template>
	<xsl:template match="TabCtrl">
		<div style="left:{Layout/Location/@x}pt;top:{Layout/Location/@y}pt;width:{Layout/Size/@w}pt;height:{Layout/Size/@h}pt;position:absolute; background:grey;">
			<xsl:apply-templates select="TabPages"/>
		</div>
	</xsl:template>
	<xsl:template match="TabPages">
		<xsl:apply-templates select="TabPage"/>
	</xsl:template>
	
	<xsl:template match="TabPage">
		<xsl:choose>
			<xsl:when test="@name='tabDefender' ">
				<div id="Tab{@name}" style="left:{Tab/Layout/Location/@x}pt;top:{Tab/Layout/Location/@y}pt;width:{Tab/Layout/Size/@w}pt;height:{Tab/Layout/Size/@h}pt;position:absolute; background:black;" OnClick="Pop{@name}()" OnMouseOver='this.style.cursor="hand"'>
					<table width="100%" height="100%"><tr><td align="center"><font color="white"><xsl:value-of select="Tab/Shape/Text/text()" /> </font></td></tr></table>
				</div>
				<div id="{@name}" style="display:">
					<xsl:apply-templates select="Page"/>
				</div>			
			</xsl:when>
			<xsl:otherwise>
				<div id="Tab{@name}" style="left:{Tab/Layout/Location/@x}pt;top:{Tab/Layout/Location/@y}pt;width:{Tab/Layout/Size/@w}pt;height:{Tab/Layout/Size/@h}pt;position:absolute; background:grey;" OnClick="Pop{@name}()" OnMouseOver='this.style.cursor="hand"'>
					<table width="100%" height="100%"><tr><td align="center"><font color="white"><xsl:value-of select="Tab/Shape/Text/text()" /> </font></td></tr></table>
				</div>
				<div id="{@name}" style="display:none">
					<xsl:apply-templates select="Page"/>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="Page">
		<div style="left:{Layout/Location/@x}pt;top:{Layout/Location/@y}pt;width:{Layout/Size/@w}pt;height:{Layout/Size/@h}pt;position:absolute; background:#f0f0f0;">
			<xsl:apply-templates select="Controls" />
		</div>
	</xsl:template>
	<xsl:template match="TalentSlot">
		<div style="left:{Layout/Location/@x}pt;top:{Layout/Location/@y}pt;width:{Layout/Size/@w}pt;height:{Layout/Size/@h}pt;position:absolute; background:#505010;border:1px solid black;z-index:1;" >
			<IMAGE src="../icon/{Talents/ID/text()}.png" width="100%" height="100%"/>
			<div style="left:0 pt;top:{Layout/Size/@h} pt;width:{Layout/Size/@w}pt;height:{Layout/Size/@h}pt;position:absolute;z-index:2;" >
				<xsl:value-of select="Talents/ID/text()" /><br/>
				( <xsl:value-of select="count(Talents/ID)"/> )
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Picture">
		<div style="left:{Layout/Location/@x}pt;top:{Layout/Location/@y}pt;width:{Layout/Size/@w}pt;height:{Layout/Size/@h}pt;position:absolute; background:#cccccc;" >
		</div>
	</xsl:template>
</xsl:stylesheet>