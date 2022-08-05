<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Invoice.aspx.vb" Inherits="DOHPricing.Shipment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Invoice</h1>


 <table>
     <tr>
         <td>
             <asp:TextBox ID="TxtInvoice" runat="server" Text="Invoice No" TextMode="MultiLine"></asp:TextBox>

         </td>

            <td>
           

             <asp:TextBox ID="TxtInvoiceDate" runat="server" Text="Invoice Date" TextMode="MultiLine" ></asp:TextBox>


         </td>
          <td>
           

             <asp:TextBox ID="TxtExportReference" runat="server" Text="<b>Export Reference:</b> <br/> 0711025461   /01.12.2011" TextMode="MultiLine" ></asp:TextBox>


         </td>


     </tr>





     <tr>
         <td>
             <asp:TextBox ID="TxtShipper" runat="server" Text="Shipper/Exporter" TextMode="MultiLine"></asp:TextBox>

         </td>

            <td>
           

             <asp:TextBox ID="TxtBuyerinfo" runat="server" Text="Buyer (if other than Consignee)" TextMode="MultiLine" ></asp:TextBox>


         </td>



     </tr>
     



 </table>






</asp:Content>
