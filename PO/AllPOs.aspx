<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AllPOs.aspx.vb" Inherits="DOHPricing.AllPOs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <h1>All POs</h1>
    <asp:GridView ID="GridViewPOS" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="srcSqlPOS" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="98%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
             <asp:BoundField DataField="PONumber" HeaderText="PO Number" SortExpression="PONumber" />
            
            <asp:BoundField DataField="Shipper" HeaderText="Shipper" SortExpression="Shipper" />
            <asp:BoundField DataField="Buyer" HeaderText="Buyer" SortExpression="Buyer" />
            <asp:BoundField DataField="PODate" HeaderText="PODate" SortExpression="PODate" DataFormatString="{0:ddd, d/MM/yyyy}" />
            <asp:BoundField DataField="CompletionDate" HeaderText="CompletionDate" SortExpression="CompletionDate" />
            <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
               <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>

                <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="False" Text="Edit" PostBackUrl='<%# "../PO/PO.aspx?PONumber=" + Eval("PONumber").ToString %>'>
                                                <span aria-hidden="true"  class="glyphicon glyphicon-pencil"> </span>
                    </asp:LinkButton>
                
                
                
                </ItemTemplate>
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
    <asp:SqlDataSource ID="srcSqlPOS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT t_PO.PONumber, t_Shipper.Name AS Shipper, t_Buyer.Name AS Buyer, t_PO.PODate, t_PO.CompletionDate, t_PO.Notes FROM t_PO INNER JOIN t_Shipper ON t_PO.ShipperID = t_Shipper.Id INNER JOIN t_Buyer ON t_PO.BuyerID = t_Buyer.Id ORDER BY t_PO.PODate"></asp:SqlDataSource>
</asp:Content>
