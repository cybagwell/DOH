<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Buyer.aspx.vb" Inherits="DOHPricing.Buyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>

        function openModal() {
            $('#myModal').modal({ show: true });
        };

    </script>

    <div class="row">
        <div class="col-xs-5 col-sm-4 col-md-6 col-lg-7">
            <h1>Buyer</h1>
        </div>


        <div class="text-right col-xs-4 col-sm-4 col-md-4 col-lg-3">
            <br />
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" data-keyboard="false" data-backdrop="static">
                Add New Buyer
            </button>
        </div>


    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Add New Buyer</h4>
                </div>
                <div class="modal-body">

                    <asp:FormView ID="FormViewShipper" runat="server" AllowPaging="True" DefaultMode="Insert" DataKeyNames="Id" DataSourceID="srcSqlDataSourceBuyer" CellPadding="4" ForeColor="#333333">

                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>

                            <div class="row">
                                <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5">
                                    <div class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorname" runat="server" ErrorMessage="Name is Required" ControlToValidate="NameTextBox"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="h4">Name</div>

                                    <asp:TextBox ID="NameTextBox" Width="98%" runat="server" Text='<%# Bind("Name")%>' />
                                </div>
                           


                            </div>
                            <div class="row">
                                <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
                                    <div class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice" runat="server" ErrorMessage="Address is Required" ControlToValidate="AddressTextBox"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="h4">Address</div>

                                    <asp:TextBox ID="AddressTextBox" Width="100%" runat="server" Text='<%# Bind("Address")%>' TextMode="MultiLine" />


                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <div class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorWidth" runat="server" ErrorMessage="City is Required" ControlToValidate="CityTextBox"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="h4">City</div>

                                    <asp:TextBox ID="CityTextBox" Width="100%" runat="server" Text='<%# Bind("City") %>' />

                                </div>


                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <div class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="State is Required" ControlToValidate="StateTextBox"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="h4">State</div>
                                    <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />


                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <div class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Zip is Required" ControlToValidate="ZipTextBox"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="h4">Zip</div>

                                    <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' />
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <div class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Country is Required" ControlToValidate="CountryTextBox"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="h4">Country</div>


                                    <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                                </div>

                            </div>


                            <div class="row">
                                <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                                     <div class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Phone is Required" ControlToValidate="PhoneTextBox"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="h4">Phone</div>
                                    <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />


                                </div>
                                <div class="col-xs-8 col-sm-5 col-md-5 col-lg-5">
                                     <div class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email is Required" ControlToValidate="EmailTextBox"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="h4">Email</div>


                                    <asp:TextBox ID="EmailTextBox" Width="100%" runat="server" Text='<%# Bind("Email") %>' />
                                </div>







                            </div>
                            


                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>

                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:FormView>

                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="srcSqlDataSourceCosignee" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Id, Name FROM t_Consignee order by Name"></asp:SqlDataSource>

    <asp:GridView ID="GridViewBuyer" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="srcSqlDataSourceBuyer" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
          
           <%-- <asp:BoundField DataField="PortOfLoading" HeaderText="PortOfLoading" SortExpression="PortOfLoading" />
            <asp:BoundField DataField="PortOfDischarge" HeaderText="PortOfDischarge" SortExpression="PortOfDischarge" />
            <asp:BoundField DataField="PlaceOfDelivery" HeaderText="PlaceOfDelivery" SortExpression="PlaceOfDelivery" />--%>
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


    <asp:SqlDataSource ID="srcSqlDataSourceBuyer" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO t_Buyer(Name, Address, City, State, Zip, Country, Phone, Email) VALUES (@Name, @Address, @City, @State, @Zip, @Country, @Phone, @Email)" SelectCommand="SELECT Id, Name , Address, City, State, Zip, Country, Phone, Email FROM t_Buyer ORDER BY Name" UpdateCommand="UPDATE t_Buyer SET Name = @Name, Address = @Address, City = @City, State = @State, Zip = @Zip, Country = @Country, Phone = @Phone, Email = @Email WHERE (Id = @Id)">
        <InsertParameters>
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="Address" />
            <asp:Parameter Name="City" />
            <asp:Parameter Name="State" />
            <asp:Parameter Name="Zip" />
            <asp:Parameter Name="Country" />
            <asp:Parameter Name="Phone" />
            <asp:Parameter Name="Email" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="Address" />
            <asp:Parameter Name="City" />
            <asp:Parameter Name="State" />
            <asp:Parameter Name="Zip" />
            <asp:Parameter Name="Country" />
            <asp:Parameter Name="Phone" />
            <asp:Parameter Name="Email" />
            <asp:Parameter Name="Id" />
        </UpdateParameters>
    </asp:SqlDataSource>




</asp:Content>
