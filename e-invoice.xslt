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
					td>text {
						font-style: italic;
					}
					table.centerText tr> td:first-child{
						text-align: center;
					}
					table.centerText tr> td:first-child + td{
						text-align: center;
					}
					table.centerText tr> td:first-child + td + td{
						text-align: center;
					}
					

				</style>
			</head>
			<body style=" width:920px; margin-left:0.6in; margin-right:0.6in; margin-top:0.79in; margin-bottom:0.79in">
				<table width="920px"  border="1" style="border-collapse: collapse"> <!--class="centerText"--> 
					<tr style= "height: 100px">
						<td width="40%" alt="SenderInformation" valign="top" align="left">
							<hr/>
							<xsl:for-each select="Invoice/AccountingSupplierParty/Party">
								<span  style="font-weight:bold;">
									<xsl:text>Invoice Issuer: </xsl:text>
								</span>
								<xsl:value-of select="./Name"/>
								<br/>
								<span  style="font-weight:bold;">
									<xsl:text>Address: </xsl:text>
								</span>
								<xsl:apply-templates select="./PostalAddress"/>
								<br/>
								<span  style="font-weight:bold;">
									<xsl:text>Tax Office: </xsl:text>
								</span>
								<xsl:value-of select="./TaxScheme"/>
								<br/>
								<span  style="font-weight:bold;">
									<xsl:text>Tax ID: </xsl:text>
								</span>
								<xsl:for-each select="./PartyIdentification">
									<xsl:if test= "./ID/@schemeID = 'TaxID'">
										<xsl:value-of select="."/>
									</xsl:if>
								</xsl:for-each>
							</xsl:for-each>
							<hr/>
							</td>
							
						<td width="20%" alt="MinistryLogo">
					          <img style="width:290px;" align="center" alt="Ministry Logo" src="data:image/png;base64,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"/>
						</td>
						<td width="40%" alt="CompanyLogo" style= "text-align:center">
							<img style="width:290px;" align="center" alt="Company Logo" src="data:image/png;base64,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"/>	
						</td>
					</tr>
					<tr style= "height: 100px"> 
						<td width= "40%" valign="top" align="left">
							<hr/>
							<xsl:for-each select="Invoice/AccountingCustomerParty/Party">
								<span  style="font-weight:bold;">
									<xsl:text>DEAR </xsl:text>
								</span>
								<br/>
								<xsl:value-of select="./Name"/>
								<br/>
								<span  style="font-weight:bold;">
									<xsl:text>Address: </xsl:text>
								</span>
								<xsl:apply-templates select="./PostalAddress"/>
								<br/>
								<span  style="font-weight:bold;">
									<xsl:text>Tax Office: </xsl:text>
								</span>
								<xsl:value-of select="./TaxScheme"/>
								<br/>
								<span  style="font-weight:bold;">
									<xsl:text>Tax ID: </xsl:text>
								</span>
								<xsl:for-each select="./PartyIdentification">
									<xsl:if test= "./ID/@schemeID = 'TaxID'">
										<xsl:value-of select="."/>
									</xsl:if>
								</xsl:for-each>				
							</xsl:for-each>
							<hr/>
						</td>
						<td width= "20%" style= "text-align:center">
							</td>
						<td width= "40%" style= "text-align:center">
							<text>Some Info About Invoice</text> will be placed here</td>
					</tr>

					<tr alt="UUID" >
						<td>
							<text> UUID of e-invoice </text> will be placed here</td>
					</tr>
				</table>
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
						<!-- This part was removed in part5-->
						<!--
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
						-->
						
						<!-- below part added for part 5-->
						<xsl:for-each select="Invoice/InvoiceLine">
									<xsl:apply-templates select="."/>
						</xsl:for-each>
						<!--above part added for part 5-->
					</tbody>
				</table>
				<table  width= "920px" style= "text-align:center" class="centerText" id="lineTable">
					<tr > 
						<td  alt="Notes">
							<text>Notes</text> will be placed here
						</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>
	<!-- below template added for part 5-->
	<xsl:template match="Invoice/InvoiceLine">
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
	</xsl:template>
<!-- above template added for part 5-->

</xsl:stylesheet>