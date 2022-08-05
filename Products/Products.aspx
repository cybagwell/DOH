<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Products.aspx.vb" Inherits="DOHPricing.Products" EnableEventValidation="False" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .gridview {
            font-family: Arial;
            background-color: #FFFFFF;
            border: solid 1px #CCCCCC;
            max-width: 90%;
        }

            .gridview td {
                padding: 5px 5px 5px 5px;
            }

            .gridview th {
                padding: 5px 5px 5px 5px;
                text-align: left;
            }

                .gridview th a {
                    color: #003300;
                    text-decoration: none;
                }

                    .gridview th a:hover {
                        color: #003300;
                        text-decoration: underline;
                    }

            .gridview td a {
                color: #003300;
                text-decoration: none;
            }

                .gridview td a:hover {
                    color: red;
                    text-decoration: underline;
                }


        .gridViewHeader {
            background-color: #6B696B;
            color: black;
            text-align: left;
        }

        .gridViewRow {
            background-color: lavender;
            color: #000000;
           
           
        }

        .gridViewAltRow {
            background-color: #FFFFFF;
        }

        .gridViewSelectedRow {
            background-color: #FFCC00;
            color: #666666;
        }

        /* Of course, this doesn't work with IE6. Works fine with Firefox, though. */
        .gridview tr.gridViewRow:hover td, .gridview tr.gridViewAltRow:hover td {
            background-color: #CCCCCC;
            color: #000000;
        }

        .gridViewPager {
            background-color: lavender;
            color: #FFFFFF;
            text-align: left;
        }

            .gridViewPager td {
                padding: 3px;
            }

                .gridViewPager td a {
                    color: #FFFFFF;
                    text-decoration: none;
                }

                    .gridViewPager td a:hover {
                        color: #FFFFFF;
                        text-decoration: underline;
                    }

            /* The currently selected page number is rendered by ASP.NET in a span tag in the td. */
            .gridViewPager span {
                color: #000000;
            }
    </style>

    <h1>Products</h1>

    <table style="border-spacing: 2px;">


        <tr>

            <td style="vertical-align: bottom; padding-right: 6px">
                <asp:Button ID="btnExport" runat="server" Text="Export To Excel" OnClick="ExportToExcel" UseSubmitBehavior="False" />


            </td>
            <td>

                <table style="border-spacing: 2px;">
                    <tr>
                        <th>Product Name
                        </th>
                        <th>SKU
                        </th>
                        <th>Customer Name
                        </th>
                        <th>PO</th>
                        <th>Paging</th>
                    </tr>
                    <tr>
                        <td style="padding-right: 6px">
                            <asp:TextBox ID="txtboxProduct" runat="server" Height="25px"></asp:TextBox></td>
                        <td style="padding-right: 6px">
                            <asp:TextBox ID="txtSku" runat="server" Height="25px"></asp:TextBox></td>
                        <td style="padding-right: 6px">
                            <asp:TextBox ID="txtCustomer" runat="server" Height="25px"></asp:TextBox></td>
                        <td style="padding-right: 6px">
                            <asp:TextBox ID="TxtPO" runat="server" Height="25px"></asp:TextBox></td>
                        <td style="padding-right: 6px">

                            <asp:DropDownList runat="server" ID="DDLpaging" AutoPostBack="True" Height="25px">
                                <asp:ListItem>ON</asp:ListItem>
                                <asp:ListItem>OFF</asp:ListItem>

                            </asp:DropDownList>
                        </td>

                        <td style="padding-right: 6px">
                            <asp:Button ID="btnSearch" runat="server" Text="Search" Height="25px" /></td>
                    </tr>
                </table>



            </td>
        </tr>

    </table>



    <br />
    <hr />
    <asp:GridView ID="GridViewProducts" runat="server" CssClass="gridview" OnPageIndexChanging="GridViewProducts_PageIndexChanging" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"  DataKeyNames="Id" DataSourceID="srcSqlDataSourceProducts" ForeColor="Black" Width="95%" AllowPaging="True" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>




            <asp:TemplateField HeaderText="Select For Export" ItemStyle-HorizontalAlign="Center" >
                <HeaderTemplate>
                    <div style="white-space: nowrap">
                        Export
                   
                    <asp:CheckBox ID="CBSelectall" runat="server"  OnCheckedChanged="CBSelectall_CheckedChanged" AutoPostBack="True" Checked="true" />
                    </div>

                </HeaderTemplate>


                <ItemTemplate>
                    <asp:CheckBox ID="CBSelect" runat="server" Checked="true" />
                </ItemTemplate>
            </asp:TemplateField>




            <asp:TemplateField>
                <ItemTemplate>
                    <br />
                    <asp:HyperLink ID="HyperLink2" runat="server" Width="50px" NavigateUrl='<%# GetUrl("Picview.aspx?ProductID=" + Eval("Id").ToString) %>' Target="_blank">

                        <asp:Image ID="Image1" runat="server" Width="50px" ImageUrl='<%# GetUrl("ImageHandler.ashx?ID=" + Eval("Id").ToString + "&Type=Product") %>' />
                    </asp:HyperLink>

                    <br />
                    <br />
                </ItemTemplate>

            </asp:TemplateField>
            <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" HeaderStyle-Wrap="false"  />
            <asp:BoundField DataField="SKU" HeaderText="SKU" SortExpression="SKU" />
            <asp:BoundField DataField="UPC" HeaderText="UPC" SortExpression="UPC" Visible="False" />
            <asp:BoundField DataField="NumPerBox" HeaderText="Per Box" HeaderStyle-Wrap="false" SortExpression="NumPerBox" />
            <asp:BoundField DataField="CustomerName" HeaderText="Customer" SortExpression="CustomerName" />
            <asp:BoundField DataField="PriceUSD" HeaderText="USD" DataFormatString="${0:###,###,###.00}" ItemStyle-HorizontalAlign="Right" />
            <asp:BoundField DataField="PriceRupees" HeaderText="Rupees" DataFormatString="₹{0:###,###,###.00}" ItemStyle-HorizontalAlign="Right" />
            <asp:BoundField DataField="LaborCost" HeaderText="Labor Cost" DataFormatString="₹{0:###,###,###.00}" ItemStyle-HorizontalAlign="Right" HeaderStyle-Wrap="false" />
            <asp:BoundField DataField="AddedDate" HeaderText="Create Date" HeaderStyle-Wrap="false" SortExpression="AddedDate" DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField DataField="ModifiedDate" HeaderText="Modified Date" HeaderStyle-Wrap="false" SortExpression="ModifiedDate" DataFormatString="{0:MM/dd/yyyy}" />
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>

                    <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="False" Text="Edit" PostBackUrl='<%# "../Products/Price.aspx?ProductID=" + Eval("Id").ToString %>'>
                                                <span aria-hidden="true"  class="glyphicon glyphicon-pencil"> </span>
                    </asp:LinkButton>



                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete" ShowHeader="False" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure?');" Text="Delete">
                                                <span aria-hidden="true"  class="glyphicon glyphicon-trash"> </span>
                    </asp:LinkButton>
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
       
        <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" FirstPageText="First      " LastPageText="      Last" NextPageText="Next" PreviousPageText="Back" />
    
        <HeaderStyle CssClass="gridViewHeader" />
        <RowStyle CssClass="gridViewRow" />
        <AlternatingRowStyle CssClass="gridViewAltRow" />
        <SelectedRowStyle CssClass="gridViewSelectedRow" />
        <PagerStyle CssClass="gridViewPager" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:SqlDataSource ID="srcSqlDataSourceProducts" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
        DeleteCommand="del_ProductHeader" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" />
        </DeleteParameters>
    </asp:SqlDataSource>

</asp:Content>
