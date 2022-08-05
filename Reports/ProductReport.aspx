<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ProductReport.aspx.vb" Inherits="DOHPricing.ProductReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
             <table  style="border-spacing: 2px;">
                    <tr>
                        <th>Product Name
                        </th>
                        <th>SKU
                        </th>
                        <th>Customer Name
                        </th>
                        <th>Paging</th>
                    </tr>
                    <tr>
                        <td style="padding-right: 6px">
                            <asp:TextBox ID="txtboxProduct" runat="server"  Height="25px"></asp:TextBox></td>
                        <td  style="padding-right: 6px">
                            <asp:TextBox ID="txtSku" runat="server"  Height="25px"></asp:TextBox></td>
                        <td  style="padding-right: 6px">
                            <asp:TextBox ID="txtCustomer" runat="server"  Height="25px"></asp:TextBox></td>
                        <td  style="padding-right: 6px">
                           
                            <asp:dropdownlist runat="server" ID="DDLpaging" AutoPostBack="True" Height="25px">
                                <asp:ListItem>ON</asp:ListItem>
                                <asp:ListItem>OFF</asp:ListItem>
                                
                            </asp:dropdownlist>
                        </td>
                
                        <td  style="padding-right: 6px">
                            <asp:Button ID="btnSearch" runat="server" Text="Search"  Height="25px" CausesValidation="False"/></td>
                    </tr>
                </table>

    <br />
    <br />
            <asp:GridView ID="GridViewProducts" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="srcSqlDataSourceProducts" ForeColor="Black" GridLines="Vertical" Width="100%" AllowSorting="True" AllowPaging="True" CellSpacing="2" PageSize="5">
                <AlternatingRowStyle BackColor="White" />
                <Columns>



                    <asp:TemplateField>
                        <ItemTemplate>

                            
                            <table style="width: 100%"  >
                                <tr>

                                    <td colspan="3" style="white-space:nowrap; vertical-align: top; padding-right:10px; width:60%; max-width:300px; ">
                                            <h2>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label></h2>
                                        </td >
                                   
                                     <td  rowspan="15"  style="vertical-align: top; padding-left:10px; border-left:solid thin;" >
                                        
                                        <br/>
                                         <b>Base Fabrics</b>
                                         <br/>
                                         <asp:Label ID="Label11" runat="server" Text='<%# Bind("MaterialsBaseFabrics") %>'></asp:Label>
                                         <br/>
                                        <b>Applique Fabrics</b>
                                         <br/>
                                        <asp:Label ID="Label17" runat="server" Text='<%# Bind("MaterialsAppliqueFabrics") %>'></asp:Label>
                                         <br/>
                                        <b>Trims</b>
                                         <br/>
                                        <asp:Label ID="Label18" runat="server" Text='<%# Bind("MaterialsTrims") %>'></asp:Label>
                                    </td>


                                </tr>

                                <tr>
                                    <td style="vertical-align: top;">
                                        <asp:HyperLink ID="HyperLink2" runat="server" Width="50px" NavigateUrl='<%# GetUrl("Picview.aspx?ProductID=" + Eval("Id").ToString) %>' Target="_blank">

                                            <asp:Image ID="Image1" runat="server" Width="50px" ImageUrl='<%# GetUrl("ImageHandler.ashx?ID=" + Eval("Id").ToString + "&Type=Product") %>' />
                                        </asp:HyperLink></td>
                                 
                                        
                                        <th  style="padding-left: 20px; padding-right: 20px; vertical-align: top;">Create Date
                                        <br />
                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("AddedDate", "{0:MM/dd/yyyy}") %>'></asp:Label>

                                        </th>
                                        <th style="vertical-align: top;">Modified Date
                                        <br />
                                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("ModifiedDate", "{0:MM/dd/yyyy}") %>'></asp:Label>

                                        </th>
                                    
                                </tr>

                                <tr>
                                

                                </tr>




                                <tr>

                                    <th>
                                   SKU
                                    </th>
                                    <th style="padding-left: 20px; padding-right: 20px;">
                                       UPC 
                                    </th>

                                    <th>
                                        Customer
                                    </th>
                                     
                                </tr>
                                <tr>
                                   
                                    <td>

                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("SKU") %>'></asp:Label>
                                    </td>
                                    <td  style="padding-left: 20px; padding-right: 20px;">
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("UPC") %>'></asp:Label>
                                    </td>

                                    <td >

                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("CustomerName") %>'></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                   
                                    <th>

                                        Price USD
                                    </th>
                                    <th  style="padding-left: 20px; padding-right: 20px;">

                                        Price INR
                                    </th>
                                    <th >

                                       Labor Cost INR
                                    </th>
                                </tr>
                                <tr>
                                   
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("PriceUSD", "${0:###,###,###.00}") %>'></asp:Label>
                                    </td>
                                    <td  style="padding-left: 20px; padding-right: 20px;">


                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("PriceRupees", "₹{0:###,###,###.00}") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("LaborCost", "₹{0:###,###,###.00}") %>'></asp:Label>


                                    </td>
                                </tr>
                                <tr>
                               
                                    <th>

                                      Number Per Box
                                    </th>
                                    <th  style="padding-left: 20px; padding-right: 20px;">

                                     Drawback Number
                                    </th>
                                    <th>

                                        Shipping Description
                                    </th>
                                </tr>
                                <tr>
                                 
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("NumPerBox") %>'></asp:Label>
                                    </td>
                                    <td style="padding-left: 20px; padding-right: 20px;" >
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("DrawbackNumber") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <div style="max-width:200px">
                                        <asp:Label ID="Label10"  runat="server" Text='<%# Bind("ShippingDescription") %>'></asp:Label></div>
                                    </td>
                                </tr>
                                   <tr>
                                 <th>Product Length</th>
                                       <th  style="padding-left: 20px; padding-right: 20px;">Product Width</th>
                                    <td></td>
                                          </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("ProductLength") %>'></asp:Label>
                                    </td>
                                    <td style="padding-left: 20px; padding-right: 20px;" >
                                        <asp:Label ID="Label16" runat="server" Text='<%# Bind("ProductWidth") %>'></asp:Label>
                                    </td>
                                    <td>

                                    </td>
                                </tr>
                                <tr>
                                 <th colspan="3" >Files</th>
                                       
                                          </tr>
                                <tr>
                                    <td colspan="3" style="vertical-align: top;">
                                       
                                       
                <asp:GridView ID="GridViewfiles" runat="server" AutoGenerateColumns="False">
                    <Columns>
               <asp:BoundField DataField="FileName" HeaderText="File Name"/>
             <asp:TemplateField ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"
                    CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
            </ItemTemplate>

        <ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:TemplateField>

                       

                    </Columns>
                </asp:GridView>
  
  </td>



                                </tr> 
                             
                                <tr>
                                    
                                    <th colspan="3">Notes</th>

                                </tr>
                                <tr>
                                  

                                    <td colspan="3" style="vertical-align: top; height: 40%; padding-right:10px;">
                                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("Notes") %>'></asp:Label></td>
                                </tr>
                            </table>

                                

                               




















                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" FirstPageText="First      " LastPageText="      Last" NextPageText="Next" PreviousPageText="Back" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" CssClass="pagination-ys" Font-Size="Medium" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:SqlDataSource ID="srcSqlDataSourceProducts" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="Select PH.Id,ProductName,ProductLength, ProductWidth, SKU,UPC,NumPerBox,ProductImage,CustomerID,CustomerName,PriceRupees,PriceUSD,cast((Labor_Rate * ProductionTime) as decimal(10,2)) as LaborCost,AddedDate,(select top 1 Date from t_ProductPriceHistory where Productid = PH.ID order by date desc) as ModifiedDate, DrawbackNumber, Notes, ShippingDescription, STUFF((Select   Name + '- ' + cast(Cost as varchar) + ' Rupees <br /> Amount Used: ' + cast(Length as varchar) + ' Length ' + cast(case UsedWidth when 100 then 0
else UsedWidth end as varchar) + ' Width  <br /><br />'
            From t_ProductMaterials PM
        inner join t_RawMaterials RM
        on pm.MaterialID = RM.ID
            Where PM.ProductID = PH.Id and [Type] = 'Base Fabrics'
            ORDER BY rm.Name
               
            For XML PATH (''),TYPE)
               .value('.','NVARCHAR(MAX)'), 1, 0, '') AS  MaterialsBaseFabrics,
STUFF((Select   Name + '- ' + cast(Cost as varchar) + ' Rupees <br /> Amount Used: ' + cast(Length as varchar) + ' Length ' + cast(case UsedWidth when 100 then 0
else UsedWidth end as varchar) + ' Width  <br /><br />'
            From t_ProductMaterials PM
        inner join t_RawMaterials RM
        on pm.MaterialID = RM.ID
            Where PM.ProductID = PH.Id and [Type] = 'Applique Fabrics'
            ORDER BY rm.Name
               
            For XML PATH (''),TYPE)
               .value('.','NVARCHAR(MAX)'), 1, 0, '') AS  MaterialsAppliqueFabrics,
                STUFF((Select   Name + '- ' + cast(Cost as varchar) + ' Rupees <br /> Amount Used: ' + cast(Length as varchar) + ' Length ' + cast(case UsedWidth when 100 then 0
else UsedWidth end as varchar) + ' Width  <br /><br />'
            From t_ProductMaterials PM
        inner join t_RawMaterials RM
        on pm.MaterialID = RM.ID
            Where PM.ProductID = PH.Id and [Type] = 'Trims'
            ORDER BY rm.Name
               
            For XML PATH (''),TYPE)
               .value('.','NVARCHAR(MAX)'), 1, 0, '') AS  MaterialsTrims
         from t_ProductHeader PH inner Join t_Customer Cust on PH.CustomerID = Cust.ID 
inner join t_ProductPrice Price on PH.Id = Price.ProductID order by AddedDate, ProductName"></asp:SqlDataSource>
        
</asp:Content>
