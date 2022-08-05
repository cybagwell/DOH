<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AdminControls.aspx.vb" Inherits="DOHPricing.AdminControls" %>

<%@ Register Assembly="CurrencyTextBox" Namespace="SKP.ASP.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Admin Controls</h2>
    </div>
    <asp:HiddenField ID="HfID" runat="server" Value="0" />
    
    
    
    
    <div class="row">
        <div class="col-md-4">
            <h3>Exchange Rate</h3>
            <table style="width: 150px">
                <tr>

                    <th>INR for 1 USD</th>

                    <td>
                        <cc1:CurrencyTextBox ID="txtERate" runat="server" Width="50px" NumberOfDecimals="2"></cc1:CurrencyTextBox></td>
                </tr>

            </table>



        </div>
        <div class="col-md-4">
            <h3>Cracker Barrell</h3>
            <table style="width: 200px">
                <tr>
                    <th>MOQ</th>
                    <td>
                        <asp:TextBox ID="TxtMOQ" runat="server" TextMode="Number" Width="100px"></asp:TextBox></td>
                </tr>
                 <tr>
                    <th>FOB Price for 1 CBM</th>
                    <td>
                        <asp:TextBox ID="TxtFobPrice" runat="server" TextMode="Number" Width="100px"></asp:TextBox></td>
                </tr>
                <tr>
                    <th>BV Price</th>
                    <td>
                        <asp:TextBox ID="TxtBVPrice" runat="server" TextMode="Number" Width="100px"></asp:TextBox>
                    </td>
                </tr>
               
            </table>
        </div>
        <div class="col-md-4">
            <h3>Other</h3>
            <table style="width: 150px">
                <tr>
                    <th>Labor Rate</th>
                    <td>
                        <asp:TextBox ID="TxtLbrRate" TextMode="Number" runat="server" Width="60px"></asp:TextBox></td>
                </tr>
                <tr>
                    <th>Markup %</th>
                    <td>
                        <asp:TextBox ID="TxtMarkUP" runat="server" TextMode="Number" MaxLength="3" Width="60px"></asp:TextBox></td>
                </tr>

            </table>


        </div>
    </div>
    <div class="col-xs-offset-2 col-sm-offset-2 col-md-offset-10 col-lg-offset-10">
        <br />
        <div  class="H4">
        <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
    </div>
        <asp:Button ID="BtnSave" runat="server" Text="Save" />
        <asp:SqlDataSource ID="srcSqlAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Id, Erate, CB_MOQ, CB_BVPrice,  Labor_Rate, Markup,CB_FOB FROM t_ADMIN_Controls" UpdateCommand="

IF @ID = 0 BEGIN
	INSERT INTO t_ADMIN_Controls (
		Erate,
		[CB_MOQ],
		[CB_BVPrice],
		[Labor_Rate],
		[Markup],
        [CB_FOB]    	)
	VALUES (
		@Erate,
		@CB_MOQ,
		@CB_BVPrice,
		@Labor_Rate,
		@Markup,
        @CB_FOB    )
	
END
ELSE 
BEGIN
	UPDATE t_ADMIN_Controls SET Erate = @Erate, CB_MOQ = @CB_MOQ, CB_BVPrice = @CB_BVPrice,  Labor_Rate = @Labor_Rate, Markup = @Markup, CB_FOB = @CB_FOB WHERE (Id = @ID)
END">
            <UpdateParameters>
                <asp:ControlParameter ControlID="HfID" Name="ID" PropertyName="Value" />
                <asp:ControlParameter ControlID="txtERate" Name="Erate" PropertyName="Text" />
                <asp:ControlParameter ControlID="TxtMOQ" Name="CB_MOQ" PropertyName="Text" />
                <asp:ControlParameter ControlID="TxtBVPrice" Name="CB_BVPrice" PropertyName="Text" />
                <asp:ControlParameter ControlID="TxtLbrRate" Name="Labor_Rate" PropertyName="Text" />
                <asp:ControlParameter ControlID="TxtMarkUP" Name="Markup" PropertyName="Text" />
                <asp:ControlParameter ControlID="TxtFobPrice" Name="CB_FOB" PropertyName="Text" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>



</asp:Content>
