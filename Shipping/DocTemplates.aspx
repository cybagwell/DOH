<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DocTemplates.aspx.vb" Inherits="DOHPricing.DocTemplates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>

        function openModal() {
            $('#myModal').modal({ show: true });
        };

    </script>

    <div class="row">
        <div class="col-xs-5 col-sm-4 col-md-6 col-lg-7">
            <h1>Doc Templates</h1>
        </div>


        <div class="text-right col-xs-4 col-sm-4 col-md-4 col-lg-3">
            <br />
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" data-keyboard="false" data-backdrop="static">
                Add New Template Item
            </button>
        </div>


    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Add New Template Item</h4>
                </div>
                <div class="modal-body">

                    <asp:FormView ID="FormViewDocTemplate" runat="server" AllowPaging="True" DefaultMode="Insert" DataKeyNames="DocTemplateID" DataSourceID="srcSqlDataSourceDocTemplate" CellPadding="4" ForeColor="#333333">

                        <EditItemTemplate>
                            DocTemplateID:
                            <asp:Label ID="DocTemplateIDLabel1" runat="server" Text='<%# Eval("DocTemplateID") %>' />
                            <br />
                            Section:
                            <asp:TextBox ID="SectionTextBox" runat="server" Text='<%# Bind("Section") %>' />
                            <br />
                            Label: <i>* In the name means you will be able to edit this.</i>
                            <asp:TextBox ID="LabelTextBox" runat="server" Text='<%# Bind("Label") %>' />
                            <br />
                            DocType:
                            <asp:TextBox ID="DocTypeTextBox" runat="server" Text='<%# Bind("DocType") %>' />
                            <br />
                            DefaultValue:
                            <asp:TextBox ID="DefaultValueTextBox" runat="server" Text='<%# Bind("DefaultValue") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>

                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            <div class="row">
                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="DocType is Required" ControlToValidate="DocTypeTextBox"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="h4">DocType</div>
                                    <asp:TextBox ID="DocTypeTextBox" runat="server" Text='<%# Bind("DocType")%>' />
                                </div>
                                <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5">
                                    <div class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorname" runat="server" ErrorMessage="Section is Required" ControlToValidate="SectionTextBox"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="h4">Section</div>

                                    <asp:TextBox ID="SectionTextBox" runat="server" Text='<%# Bind("Section")%>' />
                                </div>
                            


                            </div>

                            <div class="row">
                                   <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Label is Required" ControlToValidate="LabelTextBox"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="h4">Label</div>
                                       <i>* In the name means you will be able to edit this.</i>
                                    <asp:TextBox ID="LabelTextBox" runat="server" Text='<%# Bind("Label")%>' />



                                </div>
                                <div class="col-xs-8 col-sm-5 col-md-5 col-lg-5">
                                    <div>
                                        <br />
                                    </div>
                                    <div class="h4">DefaultValue</div>

                                    <asp:TextBox ID="DefaultValueTextBox" runat="server" Text='<%# Bind("DefaultValue") %>' />
                                    <br />



                                </div>

                                 <div class="col-xs-8 col-sm-5 col-md-5 col-lg-5">
                                    <div>
                                        <br />
                                    </div>
                                    <div class="h4">Value Control ID</div>

                                    <asp:TextBox ID="ValueControlIDTextBox" runat="server" Text='<%# Bind("ValueControlID") %>' />
                                    <br />



                                </div>
                                 <div class="col-xs-8 col-sm-5 col-md-5 col-lg-5">
                                    <div>
                                        <br />
                                    </div>
                                    <div class="h4">Attribute</div>

                                    <asp:TextBox ID="TxtAttribute" runat="server" Text='<%# Bind("Attribute") %>' />
                                    <br />



                                </div>
                                   <div class="col-xs-8 col-sm-5 col-md-5 col-lg-5">
                                    <div>
                                        <br />
                                    </div>
                                    <div class="h4">Order</div>

                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Order") %>' />
                                    <br />



                                </div>
                            </div>

                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>

                        <ItemTemplate>
                            DocTemplateID:
                            <asp:Label ID="DocTemplateIDLabel" runat="server" Text='<%# Eval("DocTemplateID") %>' />
                            <br />
                            Section:
                            <asp:Label ID="SectionLabel" runat="server" Text='<%# Bind("Section") %>' />
                            <br />
                            Label:
                            <asp:Label ID="LabelLabel" runat="server" Text='<%# Bind("Label") %>' />
                            <br />
                            DocType:
                            <asp:Label ID="DocTypeLabel" runat="server" Text='<%# Bind("DocType") %>' />
                            <br />
                            DefaultValue:
                            <asp:Label ID="DefaultValueLabel" runat="server" Text='<%# Bind("DefaultValue") %>' />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                        </ItemTemplate>

                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:FormView>

                </div>
            </div>
        </div>
    </div>

    <asp:GridView ID="GridViewBuyer" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="DocTemplateID" DataSourceID="srcSqlDataSourceDocTemplate" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CausesValidation="false"  />
            <asp:BoundField DataField="DocType" HeaderText="DocType" SortExpression="DocType" />
            <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
            <asp:BoundField DataField="Label" HeaderText="Label" SortExpression="Label" />
            
            <asp:BoundField DataField="DefaultValue" HeaderText="Default Value" SortExpression="DefaultValue" />
            <asp:BoundField DataField="ValueControlID" HeaderText="Value Control Id" SortExpression="ValueControlID" />
           <asp:BoundField DataField="Attribute" HeaderText="Attribute" SortExpression="Attribute" />
            <asp:BoundField DataField="Order" HeaderText="Order" SortExpression="Order" />
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


    <asp:SqlDataSource ID="srcSqlDataSourceDocTemplate" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO t_DocTemplate(Section, Label, DocType, DefaultValue, ValueControlID, Attribute, [Order]) VALUES (@Section, @Label, @DocType, @DefaultValue, @ValueControlID, @Attribute, @Order)" SelectCommand="SELECT DocTemplateID, Section, Label, DocType, DefaultValue, ValueControlID, Attribute, [Order] FROM t_DocTemplate order by section, [Order]" UpdateCommand="UPDATE t_DocTemplate SET Section = @Section, Label = @Label, DocType = @DocType, DefaultValue = @DefaultValue, ValueControlID = @ValueControlID, Attribute = @Attribute, [Order] = @Order WHERE (DocTemplateID = @DocTemplateID)" DeleteCommand="DELETE FROM t_DocTemplate WHERE (DocTemplateID = @DocTemplateID)">
        <DeleteParameters>
            <asp:Parameter Name="DocTemplateID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Section" />
            <asp:Parameter Name="Label" />
            <asp:Parameter Name="DocType" />
            <asp:Parameter Name="DefaultValue" />
            <asp:Parameter Name="ValueControlID" />
            <asp:Parameter Name="Attribute" />
             <asp:Parameter Name="Order" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Section" />
            <asp:Parameter Name="Label" />
            <asp:Parameter Name="DocType" />
            <asp:Parameter Name="DefaultValue" />
            <asp:Parameter Name="ValueControlID" />
             <asp:Parameter Name="Attribute" />
             <asp:Parameter Name="Order" />
            <asp:Parameter Name="DocTemplateID" />
        </UpdateParameters>
    </asp:SqlDataSource>





</asp:Content>
