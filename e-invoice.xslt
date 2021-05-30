<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" indent="yes" doctype-system="about:legacy-compat"/>

	<xsl:template match="/">
		<html>
			<head>
				<style>
					td.lineTableTd {
					    border-width: 1px;
					    padding: 1px;
					    border-style: inset;
					    border-color: black;
					    background-color: white;
					}
					tr.lineTableTr {
					    border-width: 1px;
					    padding: 0px;
					    border-style: inset;
					    border-color: black;
					    background-color: black;
						-moz-border-radius:;

					}
					#lineTable {
					    border-width:1px;
					    border-spacing:;
					    border-style: inset;
					    border-color: black; 
						border-collapse: collapse;
						background-color:;
					}
				</style>
			</head>
			<body>
				<table border="1" id="lineTable" width="920px">
					<tbody>
						<tr id="lineTableTr">
							<td id="lineTableTd" style="width:3%">
								<span style="font-weight:bold; " align="center">
									<xsl:text>Item No</xsl:text>
								</span>
							</td>
							<td id="lineTableTd" style="width:3%">
								<span style="font-weight:bold; " align="center">
									<xsl:text>Product</xsl:text>
								</span>
							</td>
							<td id="lineTableTd" style="width:3%">
								<span style="font-weight:bold; " align="center">
									<xsl:text>Quantity</xsl:text>
								</span>
							</td>
							<td id="lineTableTd" style="width:3%">
								<span style="font-weight:bold; " align="center">
									<xsl:text>Unit Cost</xsl:text>
								</span>
							</td>
							<td id="lineTableTd" style="width:3%">
								<span style="font-weight:bold; " align="center">
									<xsl:text>Tax Rate</xsl:text>
								</span>
							</td>
							<td id="lineTableTd" style="width:3%">
								<span style="font-weight:bold; " align="center">
									<xsl:text>Calculated Tax Amount</xsl:text>
								</span>
							</td>

							<td id="lineTableTd" style="width:5%" align="center">
								<span style="font-weight:bold; ">
									<xsl:text>Notes</xsl:text>
								</span>
							</td>
							<td id="lineTableTd" style="width:5%" align="center">
								<span style="font-weight:bold;">
									<xsl:text>Total Amount Including Tax</xsl:text>
								</span>
							</td>							
						</tr>
						<xsl:for-each select="Invoice/InvoiceLine">
							<tr>
								<td id="lineTableTd" style="width:9%">
									<span align="center">
										<xsl:value-of select="./ItemNumber"/>
									</span>
								</td>
								<td id="lineTableTd" style="width:9%">
									<span align="center">
										<xsl:value-of select="./Product"/>
									</span>
								</td>
								<td id="lineTableTd" style="width:9%">
									<span align="center">
										<xsl:value-of select="./Quantity"/> 
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select = "./Quantity/@unitCode"/>
									</span>
								</td>
								<td id="lineTableTd" style="width:9%">
									<span align="center">
										<xsl:value-of select="./UnitCost"/>
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="./UnitCost/@currency"/>

									</span>
								</td>
								<td id="lineTableTd" style="width:9%">
									<span align="center">
										<xsl:value-of select="./TaxRate"/>
										<xsl:text>%</xsl:text>
									</span>
								</td>
								<td id="lineTableTd" style="width:9%">
									<span align="center">
										<xsl:value-of select="./TaxAmount"/>
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="./TaxAmount/@currency"/>
									</span>
								</td>
								<td id="lineTableTd" style="width:9%">
									<span align="center">
										<xsl:value-of select="./Note"/>
									</span>
								</td>
								<td id="lineTableTd" style="width:5%">
									<span align="center">
										<xsl:value-of select="./TotalAmountIncludingTax"/>
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="./TotalAmountIncludingTax/@currency"/>

									</span>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>


</xsl:stylesheet>