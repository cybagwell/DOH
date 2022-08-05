<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EditCustomer.aspx.vb" Inherits="DOHPricing.EditCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <link type="text/css" rel="Stylesheet" href="../Content/bootstrap.css">
  
      <div class="text-Center H4">
                        <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
                    </div>

                 
                                <asp:FormView ID="FormViewcustomeredit" runat="server" width="98%" DataKeyNames="Id" DataSourceID="SqlDataSourceeditCustomer" DefaultMode="Edit">
                                    <EditItemTemplate>
                                       
                    <div class="row">
                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                            <div class="text-danger">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorname" runat="server" ErrorMessage="Name is Required" ControlToValidate="CustomerNameTextBox"></asp:RequiredFieldValidator>
                            </div>

                            <div class="h4">Name</div>

                             <asp:TextBox ID="CustomerNameTextBox" runat="server" Text='<%# Bind("CustomerName") %>' />
                        </div>
                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                            <div class="text-danger">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice" runat="server" ErrorMessage="Phone Number is Required" ControlToValidate="PhoneNumberTextBox"></asp:RequiredFieldValidator>
                            </div>

                            <div class="h4">Phone Number</div>
                            <asp:TextBox ID="PhoneNumberTextBox" runat="server" Text='<%# Bind("PhoneNumber") %>' />

                        </div>
                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                            <div class="text-danger">
                                <br />
                            </div>

                            <div class="h4">Email</div>

                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">

                            <div class="h4">Address</div>
                             <asp:TextBox ID="AddressTextBox" runat="server" TextMode="MultiLine" Text='<%# Bind("Address") %>' />
                          
                        </div>
                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">

                            <div class="h4">City</div>

                              <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        </div>
                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                            
                            <div class="h4">State</div>
                             <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                          
                        </div>
                         <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                            
                            <div class="h4">Zip</div>
                              <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' />
                          
                        </div>




                    </div>
                    <div class="row">

                         <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                           

                            <div class="h4">Country</div>

                           <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                        </div>
                         <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">


                            <div class="h4">Code</div>

                            <asp:TextBox ID="TxtCode" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                        </div>
                          <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">


                            <div class="h4">Sort Order</div>

                            <asp:TextBox ID="Txtorder" runat="server" Text='<%# Bind("Order") %>'></asp:TextBox>
                        </div>
                         <div class="col-xs-8 col-sm-4 col-md-4 col-lg-3">
                           

                         <br />
                      <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" class="btn btn-default" data-dismiss="modal" CommandName="Update" Text="Update" />
                        </div>
                    </div>

                                       
                                      
                                       
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        CustomerName:
                                        <asp:TextBox ID="CustomerNameTextBox" runat="server" Text='<%# Bind("CustomerName") %>' />
                                        <br />
                                        PhoneNumber:
                                        <asp:TextBox ID="PhoneNumberTextBox" runat="server" Text='<%# Bind("PhoneNumber") %>' />
                                        <br />
                                        Email:
                                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                        <br />
                                        Address:
                                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                                        <br />
                                        City:
                                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                                        <br />
                                        State:
                                        <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                                        <br />
                                        Zip:
                                        <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' />
                                        <br />
                                        Country:
                                        <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                                        <br />
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        Id:
                                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                                        <br />
                                        CustomerName:
                                        <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Bind("CustomerName") %>' />
                                        <br />
                                        PhoneNumber:
                                        <asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Bind("PhoneNumber") %>' />
                                        <br />
                                        Email:
                                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                                        <br />
                                        Address:
                                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                                        <br />
                                        City:
                                        <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                                        <br />
                                        State:
                                        <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
                                        <br />
                                        Zip:
                                        <asp:Label ID="ZipLabel" runat="server" Text='<%# Bind("Zip") %>' />
                                        <br />
                                        Country:
                                        <asp:Label ID="CountryLabel" runat="server" Text='<%# Bind("Country") %>' />
                                        <br />
                                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                    </ItemTemplate>
        </asp:FormView>
                             
        <asp:SqlDataSource ID="SqlDataSourceeditCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Id,CustomerName, PhoneNumber, Email, Address, City, State, Zip, Country, [Order],Code FROM t_Customer
where Id = @Id" UpdateCommand="UPDATE t_Customer SET CustomerName = @CustomerName, PhoneNumber = @PhoneNumber, Email = @Email, Address = @Address, City = @City, State = @State, Zip = @Zip, Country = @Country, [Order] = @Order,Code = @Code WHERE (Id = @Id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Id" QueryStringField="id" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CustomerName" />
                <asp:Parameter Name="PhoneNumber" />
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="Address" />
                <asp:Parameter Name="City" />
                <asp:Parameter Name="State" />
                <asp:Parameter Name="Zip" />
                <asp:Parameter Name="Country" />
                <asp:Parameter Name="Id" />
                <asp:Parameter Name="Order" />
                <asp:Parameter Name="Code" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
