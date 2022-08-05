<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Mode.aspx.vb" Inherits="DOHPricing.Mode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <script>

        function openModal() {
            $('#myModal').modal({ show: true });
        };

    </script>

    <div class="row">
        <div class="col-xs-5 col-sm-4 col-md-6 col-lg-7">
            <h1>Mode Of Transport</h1>
        </div>


        <div class="text-right col-xs-4 col-sm-4 col-md-4 col-lg-3">
            <br />
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" data-keyboard="false" data-backdrop="static">
                Add New Mode
            </button>
        </div>


    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Add New Mode</h4>
                </div>
                <div class="modal-body">

                    <asp:FormView ID="FormViewMode" runat="server" AllowPaging="True" DefaultMode="Insert" DataKeyNames="Id" DataSourceID="srcSqlDataSourceMode" CellPadding="4" ForeColor="#333333">

                        <EditItemTemplate>
                            Id:
                            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                            <br />
                            Mode:
                            <asp:TextBox ID="ModeTextBox" runat="server" Text='<%# Bind("Mode") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>

                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>

                            Mode:
                            <asp:TextBox ID="ModeTextBox" runat="server" Text='<%# Bind("Mode") %>' />
                           


                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>

                        <ItemTemplate>
                            Id:
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                            <br />
                            Mode:
                            <asp:Label ID="ModeLabel" runat="server" Text='<%# Bind("Mode") %>' />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                        </ItemTemplate>

                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:FormView>

                </div>
            </div>
        </div>
    </div>
   
    <asp:GridView ID="GridViewMode" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="srcSqlDataSourceMode" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="Mode" HeaderText="Mode" SortExpression="Mode" />
         
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


    <asp:SqlDataSource ID="srcSqlDataSourceMode" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO t_ModeOfTransport(Mode) VALUES (@Mode)" SelectCommand="SELECT Id, Mode FROM t_ModeOfTransport" UpdateCommand="UPDATE t_ModeOfTransport SET Mode = @Mode where id = @Id">
        <InsertParameters>
            <asp:Parameter Name="Mode" />
           
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Mode" />
            <asp:Parameter Name="Id" />
        </UpdateParameters>
    </asp:SqlDataSource>


</asp:Content>
