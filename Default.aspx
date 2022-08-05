<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="DOHPricing._Default"   ValidateRequest="false" %>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script>

        function openModal() {
            $('#myModal').modal({ show: true });
        };




    </script>
   
    
    
    
    <br />
      <br />
    <div id="divnotifications" runat="server" visible="false">
    
     
        
        
        
        
        
        
        
        <asp:ListView ID="ListViewnotifications" runat="server" DataSourceID="SqlDataSourcenotifications" DataKeyNames="id">
            <AlternatingItemTemplate>
                <li style="background-color: #FFF8DC;">Notification:
                    <asp:Label ID="NotificationLabel" runat="server" Text='<%# Eval("Notification") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </li>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <li style="background-color: #008A8C;color: #FFFFFF;">Notification:
                    <asp:TextBox ID="NotificationTextBox" runat="server" Text='<%# Bind("Notification") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </li>
            </EditItemTemplate>
            <EmptyDataTemplate>
                No notifications.
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <li style="">Notification:
                    <asp:TextBox ID="NotificationTextBox" runat="server" Text='<%# Bind("Notification") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </li>
            </InsertItemTemplate>
            <ItemSeparatorTemplate>
<br />
            </ItemSeparatorTemplate>
            <ItemTemplate>
                <li style="background-color: #DCDCDC;color: #000000;">Notification:
                    <asp:Label ID="NotificationLabel" runat="server" Text='<%# Eval("Notification") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </li>
            </ItemTemplate>
            <LayoutTemplate>
                <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <li runat="server" id="itemPlaceholder" />
                </ul>
                <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">Notification:
                    <asp:Label ID="NotificationLabel" runat="server" Text='<%# Eval("Notification") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </li>
            </SelectedItemTemplate>
        </asp:ListView>    
   <asp:SqlDataSource ID="SqlDataSourcenotifications" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO t_Notifications(Notification) VALUES (@notification)" SelectCommand="SELECT id ,Notification FROM t_Notifications ORDER BY CreateDate DESC" DeleteCommand="DELETE FROM t_Notifications WHERE (Id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="TxtNotification" Name="notification" PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
     
    
    
    
    
    </div>





    <br />
     <div id="divnotificationsinsert" runat="server" visible="false">
      <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" data-keyboard="false" data-backdrop="static">
                Add New Notifications
            </button>
     <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Add New Notification</h4>
                </div>
                <div class="modal-body">
                    

        <table style="width: 98%">
            <tr>
                <th> Add Notification</th>


            </tr>
            <tr>
                <td> 
                     <FTB:FreeTextBox ID="TxtNotification"  runat="server" Width="98%" Height="200px" >
                        </FTB:FreeTextBox>
                    
                    
                   </td>
                <td>
                    <asp:Button ID="BtnAdd" runat="server" Text="Insert" /></td>
            </tr>

        </table>


 
                   
            </div>
        </div>
    </div>
        </div>

       </div>
    
</asp:Content>
