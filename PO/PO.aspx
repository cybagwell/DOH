<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="PO.aspx.vb" Inherits="DOHPricing.PO" %>

<%@ Register Assembly="CurrencyTextBox" Namespace="SKP.ASP.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>POs</h1>


    <asp:FormView ID="FormViewPOs" runat="server" Width="75%" CellPadding="4" DataKeyNames="PONumber" DataSourceID="SrcSqlDataSourcePO" ForeColor="#333333" DefaultMode="Insert">
        <EditItemTemplate>
             <h2>Edit PO  <asp:label ID="Label1" runat="server" Text='<%# Eval("PONUmber") %>' TextMode="Date" ReadOnly="True" /></td>
 </h2>
          
          <hr />
            <table style="width: 75%">
                <tr>
                    <td>
                        <h4>Choose Shipper/Exporter</h4>
                    </td>
                    <td>
                        <h4>Choose Buyer</h4>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="DropDownListShipper" runat="server" DataSourceID="srcSqlDataSourceShipper" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("ShipperID") %>'></asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListBuyer" runat="server" DataSourceID="srcSqlDataSourceBuyer" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("BuyerID") %>'></asp:DropDownList>

                    </td>
                </tr>


                <tr>
                    <td>
                        <h4>PODate:</h4>
                    </td>
                    <td>
                        <h4>CompletionDate:</h4>
                    </td>
                </tr>

                <tr>
                    <td>
                      
                        <asp:TextBox ID="PODateTextBox" runat="server" Text='<%# Bind("PODate", "{0:yyyy-MM-dd}") %>' TextMode="Date"  /></td>
                    <td>
                        <asp:TextBox ID="CompletionDateTextBox" runat="server" Text='<%# Bind("CompletionDate", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
                    </td>
                </tr>

            </table>


            <br />
            <h4>Notes:</h4>
            <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' TextMode="MultiLine" />
            <br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            <h2>Add A New PO</h2>
            <hr />
            <table style="width: 75%">
                <tr>
                    <td>
                        <h4>Choose Shipper/Exporter</h4>
                    </td>
                    <td>
                        <h4>Choose Buyer</h4>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="DropDownListShipper" runat="server" DataSourceID="srcSqlDataSourceShipper" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("ShipperID") %>'></asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListBuyer" runat="server" DataSourceID="srcSqlDataSourceBuyer" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("BuyerID") %>'></asp:DropDownList>

                    </td>
                </tr>


                <tr>
                    <td>
                        <h4>PODate:</h4>
                    </td>
                    <td>
                        <h4>CompletionDate:</h4>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:TextBox ID="PODateTextBox" runat="server" Text='<%# Bind("PODate") %>' TextMode="Date" /></td>
                    <td>
                        <asp:TextBox ID="CompletionDateTextBox" runat="server" Text='<%# Bind("CompletionDate") %>' TextMode="Date" />
                    </td>
                </tr>

            </table>


            <br />
            <h4>Notes:</h4>
            <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' TextMode="MultiLine" />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <h2>PO       <asp:label ID="Label1" runat="server" Text='<%# Eval("PONUmber") %>' TextMode="Date" ReadOnly="True" /></td>
    </h2>

              <hr />
            <table style="width: 75%">
                <tr>
                    <td>
                        <h4>Choose Shipper/Exporter</h4>
                    </td>
                    <td>
                        <h4>Choose Buyer</h4>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="DropDownListShipper" runat="server" DataSourceID="srcSqlDataSourceShipper" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("ShipperID") %>' Enabled="False"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListBuyer" runat="server" DataSourceID="srcSqlDataSourceBuyer" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("BuyerID") %>' Enabled="False"></asp:DropDownList>

                    </td>
                </tr>


                <tr>
                    <td>
                        <h4>PODate:</h4>
                    </td>
                    <td>
                        <h4>CompletionDate:</h4>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:label ID="POlabel" runat="server" Text='<%# Eval("PODate", "{0:d MMM yyyy }") %>' TextMode="Date" ReadOnly="True" /></td>
                    <td>
                        <asp:label ID="CompletionDatelabel" runat="server" Text='<%# Eval("CompletionDate", "{0:d MMM yyyy }")%>' TextMode="Date" />
                    </td>
                </tr>

            </table>


            <br />
            <h4>Notes:</h4>
            <asp:label ID="NotesLabel" runat="server" Text='<%# Bind("Notes") %>'  />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:FormView>

    <asp:SqlDataSource ID="srcSqlDataSourceBuyer" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [Name] FROM [t_Buyer] ORDER BY [Name]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="srcSqlDataSourceShipper" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [Name],( Name + ' <br /> ' + Address + '<br /> ' + City + ', ' + State + ', ' + cast(Zip as varchar(100)) + '  ' + Country + '<br /> PN:' + cast(Phone as varchar(50)) + '<br /> Email:' + Email + '<br /> Contact:' + Contact) as ShipperInfo FROM [t_Shipper] ORDER BY [Name]"></asp:SqlDataSource>

    <asp:FormView ID="FormViewPOproducts" runat="server" CellPadding="4" DataKeyNames="Id" DataSourceID="srcSqlDataSourcePOProducts" DefaultMode="Insert" ForeColor="#333333" Visible="False" Width="75%" >

        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            <h2>Add A New Product To This PO</h2>

            <table style="width: 75%">

                <tr>
                    <th>Product:</th>
                
                </tr>
                <tr>
                    <td colspan="3">

                        <asp:DropDownList ID="DropDownListProducts" runat="server" DataSourceID="srcSqlDataSourceProducts" DataTextField="Product" DataValueField="Id" SelectedValue='<%# Bind("ProductID") %>'></asp:DropDownList>
                    </td>

                   
                </tr>

                <tr>
                        <th>QTY:</th>
                    <th>Price:</th>
                    <th>ShipDate:</th>

                </tr>

                <tr>
                     <td>
                        <asp:TextBox ID="QTYTextBox" runat="server" Text='<%# Bind("QTY") %>' TextMode="Number" />
                    </td>
                    <td>


                        <cc1:CurrencyTextBox ID="TxtPrice" runat="server" Text='<%# Bind("Price", "{0:C}") %>' NumberOfDecimals="2" MaxLength="6"></cc1:CurrencyTextBox>

                    </td>
                    <td>
                        <asp:TextBox ID="ShipDateTextBox" runat="server" Text='<%# Bind("ShipDate") %>' TextMode="Date" />
                    </td>

                </tr>
                <tr>
                    <th>Notes:</th></tr>
                    <tr>
                    <td colspan="3">
                        <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' TextMode="MultiLine" />
                    </td>


                </tr>
            </table>




            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>

        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:FormView>


    <asp:GridView ID="GridViewPOProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="srcSqlDataSourcePOProducts" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="PONumber" HeaderText="PONumber" SortExpression="PONumber" />
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="ShipDate" HeaderText="ShipDate" SortExpression="ShipDate" />
            <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
            <asp:BoundField DataField="QTY" HeaderText="QTY" SortExpression="QTY" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:ButtonField ButtonType="Button" CommandName="edit" Text="Edit" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" CssClass="h3" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:HiddenField ID="HiddenFieldponum" runat="server" />
    <asp:SqlDataSource ID="srcSqlDataSourceProducts" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Id, ProductName + ' - ' + SKU AS Product FROM t_ProductHeader ORDER BY ProductName"></asp:SqlDataSource>


    <asp:SqlDataSource ID="srcSqlDataSourcePOProducts" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT t_POProducts.Id, t_POProducts.PONumber, t_POProducts.ProductID, t_ProductHeader.ProductName, t_POProducts.ShipDate, t_POProducts.Notes, t_POProducts.QTY, t_POProducts.Price FROM t_POProducts INNER JOIN t_ProductHeader ON t_POProducts.ProductID = t_ProductHeader.Id WHERE (t_POProducts.PONumber = @PONumber) ORDER BY t_ProductHeader.ProductName" UpdateCommand="UPDATE t_POProducts SET ShipDate = @ShipDate, Notes = @Notes, QTY = @Qty, ProductID = @ProductID, Price = @Price WHERE (Id = @ID)" InsertCommand="INSERT INTO t_POProducts(PONumber, ProductID, ShipDate, Notes, QTY, Price) VALUES (@PONumber, @ProductID, @ShipDate, @Notes, @Qty, @Price)" DeleteCommand="DELETE FROM t_POProducts WHERE (Id = @id)">
        <InsertParameters>
            <asp:ControlParameter ControlID="HiddenFieldponum" Name="PONumber" PropertyName="Value" />
            <asp:Parameter Name="ProductID" />
            <asp:Parameter Name="ShipDate" />
            <asp:Parameter Name="Notes" />
            <asp:Parameter Name="Qty" />
            <asp:Parameter Name="Price" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenFieldponum" Name="PONumber" PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ShipDate" />
            <asp:Parameter Name="Notes" />
            <asp:Parameter Name="Qty" />
            <asp:Parameter Name="ProductID" />
            <asp:Parameter Name="Price" />
            <asp:Parameter Name="ID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SrcSqlDataSourcePO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO t_PO(ShipperID, BuyerID,  PODate, CompletionDate, Notes) VALUES (@ShipperID, @BuyerID,  @PODate, @CompletionDate, @Notees); SELECT @PONumber = @@IDENTITY" SelectCommand="SELECT * FROM [t_PO]
where ponumber = @ponumber" UpdateCommand="UPDATE t_PO SET ShipperID = @ShipperID, BuyerID = @BuyerID, PODate = @PODate, CompletionDate = @CompletionDate, Notes = @Notes WHERE (PONumber = @PONumber)">
        <InsertParameters>
            <asp:Parameter Name="ShipperID" />
            <asp:Parameter Name="BuyerID" />

            <asp:Parameter Name="PODate" />
            <asp:Parameter Name="CompletionDate" />
            <asp:Parameter Name="Notees" />
            <asp:parameter direction="Output" name="PONumber" type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenFieldponum" Name="ponumber" PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ShipperID" />
            <asp:Parameter Name="BuyerID" />

            <asp:Parameter Name="PODate" />
            <asp:Parameter Name="CompletionDate" />
            <asp:Parameter Name="Notes" />
            <asp:Parameter Name="PONumber" />
        </UpdateParameters>

    </asp:SqlDataSource>





</asp:Content>
