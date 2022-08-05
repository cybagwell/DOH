<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="NewDocs.aspx.vb" Inherits="DOHPricing.NewDocs" ValidateRequest="False" %>


<%@ Register Assembly="CurrencyTextBox" Namespace="SKP.ASP.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Generate Shipping Documents</h1>

    <br />

    <h3>Choose Shipper/Exporter</h3>
    <br />
    <asp:DropDownList ID="DropDownListShipper" runat="server" DataSourceID="srcSqlDataSourceShipper" DataTextField="Name" DataValueField="Id"></asp:DropDownList>

    <asp:SqlDataSource ID="srcSqlDataSourceShipper" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [Name],( Name + ' <br /> ' + Address + '<br /> ' + City + ', ' + State + ', ' + cast(Zip as varchar(100)) + '  ' + Country + '<br /> PN:' + cast(Phone as varchar(50)) + '<br /> Email:' + Email + '<br /> Contact:' + Contact) as ShipperInfo FROM [t_Shipper] ORDER BY [Name]"></asp:SqlDataSource>

    <br />
    <h3>Choose Consignee</h3>
    <br />
    <asp:DropDownList ID="DropDownListConsignee" runat="server" DataSourceID="srcSqlDataSourceConsignee" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
    <asp:SqlDataSource ID="srcSqlDataSourceConsignee" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Con.Id, Con.[Name],( Con.Name + ' &lt;br /&gt; ' + Con.Address + '&lt;br /&gt; ' + Con.City + ', ' + Con.State + ', ' + cast(Con.Zip as varchar(100)) + '  ' + Con.Country + '&lt;br /&gt; PN:' + cast(Con.Phone as varchar(50)) + '&lt;br /&gt; Email:' + Con.Email) as ConsigneeInfo, Con.PortOfLoading,Con.PortOfDischarge,Con.PlaceofDelivery,
( Buy.Name + ' &lt;br /&gt; ' + buy.Address + '&lt;br /&gt; ' + Buy.City + ', ' + buy.State + ', ' + cast(buy.Zip as varchar(100)) + '  ' + buy.Country + '&lt;br /&gt; PN:' + cast(buy.Phone as varchar(50)) + '&lt;br /&gt; Email:' + buy.Email) as BuyerInfo FROM
t_Consignee Con
inner join  [t_Buyer] Buy
on Con.BuyerID = Buy.Id

ORDER BY  con.Name"></asp:SqlDataSource>
   
    <br />
     <h3>Choose Mode of Transport</h3>
    <br />
    <asp:DropDownList ID="DropDownListMode" runat="server" DataSourceID="srcSqlDataSourceMode" DataTextField="Mode" DataValueField="Mode"></asp:DropDownList>
    <asp:SqlDataSource ID="srcSqlDataSourceMode" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [Mode] FROM [t_ModeOfTransport] ORDER BY [Mode]"></asp:SqlDataSource>
    <br />
     <h3>Choose Terms Of Payment</h3>
    <br />
    <asp:DropDownList ID="DropDownListTerms" runat="server" DataSourceID="srcSqlDataSourceTerms" DataTextField="Term" DataValueField="Term"></asp:DropDownList>
    <asp:SqlDataSource ID="srcSqlDataSourceTerms" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [Term] FROM [t_TermsOfPayment]"></asp:SqlDataSource>
    <br />
       <h3>Choose Terms Of Delivery</h3>
    <br />
    <asp:DropDownList ID="DropDownListTermsDelivery" runat="server" DataSourceID="srcSqlDataSourceTermsDelivery" DataTextField="Term" DataValueField="Term"></asp:DropDownList>
    <asp:SqlDataSource ID="srcSqlDataSourceTermsDelivery" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [Term] FROM [t_TermsOfDelivery]"></asp:SqlDataSource>
    <br />
     <h3>Choose Products with Qty</h3>

    <br />
      <asp:GridView ID="GridViewProducts" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="srcSqlDataSourceProducts" ForeColor="Black" GridLines="Vertical" Width="90%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField>
                   <ItemTemplate>
                    <br />
                    <asp:Image ID="Image1" runat="server" width="50px" ImageUrl='<%# "../ImageHandler.ashx?ID=" + Eval("Id").ToString + "&Type=Product" %>' />
                    <br />
                     <br />
                </ItemTemplate>

            </asp:TemplateField>
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="SKU" HeaderText="SKU" SortExpression="SKU" />
            <asp:BoundField DataField="UPC" HeaderText="UPC" SortExpression="UPC" />
            <asp:BoundField DataField="NumPerBox" HeaderText="Per Box" SortExpression="NumPerBox" />
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <%--<cc1:CurrencyTextBox ID="TxtQty" runat="server" Width="100px" NumberOfDecimals="2" AutoPostBack="True" OnTextChanged="TxtQty_TextChanged"></cc1:CurrencyTextBox>--%>
                    <asp:TextBox ID="TxtQty" runat="server" Width="100px"   AutoPostBack="True" OnTextChanged="TxtQty_TextChanged" ></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>

              <asp:TemplateField HeaderText="PO">
                <ItemTemplate>
                    <%--<cc1:CurrencyTextBox ID="TxtPO" runat="server" Width="100px" NumberOfDecimals="0" AutoPostBack="True" ></cc1:CurrencyTextBox>--%>
                         <asp:TextBox ID="TxtPO" runat="server" NumberOfDecimals="2" Width="100px"   ReadOnly="true"  ></asp:TextBox>
              
                </ItemTemplate>
            </asp:TemplateField>
              <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:TextBox ID="txtprice" runat="server" Text=""  ReadOnly="true" Width="100px" ></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
       <%--     <asp:TemplateField HeaderText="Select">
               
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBoxSelect" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBoxSelect_CheckedChanged" />
                </ItemTemplate>
            </asp:TemplateField>--%>
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
    <asp:SqlDataSource ID="srcSqlDataSourceProducts" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="Select PH.Id,ProductName,SKU,UPC,NumPerBox,ProductImage,CustomerID,CustomerName,PriceRupees,PriceUSD,cast((Labor_Rate * ProductionTime) as decimal(10,2)) as LaborCost from t_ProductHeader PH inner Join t_Customer Cust on PH.CustomerID = Cust.ID 
inner join t_ProductPrice Price on PH.Id = Price.ProductID order by ProductName"></asp:SqlDataSource>
   
    <asp:Button ID="BtnGen" runat="server" Text="Generate Documents" />
</asp:Content>
