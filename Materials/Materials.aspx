<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Materials.aspx.vb" Inherits="DOHPricing.Materials" EnableViewState="True" MaintainScrollPositionOnPostback="True" %>

<%@ Register Assembly="CurrencyTextBox" Namespace="SKP.ASP.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <style>
        .gridview {
            font-family: Arial;
            background-color: #FFFFFF;
            border: solid 1px #CCCCCC;
        }

            .gridview td {
                padding: 5px 3px 5px 3px;
            }

            .gridview th {
                padding: 5px 3px 5px 3px;
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
            line-height: .8;
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

    <asp:UpdatePanel runat="server" ID="UpdatePanel">

        <ContentTemplate>



            <div class="row">
                <div class="col-xs-5 col-sm-4 col-md-6 col-lg-7">
                    <h1>Materials</h1>
                       <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
                </div>


                <div class="text-right col-xs-4 col-sm-4 col-md-4 col-lg-3">
                    <br />
                    <!-- Button trigger modal -->
                    <asp:Button ID="BtnAddNewMaterials" runat="server" Text=" Add New Materials" CssClass="btn btn-info btn-sm" UseSubmitBehavior="False" CausesValidation="false" />
                   
                </div>


            </div>
           
                             
                            


            <!-- Modal -->
            <div id="myModal"  runat="server"  visible="false" class="modal-backdrop" >
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                          
                              <asp:Button ID="btnCloseModal" runat="server" Text="Close" CssClass="close" UseSubmitBehavior="False" CausesValidation="false" />
                   
                            <h4 class="modal-title" id="myModalLabel">Add New Materials</h4>
                        </div>
                        <div class="modal-body">

                            
                            <div class="row">
                                <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                                    <div class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorname" runat="server" ErrorMessage="Name is Required" ControlToValidate="txtname"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="h4">Name</div>

                                    <asp:TextBox ID="TxtName" runat="server" MaxLength="300"></asp:TextBox>
                                </div>
                                <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                                    <div class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Category is Required" ControlToValidate="DropDownListCategoryr"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="h4">Category</div>
                                    <asp:DropDownList ID="DropDownListCategoryr" runat="server" DataSourceID="srcSqlDataSourceCategorycustomer" DataTextField="CategoryName" DataValueField="CategoryName" AutoPostBack="True"></asp:DropDownList>

                                    <asp:SqlDataSource ID="srcSqlDataSourceCategorycustomer" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT  [CategoryName] FROM [t_MaterialCategory] ORDER BY  [CategoryName]"></asp:SqlDataSource>

                                </div>
                                <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                                    <div class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice" runat="server" ErrorMessage="Pice is Required" ControlToValidate="txtPrice"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="h4">Price (Rupees)</div>

                                    <cc1:CurrencyTextBox ID="txtPrice" runat="server" Width="100px" NumberOfDecimals="2"></cc1:CurrencyTextBox>

                                </div>
                                <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                                    <div class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorWidth" runat="server" ErrorMessage="Width is Required" ControlToValidate="txtWidth"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="h4">Width (Inches)</div>
                                    <cc1:CurrencyTextBox ID="Txtwidth" runat="server" Width="100px" NumberOfDecimals="2"></cc1:CurrencyTextBox>


                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">

                                    <div class="h4">Quantity</div>
                                    <cc1:CurrencyTextBox ID="TxtQty" runat="server" Width="100px" NumberOfDecimals="2"></cc1:CurrencyTextBox>


                                </div>

                                <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">

                                    <div class="h4">Picture</div>


                                    <asp:FileUpload ID="FileUploadPic" runat="server" />
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">

                                    <div class="h4">Notes</div>

                                    <asp:TextBox ID="TxtNotes" runat="server" Width="98%" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                                    <br />
                                    <asp:Button ID="BtnInsert" runat="server" Text="Insert" UseSubmitBehavior="False"   />
                                </div>
                            </div>


                        </div>
                        <div class="modal-footer">
                            <i>* items that are measured only in length (ribbon) should have a width = 0. </i>
                         

                        </div>
                    </div>
                </div>
            </div>





            <table style="border-spacing: 2px;">
                <tr>
                    <th>Material Name
                    </th>
                    <th>Category</th>
                    <th>Paging</th>
                </tr>
                <tr>
                    <td style="padding-right: 6px">
                        <asp:TextBox ID="txtMaterial" runat="server" Height="25px"></asp:TextBox></td>
                    <td style="padding-right: 6px">
                        <asp:DropDownList ID="DropDownListCatSearch" runat="server" Height="25px" DataSourceID="SqlDataSourceCat" DataTextField="CategoryName" DataValueField="CategoryName" AutoPostBack="True" AppendDataBoundItems="True">
                            <asp:ListItem Text="All"></asp:ListItem>

                        </asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSourceCat" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT  [CategoryName] FROM [t_MaterialCategory] ORDER BY  [CategoryName]"></asp:SqlDataSource>
                    </td>
                    <td style="padding-right: 6px">

                        <asp:DropDownList runat="server" ID="DDLpaging" AutoPostBack="True" Height="25px">
                            <asp:ListItem>ON</asp:ListItem>
                            <asp:ListItem>OFF</asp:ListItem>

                        </asp:DropDownList>
                    </td>

                    <td style="padding-right: 6px">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" Height="25px" CausesValidation="false" /></td>
                </tr>
            </table>
            <hr />

            <asp:GridView ID="GridViewMaterials" CssClass="gridview" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceMaterials" OnRowDataBound="GridViewMaterials_RowDataBound" OnRowEditing="GridViewMaterials_RowEditing" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="90%">
              
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <div class="text-center">EDIT</div>
                        </HeaderTemplate>

                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonupdate" runat="server" CausesValidation="False" CommandName="Update" Text="Update" ToolTip="Save">
                        <span aria-hidden="true"  class="glyphicon glyphicon-floppy-saved"> </span>
                            </asp:LinkButton>
                            <br />
                            <br />
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" ToolTip="Cancel">
                        <span aria-hidden="true"  class="glyphicon glyphicon-remove"> </span>
                            </asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"><span aria-hidden="true"  class="glyphicon glyphicon-pencil"> </span></asp:LinkButton>
                        </ItemTemplate>



                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" InsertVisible="False" Visible="False" />
                    <asp:TemplateField HeaderText="Materials" SortExpression="Name">
                        <EditItemTemplate>

                            <table style="width: 98%">

                                <tr>
                                    <th>Select A new Image
                                    </th>
                                    <th>Old Image
                                    </th>
                                    <th>Material Name
                                    </th>
                                    <th>Category</th>

                                </tr>
                                <tr>
                                    <td>


                                        <asp:FileUpload ID="FileUploadPicEdit" runat="server" />
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="HyperLink2" runat="server" Width="50px" NavigateUrl='<%# GetUrl("Picview.aspx?ProductID=" + Eval("Id").ToString + "&Type=Material") %>' Target="_blank">

                                            <asp:Image ID="Image2" runat="server" Width="50px" ImageUrl='<%# GetUrl("ImageHandler.ashx?ID=" + Eval("Id").ToString + "&Type=Material") %>' />
                                        </asp:HyperLink>

                                    </td>
                                    <td>
                                        <h4>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>' TextMode="MultiLine"></asp:TextBox></h4>


                                    </td>

                                    <td>
                                        <asp:Label ID="LabelCat" runat="server" Text='<%# Bind("Category") %>' Visible="false"></asp:Label>

                                        <asp:DropDownList ID="DropDownListCategoryr" runat="server" OnSelectedIndexChanged="DropDownListCategoryr_SelectedIndexChanged" DataSourceID="srcSqlDataSourceCategorycustomer" DataTextField="CategoryName" DataValueField="CategoryName" AutoPostBack="True"></asp:DropDownList>

                                        <asp:SqlDataSource ID="srcSqlDataSourceCategorycustomer" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT  [CategoryName] FROM [t_MaterialCategory] ORDER BY  [CategoryName]"></asp:SqlDataSource>


                                    </td>
                                </tr>

                                <tr>
                                    <th>Price (Rupees)</th>
                                    <th>Width Inches</th>
                                    <th>Quantity (Meters) </th>
                                </tr>
                                <tr>
                                    <td>

                                        <cc1:CurrencyTextBox ID="txtPriceedit" runat="server" Width="100px" Text='<%# Bind("Price") %>' NumberOfDecimals="2"></cc1:CurrencyTextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Width") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <cc1:CurrencyTextBox ID="txtQty" runat="server" Width="100px" Text='<%# Bind("qty") %>' NumberOfDecimals="2"></cc1:CurrencyTextBox>


                                    </td>
                                </tr>

                                <tr>

                                    <th colspan="3">Notes</th>

                                </tr>

                                <tr>
                                    <td colspan="3">

                                        <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="98%" Text='<%# Bind("Notes") %>'></asp:TextBox>
                                    </td>


                                </tr>
                            </table>





                        </EditItemTemplate>
                        <ItemTemplate>

                            <table style="width: 98%; ">
                                 <tr>
                                    <td >
                                        <asp:HyperLink ID="HyperLink2" runat="server" Width="50px" NavigateUrl='<%# GetUrl("Picview.aspx?ProductID=" + Eval("Id").ToString + "&Type=Material") %>' Target="_blank">

                                            <asp:Image ID="Image2" runat="server" Width="50px" ImageUrl='<%# GetUrl("ImageHandler.ashx?ID=" + Eval("Id").ToString + "&Type=Material") %>' />
                                        </asp:HyperLink>
                                    </td>
                                    
                                
                                    
                                    <td style="vertical-align:bottom">
                                        <h4> Name: 
                                       
                                            <asp:Label ID="Label4" runat="server" Text='<%#  Bind("Name") %>'></asp:Label></h4>
                                    </td>
                                    <td>
                                        <h4>Category: 
                                            <asp:Label ID="LabelCatmain" runat="server" Text='<%#  Bind("Category") %>'></asp:Label>
                                            <h4>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td style="white-space:nowrap">
                                      <b>Price: (Rupees)</b>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Price", "{0:C}") %>'></asp:Label>
                                    </td>
                                    <td  style="white-space:nowrap"><b>Width Inches:</b>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Width") %>'></asp:Label>
                                    </td>
                                    <td  style="white-space:nowrap"> <b>Quantity: (Meters) </b>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                    </td>
                                </tr>

                                
                                <tr>
                                    <td colspan="3">
                                        <b>Notes:</b>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Notes") %>'></asp:Label></td>

                                </tr>
                            </table>
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
            <asp:SqlDataSource ID="SqlDataSourceMaterials" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM t_RawMaterials WHERE (Id = @original_Id)" InsertCommand="INSERT INTO [t_RawMaterials] ([Name], [Price], [Width], [Notes], [Picture],[Qty], [Category]) VALUES ( @Name, @Price, @Width, @Notes, @Picture,@Qty,@Category)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [Name], [Price], [Width], [Notes], [Qty], [Category] FROM [t_RawMaterials] order by Name " UpdateCommand="if (select count(*) from t_rawmaterials where price &lt;&gt; @price and Id = @original_Id) &gt; 0
begin 
 UPDATE t_RawMaterials SET Name = @Name, Price = @Price, Width = @Width, Notes = @Notes,QTY = @QTY,Category = @Category ,Picture = (CASE WHEN @Picture IS NULL THEN [Picture] ELSE @Picture END) 
 WHERE (Id = @original_Id) 
 exec [dbo].[InsUpd_ProductMaterialPrice] @original_Id  
 end 
 else 
 begin 
 UPDATE t_RawMaterials SET Name = @Name, Price = @Price, Width = @Width, Notes = @Notes,QTY = @QTY,Category = @Category ,Picture = (CASE WHEN @Picture IS NULL THEN [Picture] ELSE @Picture END)
  WHERE (Id = @original_Id) 
 end">
                <DeleteParameters>
                    <asp:Parameter Name="@original_Id" Type="Int32" />

                </DeleteParameters>
                <InsertParameters>

                    <asp:ControlParameter ControlID="TxtName" Name="Name" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtPrice" Name="Price" PropertyName="Text" Type="Decimal" />
                    <asp:ControlParameter ControlID="Txtwidth" Name="Width" PropertyName="Text" Type="Decimal" />
                    <asp:ControlParameter ControlID="TxtNotes" Name="Notes" PropertyName="Text" Type="String" />

                    <asp:ControlParameter ControlID="TxtQty" Name="Qty" PropertyName="Text" Type="Decimal" />








                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="Width" Type="Decimal" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="Category" Type="String" />
                    <asp:Parameter Name="Qty" Type="Decimal" />

                    <asp:Parameter Name="original_Id" Type="Int32" />


                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>


