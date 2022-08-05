<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="RoleManagement.aspx.vb" Inherits="DOHPricing.RoleManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col-md-12">
            <h2>Admin Panel</h2>
            <br />
        </div>
        <div class="col-md-8">
            <asp:Label ID="Label3" runat="server" Text="Add user to role:  "></asp:Label>
            <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource1" DataTextField="UserName" DataValueField="ID">
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Name">
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="Add user to role" />
        </div>
        <div class="col-md-8">
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Remove user from role:   "></asp:Label>

            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="UserName" DataValueField="ID">
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Name">
            </asp:DropDownList> &nbsp

            <asp:Button ID="btnremoverole" runat="server" Text="Remove user from role" Height="26px" />

            <br />
            <br />
            <div>
                <h2>Manage Roles</h2>
            </div>
            <br />
            <asp:TextBox ID="RoleTextBox" runat="server"></asp:TextBox>
            <asp:Button ID="CreateRole" runat="server" Text="Create Role" />
            <br />
            <br />
            <asp:Label ID="Msg" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Name] FROM [AspNetRoles]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID],[UserName] FROM [AspNetUsers]"></asp:SqlDataSource>
                <br />
            <br />

        </div>
    </div>
</asp:Content>
