<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Price.aspx.vb" Inherits="DOHPricing.Price" %>

<%@ Register Assembly="CurrencyTextBox" Namespace="SKP.ASP.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <%-- <script>

        function openModal() {
            $('#myModal').modal({ show: true });
        };




    </script>--%>
    <script type="text/javascript">

        function scrollup()

        {
          
            setTimeout(function () {
                window.scrollTo(0, 0);
            }, 2);
        }             </script>
    
        <asp:UpdatePanel runat="server" id="UpdatePanel" >
       
            <ContentTemplate>
                            
           
      
    <div class="row">
        <div class="col-xs-8 col-sm-4 col-md-3 col-lg-3">
            <h1>Costing</h1>
            <br />

        </div>
        <div class="col-xs-8 col-sm-4 col-md-3 col-lg-3">
            <br />
            <br />
            <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>



            <asp:Label ID="LblPriceRupee" runat="server" Text="" Font-Size="Large" CssClass="text-success"></asp:Label>
            <asp:Label ID="LblPriceUSD" runat="server" Text="" Font-Size="Large" CssClass="text-success"></asp:Label>

        </div>
        <div class="col-xs-8 col-sm-3 col-md-3 col-lg-3">
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Products/Products.aspx">Back to Products</asp:HyperLink>

        </div>
    </div>
    <asp:HiddenField ID="HiddenFieldProductPriceID" Value="0" runat="server" />
    <div class="row"  >
        
        <div class="col-xs-8 col-sm-4 col-md-3 col-lg-3">
            <h3>Product Header</h3>
        </div>
        <div class="col-xs-8 col-sm-4 col-md-5 col-lg-5">
            <asp:Button ID="BtnPriceTop" runat="server" Text="Calculate Price" />

            <asp:Button ID="btnInsertTop" runat="server" Text="Insert" CausesValidation="False" />
            <asp:Button ID="BtnUpdateTop" runat="server" Text="Update" visable="false" CausesValidation="False" />


        </div>

       
    </div>
    <hr />
     <div style="background-color: lightgray; border-radius: 5px; padding:10px;">
    <div class="row" >
        <div class="col-xs-8 col-sm-4 col-md-3 col-lg-3">
            <div class="h4">Customer</div>
            <asp:DropDownList ID="DropDownListcustomer" runat="server" Height="25px" DataSourceID="srcSqlDataSourcecustomer" DataTextField="CustomerName" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>

            <asp:SqlDataSource ID="srcSqlDataSourcecustomer" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [CustomerName],Code FROM [t_Customer] ORDER BY [Order], [CustomerName]"></asp:SqlDataSource>

        </div>
        <div class="col-xs-8 col-sm-4 col-md-3 col-lg-3">


            <div class="h4">Product Name</div>

            <asp:TextBox ID="TxtName" runat="server" MaxLength="600" Width="95%"></asp:TextBox>

        </div>




   

        <div class="col-xs-8 col-sm-4 col-md-3 col-lg-3">


            <div class="h4">SKU</div>

            <asp:TextBox ID="TxtSKU" runat="server" MaxLength="20"></asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  Display="Dynamic"  ErrorMessage="Required" ControlToValidate="TxtSKU"></asp:RequiredFieldValidator>--%>
        </div>
        <div class="col-xs-8 col-sm-4 col-md-3 col-lg-3">


            <div class="h4">UPC</div>

            <asp:TextBox ID="Txtupc" runat="server"></asp:TextBox>
        </div>
        
        <div class="col-xs-8 col-sm-4 col-md-3 col-lg-3">

            <div class="h4">Number Per Box</div>

            <asp:TextBox ID="TxtNumperBox" runat="server"></asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  Display="Dynamic"  ErrorMessage="Required" ControlToValidate="TxtNumperBox"></asp:RequiredFieldValidator>--%>
        </div>
   

        <div class="col-xs-8 col-sm-4 col-md-3 col-lg-3">

            <div class="h4">
                Product Length Inches
            </div>

            <asp:TextBox ID="Txtlength" runat="server" TextMode="Number"></asp:TextBox>

        </div>
        <div class="col-xs-8 col-sm-4 col-md-3 col-lg-3">

            <div class="h4">
                Product Width Inches
            </div>

            <asp:TextBox ID="TxtWidth" runat="server" TextMode="Number"></asp:TextBox>

        </div>
   

        <div class="col-xs-8 col-sm-4 col-md-3 col-lg-3">

            <div class="h4">
                Drawback Number
            </div>

            <asp:TextBox ID="Txtdrawbacknumber" runat="server"></asp:TextBox>

        </div>
        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">

            <div class="h4">
                Shipping Description
            </div>

            <asp:TextBox ID="TxtShippingDescription" runat="server" Width="95%"></asp:TextBox>

        </div>
    </div>
    <div class="row">

        <div class="col-xs-8 col-sm-5 col-md-8 col-lg-3">

            <div class="h4">
                <asp:Label ID="LblPicture" runat="server" Text="Picture"></asp:Label>
            </div>


            <asp:FileUpload ID="FileUploadPic" runat="server" />
        </div>
        <div class="col-xs-8 col-sm-5 col-md-3 col-lg-3">
            <div class="h4">
                <asp:Label ID="LblcurrentImage" runat="server" visable="False" Text="Current Image"></asp:Label>
            </div>
            <br />


            <asp:HyperLink ID="ImageLink" runat="server" Target="_blank">
                <asp:Image ID="ImageCurrent" runat="server" Width="100px" Visible="false" />

            </asp:HyperLink>
        </div>


        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-3">

            <div class="h4">
                <asp:Label ID="Label2" runat="server" Text="Files"></asp:Label>
            </div>


            <asp:FileUpload ID="FileUploadFiles" runat="server" AllowMultiple="True" />
        </div>
        <div class="col-xs-8 col-sm-8 col-md-3 col-lg-3">
            <div class="h4">
                <asp:Label ID="Label3" runat="server" visable="False" Text="Files"></asp:Label>

                <asp:GridView ID="GridViewfiles" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="FileName" HeaderText="File Name" />
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"
                                    CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                            </ItemTemplate>

                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" OnClick="DeleteFile" OnClientClick="return confirm('Are you sure?');"
                                    CommandArgument='<%# Eval("Id") %>'>
                    <span aria-hidden="true"  class="glyphicon glyphicon-trash"> </span>


                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
            <br />



        </div>
    </div>
</div>





    <h3>Materials</h3>

     <asp:Button ID="btnselectMaterials" runat="server" Text="Select Materials"   OnClick="btnselectMaterials_Click" UseSubmitBehavior="False" CausesValidation="False" />



    <hr />
    <!-- Modal -->
    <div class="modal-backdrop" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" runat="server" visible="false">
        <div class="modal-dialog modal-lg" role="document" style="height: 90%; overflow-y:scroll">
            <div class="modal-content" >
                <div class="modal-header">
                       <asp:Button ID="BtmClose" runat="server" Text="Close" class="close"   UseSubmitBehavior="False" CausesValidation="False" OnClick="BtmClose_Click" />

           
                    <h4 class="modal-title" id="myModalLabel">Add New Materials</h4>
                </div>
                <div class="modal-body" >



                    <div class="text-danger">
                    </div>

                    <div class="h4">Choose Material</div>
                      <table style="border-spacing: 2px;">
                <tr>
                    <th>Material Name
                    </th>
                    <th>Category</th>
                   
                </tr>
                <tr>
                    <td style="padding-right: 6px">
                        <asp:TextBox ID="txtMaterial" runat="server" Height="25px"></asp:TextBox></td>
                    <td style="padding-right: 6px">
                        <asp:DropDownList ID="DropDownListCatSearch" runat="server" DataSourceID="SqlDataSourceCat" DataTextField="CategoryName" DataValueField="CategoryName" AutoPostBack="True" AppendDataBoundItems="True">
                            <asp:ListItem Text="All"></asp:ListItem>

                        </asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSourceCat" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT  [CategoryName] FROM [t_MaterialCategory] ORDER BY  [CategoryName]"></asp:SqlDataSource>
                    </td>
                   

                    <td style="padding-right: 6px">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" Height="25px" CausesValidation="false" OnClick="btnSearch_Click" /></td>
                </tr>
            </table>
            <hr />
                   <%-- <asp:Button ID="BtnAddMaterials" runat="server" Text="Add Materials" CausesValidation="false" />--%>
                    <asp:GridView ID="GridViewMaterials" runat="server" Width="90%" DataKeyNames="Id,Price,Width" DataSourceID="srcSqlDataSourceMaterial" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" PageSize="5" OnRowCommand="GridViewMaterials_RowCommand">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                             <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                            <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <div class="text-center">Image</div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <br />
                                    <%--<asp:Image ID="Image1" runat="server" Width="30px" ImageUrl='<%# "../ImageHandler.ashx?ID=" + Eval("ID").ToString + "&Type=Material" %>' />--%>
                                    <asp:HyperLink ID="HyperLink2" runat="server" Width="50px" NavigateUrl='<%# GetUrl("Picview.aspx?ProductID=" + Eval("Id").ToString + "&Type=Material") %>' Target="_blank">

                                        <asp:Image ID="Image2" runat="server" Width="50px" ImageUrl='<%# GetUrl("ImageHandler.ashx?ID=" + Eval("Id").ToString + "&Type=Material") %>' />
                                    </asp:HyperLink>



                                    <br />
                                    <br />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Select the Material you need">

                                <ItemTemplate>
                                    <asp:CheckBox ID="CBSelect" runat="server"  OnCheckedChanged="CBSelect_CheckedChanged" AutoPostBack="true" CausesValidation="false"  />
                                    

                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="srcSqlDataSourceMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Name],[Category], [Id],Notes,Price,Width FROM [t_RawMaterials]"></asp:SqlDataSource>






                </div>
            </div>

        </div>
    </div>

    <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11" >


        <asp:GridView ID="GridViewMaterialDetail" runat="server"  AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id,ProductMaterialID" ForeColor="Black" GridLines="Vertical" AllowPaging="False" AllowSorting="True"  >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <%--    <asp:TemplateField>
                    <ItemTemplate>
                        <br />
                        <asp:Image ID="Image1" runat="server" Width="50px" ImageUrl='<%# "../ImageHandler.ashx?ID=" + Eval("ID").ToString + "&Type=Material" %>' />
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:TemplateField>--%>

                <asp:TemplateField HeaderText="Material Type">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownListID" AppendDataBoundItems="false" SelectedValue='<%# Bind ("Type") %>' DataValueField="Type" runat="server">
                            <asp:ListItem Text="Base Fabrics" Value="Base Fabrics" />
                            <asp:ListItem Text="Applique Fabrics" Value="Applique Fabrics" />
                            <asp:ListItem Text="Trims " Value="Trims " />
                        </asp:DropDownList>

                    </ItemTemplate>


                </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="Material" />
                <asp:TemplateField HeaderText="Price Per Meter">
                    <ItemTemplate>
                        <cc1:CurrencyTextBox ID="TxtPrice" runat="server" Text='<%# Bind("Price", "{0:C}") %>' NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox></td>
                   
                        
                    </ItemTemplate>


                </asp:TemplateField>
                <asp:TemplateField HeaderText="Material Width Inches">
                    <ItemTemplate>
                        <cc1:CurrencyTextBox ID="TxtMaterialWidth" runat="server" Text='<%# Bind("MaterialWidth") %>' NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>

                    </ItemTemplate>


                </asp:TemplateField>


                <asp:TemplateField HeaderText="Length CM">
                    <ItemTemplate>


                        <cc1:CurrencyTextBox ID="TxtLength" runat="server" Text='<%# Bind("Length") %>' NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>

                    </ItemTemplate>


                </asp:TemplateField>
                <asp:TemplateField HeaderText="Width CM" ItemStyle-Wrap="false">
                    <ItemTemplate>

                        <cc1:CurrencyTextBox ID="TxtWidth" runat="server" Text='<%# Bind("UsedWidth") %>' NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>


                    </ItemTemplate>

                </asp:TemplateField>
                <asp:ButtonField ButtonType="Button" CommandName="Remove" Text="Remove" />

                <asp:ButtonField ButtonType="Button" CommandName="Copy" Text="Copy" />

                <%--<asp:BoundField DataField="ProductMaterialID" HeaderText="ProductMaterialID" />
                --%>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </div>
    <asp:Label ID="LblMaterialCost" runat="server" Font-Size="Large" CssClass="text-success" Text=""></asp:Label>


    <br />






    <div id="divAdminOverride" runat="server">
        <div class="row">
            <div class="col-md-4">
                <h3>Admin Override</h3>

            </div>
        </div>
        <hr />
<div style="background-color: lightgray; border-radius: 5px; padding:10px;">
        <div class="row">
            <div class="col-xs-8 col-sm-4 col-md-4">

                <h4>Exchange Rate</h4>
                <table >
                    <tr>

                        <th>INR for 1 USD</th>

                        <td>
                            <cc1:CurrencyTextBox ID="txtERate" runat="server" Width="50px" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox></td>
                    </tr>

                </table>



            </div>

            <div class="col-xs-8 col-sm-4 col-md-4">
                <h4>Other</h4>
                <table >
                    <tr>
                        <th style="white-space:nowrap;">Labor Rate</th>
                        <td style="padding-right:10px;">
                            <cc1:CurrencyTextBox ID="TxtLbrRate" Width="60px" runat="server" Text="" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>

                        </td>
                   
                        <th style="white-space:nowrap;">Markup %</th>
                        <td>
                            <cc1:CurrencyTextBox ID="TxtMarkUP" Width="60px" runat="server" Text="" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>

                        </td>
                    </tr>

                </table>


            </div>
        </div>
    </div>
    <div id="divCracker" runat="server">

        <div class="row">
            <div class="col-md-4">
                <h3>Cracker Barrell</h3>

            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-4">
                <div class="h4">MOQ</div>

                <cc1:CurrencyTextBox ID="TxtMOQ" Width="100px" runat="server" Text="" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>

            </div>
            <div class="col-md-4">
                <div class="h4">BV Price</div>
                <cc1:CurrencyTextBox ID="TxtBVPrice" Width="100px" runat="server" Text="" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>

            </div>
            <div class="col-md-4">
                <div class="h4">FOB Price For 1 CBM</div>
                <cc1:CurrencyTextBox ID="TxtFOBPrice" Width="100px" runat="server" Text="" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>

            </div>

        </div>

        <div class="row">

            <div class="col-md-4">
                <div class="h4">Box Height (CM)</div>
                <cc1:CurrencyTextBox ID="TxtCBBoxHeight" Width="100px" runat="server" Text="" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>

            </div>
            <div class="col-md-4">
                <div class="h4">Box Length (CM)</div>
                <cc1:CurrencyTextBox ID="TxtCBboxlength" Width="100px" runat="server" Text="" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>

            </div>
            <div class="col-md-4">
                <div class="h4">Box Width (CM)</div>
                <cc1:CurrencyTextBox ID="TxtCBBoxWidth" Width="100px" runat="server" Text="" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>

            </div>




        </div>
    </div>


</div>

    <h3>Additional Cost</h3>
    <hr />
                <div style="background-color: lightgray; border-radius: 5px; padding:10px;">
    <div class="row">
        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
            <div class="text-danger">
            </div>

            <div class="h4">Production Time (Hrs)</div>

            <cc1:CurrencyTextBox ID="TxtProductionTime" runat="server" Text="" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="Required" ControlToValidate="TxtProductionTime"></asp:RequiredFieldValidator>


        </div>
        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
            <div class="text-danger">
            </div>

            <div class="h4">Embroidery (INR)</div>

            <cc1:CurrencyTextBox ID="TxtEmbroidery" runat="server" Text="" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>

        </div>
        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
            <div class="text-danger">
            </div>

            <div class="h4">Laser Cuts (INR)</div>

            <cc1:CurrencyTextBox ID="TxtLaserCuts" runat="server" Text="" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>


        </div>
        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
            <div class="text-danger">
            </div>

            <div class="h4">Tags (INR)</div>


            <cc1:CurrencyTextBox ID="TxtTags" runat="server" Text="" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>


        </div>

    </div>
    <div class="row">
        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
            <div class="text-danger">
            </div>

            <div class="h4">Plastic Cover (INR)</div>
            <cc1:CurrencyTextBox ID="TxtPlasticCover" runat="server" Text="" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>



        </div>
        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
            <div class="text-danger">
            </div>

            <div class="h4">Carton Box (INR)</div>

            <cc1:CurrencyTextBox ID="txtCartonBox" runat="server" Text="" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>

        </div>

        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
            <div class="text-danger">
            </div>

            <div class="h4">Packing Labor (INR)</div>

            <cc1:CurrencyTextBox ID="TxtPackingLabor" runat="server" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>

        </div>

    </div>
    <div class="row">
        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
            <div class="text-danger">
            </div>

            <div class="h4">Additional Cost (INR)</div>

            <cc1:CurrencyTextBox ID="TxtAddCost" runat="server" Text="" NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>

        </div>

        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">


            <br />
            <asp:Button ID="BtnPrice" runat="server" Text="Calculate Price" />

            <asp:Button ID="BtnInsert" runat="server" Text="Insert" CausesValidation="False" />
            <asp:Button ID="BtnUpdate" runat="server" Text="Update" visable="false" CausesValidation="False" />
        </div>
    </div>
</div>
    <asp:Label ID="LblPriceRupeebottom" runat="server" Text="" Font-Size="Large" CssClass="text-success"></asp:Label>
    <asp:Label ID="LblPriceUSDBottom" runat="server" Text="" Font-Size="Large" CssClass="text-success"></asp:Label>
    <br />

<div style="background-color: lightgray; border-radius: 5px; padding:10px;">
    <div class="row">

        <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">

            <div class="h4">
                <asp:Label ID="Label1" runat="server" Text="Notes"></asp:Label>
            </div>
            <br />
            <asp:TextBox ID="TxtNotes" runat="server" TextMode="MultiLine" Width="98%" Height="200px"></asp:TextBox>

        </div>

    </div>
    </div>
    <br />

    <div id="divPriceHistory" runat="server" visible="false">
        <div class="h4">Price History</div>

        <asp:GridView ID="GridViewPriceHistory" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="srcSqlDataSourcePriceHistory" ForeColor="Black" GridLines="Both" Width="98%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="PriceRupees" HeaderText="Rupees" SortExpression="PriceRupees" DataFormatString="₹{0:###,###,###.00}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="65px" />
                <asp:BoundField DataField="PriceUSD" HeaderText="USD" SortExpression="PriceUSD" DataFormatString="${0:###,###,###.00}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="65px" />
                <asp:BoundField DataField="Erate" HeaderText="Erate" SortExpression="Erate" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Right" />
                <asp:BoundField DataField="Labor_Rate" HeaderText="Labor Rate" SortExpression="Labor_Rate" DataFormatString="{0:C}" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Right" />
                <asp:BoundField DataField="Markup" HeaderText="Markup" SortExpression="Markup" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Right" />
                <asp:BoundField DataField="ProductionTime" HeaderText="Production" SortExpression="ProductionTime" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Right" />
                <asp:BoundField DataField="MaterialCost" HeaderText="Material Cost" SortExpression="MaterialCost" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Right" />
                <asp:BoundField DataField="Embroidery" HeaderText="Embroidery" SortExpression="Embroidery" DataFormatString="{0:C}" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Right" />
                <asp:BoundField DataField="LaserCuts" HeaderText="Laser" SortExpression="LaserCuts" DataFormatString="{0:C}" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Right" />
                <asp:BoundField DataField="Tags" HeaderText="Tags" SortExpression="Tags" DataFormatString="{0:C}" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Right" />
                <asp:BoundField DataField="PlasticCover" HeaderText="Plastic" SortExpression="PlasticCover" DataFormatString="{0:C}" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Right" />
                <asp:BoundField DataField="CartonBox" HeaderText="Carton" SortExpression="CartonBox" DataFormatString="{0:C}" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Right" />
                <asp:BoundField DataField="PackingLabor" HeaderText="Packing Labor" SortExpression="PackingLabor" DataFormatString="{0:C}" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Right" />
                <asp:BoundField DataField="AdditionalCost" HeaderText="Additional" SortExpression="AdditionalCost" DataFormatString="{0:C}" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Right" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>

        <asp:SqlDataSource ID="srcSqlDataSourcePriceHistory" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Id, OldPriceID, ProductID, Erate, CB_MOQ, CB_BVPrice, CB_Box_Qty, Labor_Rate, Markup, PriceRupees, PriceUSD, MaterialCost, FOBPrice, BVPrice, Date, Embroidery, LaserCuts, Tags, PlasticCover, CartonBox, PackingLabor, AdditionalCost, CB_BoxLength, CB_BoxWidth, CB_BoxHeight, CB_FOB, ProductionTime FROM t_ProductPriceHistory WHERE (ProductID = @ProductID) order by date desc">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="ProductID" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
                 </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
