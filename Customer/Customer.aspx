<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Customer.aspx.vb" Inherits="DOHPricing.Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/jquery-ui.min.js"></script>
    <link type="text/css" rel="Stylesheet" href="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/themes/smoothness/jquery-ui.css">

    <script>

        function openModal() {
            $('#myModal').modal({ show: true });
        };



        $(document).ready(function () {
            $('a#popup').live('click', function (e) {

                var page = $(this).attr("href")  //get url of link
                var wWidth = $(window).width();
                var dWidth = wWidth * 0.8;
                var wHeight = $(window).height();
                var dHeight = wHeight * 0.6;
                var $dialog = $('<div></div>')
                .html('<iframe style="border: 0px; " src="' + page + '" width="100%" height="100%"></iframe>')

                .dialog({
                    autoOpen: false,
                    modal: true,
                    height: dHeight,
                    width: dWidth,
                    title: "Edit Customer",
                    buttons: {
                        "Close": function () { $dialog.dialog('close'); }
                    },
                    close: function (event, ui) {

                        window.location.href = "../Customer/Customer.aspx"; // To refresh gridview when user close dialog
                    }
                });
                $dialog.dialog('open');
                e.preventDefault();
            });
        });

     
    </script>

   
    <div class="row">
        <div class="col-xs-5 col-sm-4 col-md-6 col-lg-7">
            <h1>Customers</h1>
        </div>


        <div class="text-right col-xs-4 col-sm-4 col-md-4 col-lg-3">
            <br />
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" data-keyboard="false" data-backdrop="static">
                Add New Customer
            </button>
        </div>


    </div>


    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Add New Customer</h4>
                </div>
                <div class="modal-body">

                    <div class="text-Center H4">
                        <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
                    </div>

                    <div class="row">
                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                            <div class="text-danger">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorname" runat="server" ErrorMessage="Name is Required" ControlToValidate="txtname"></asp:RequiredFieldValidator>
                            </div>

                            <div class="h4">Name</div>

                            <asp:TextBox ID="TxtName" runat="server" MaxLength="300"></asp:TextBox>
                        </div>
                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                            <div class="text-danger">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice" runat="server" ErrorMessage="Phone Number is Required" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                            </div>

                            <div class="h4">Phone Number</div>
                            <asp:TextBox ID="txtPhone" runat="server" MaxLength="300"></asp:TextBox>

                        </div>
                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                            <div class="text-danger">
                                <br />
                            </div>

                            <div class="h4">Email</div>

                            <asp:TextBox ID="Txtemail" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">

                            <div class="h4">Address</div>

                            <asp:TextBox ID="TxtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">

                            <div class="h4">City</div>

                            <asp:TextBox ID="TextCity" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">

                            <div class="h4">State</div>
                            <asp:TextBox ID="txtState" runat="server"></asp:TextBox>

                        </div>
                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">

                            <div class="h4">Zip</div>
                            <asp:TextBox ID="TxtZip" runat="server"></asp:TextBox>

                        </div>




                    </div>
                    <div class="row">

                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">


                            <div class="h4">Country</div>

                            <asp:TextBox ID="TxtCountry" runat="server"></asp:TextBox>
                        </div>
                          <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">


                            <div class="h4">Code</div>

                            <asp:TextBox ID="TxtCode" runat="server"></asp:TextBox>
                        </div>
                          <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">


                            <div class="h4">Sort Order</div>

                            <asp:TextBox ID="Txtorder" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">


                            <br />
                            <asp:Button ID="Btninsert" runat="server" Text="Insert" />
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>



    <h4 class="panel-title">View All Customers </h4>

    <div style="width: 90%; overflow: auto">
        <asp:GridView ID="GridViewCustomers" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceCustomers" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="90%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField ShowHeader="True" HeaderText="Edit">
                    <EditItemTemplate>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <a id="popup" href='EditCustomer.aspx?id=<%# Eval("Id") %>'><span aria-hidden="true" class="glyphicon glyphicon-pencil"></span></a>

                        <%-- <a id="popup"  >edit</a> --%>
                        <%-- <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" /--%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                <asp:TemplateField HeaderText="Delete" ShowHeader="False" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure?');" Text="Delete">
                                                <span aria-hidden="true"  class="glyphicon glyphicon-trash"> </span>
                        </asp:LinkButton>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
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



    </div>
    <asp:SqlDataSource ID="SqlDataSourceCustomers" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM t_Customer WHERE (Id = @id)" InsertCommand="INSERT INTO t_Customer(CustomerName, PhoneNumber, Email, Address, City, State, Zip, Country,[Order],Code) VALUES (@CustomerName, @PhoneNumber, @Email, @Address, @City, @State, @Zip, @Country,@Order,@Code)" SelectCommand="SELECT Id, CustomerName, PhoneNumber, Email, Address, City, State, Zip, Country,[Order],Code FROM t_Customer" UpdateCommand="UPDATE t_Customer SET CustomerName = @CustomerName, PhoneNumber = @PhoneNumber, Email = @Email, Address = @Address, City = @City, State = @State, Zip = @ZIP, Country = @Country where id = @Id">
        <DeleteParameters>
            <asp:Parameter Name="id" />

        </DeleteParameters>
        <InsertParameters>

            <asp:ControlParameter ControlID="TxtName" Name="CustomerName" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtPhone" Name="PhoneNumber" PropertyName="Text" />
            <asp:ControlParameter ControlID="Txtemail" Name="Email" PropertyName="Text" />
            <asp:ControlParameter ControlID="TxtAddress" Name="Address" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextCity" Name="City" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtState" Name="State" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtZip" Name="Zip" PropertyName="Text" />
            <asp:ControlParameter ControlID="TxtCountry" Name="Country" PropertyName="Text" />
             <asp:ControlParameter ControlID="TxtOrder" Name="Order" PropertyName="Text" />
             <asp:ControlParameter ControlID="TxtCode" Name="Code" PropertyName="Text" />



        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CustomerName" />
            <asp:Parameter Name="PhoneNumber" />
            <asp:Parameter Name="Email" />
            <asp:Parameter Name="Address" />
            <asp:Parameter Name="City" />
            <asp:Parameter Name="State" />
            <asp:Parameter Name="ZIP" />
            <asp:Parameter Name="Country" />
            <asp:Parameter Name="Id" Type="Int32" />

        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
