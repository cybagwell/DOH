<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="viewdocs.aspx.vb" Inherits="DOHPricing.viewdocs" ValidateRequest="false" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
         <link href="../Content/bootstrap.css" rel="stylesheet" type="text/css" />
           <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <script>

            function openModal() {
             var html = FTB_API['<%=htmlheader.ClientID%>'].GetHtml();
           
                html = html + document.getElementById('htmlbody').innerHTML;
            
                FTB_API['<%=htmlsource.ClientID%>'].SetHtml(html);
              


               
            };




        </script>





        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-fullwidth" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Print</h4>
                    </div>
                    <div class="modal-body"> 
                        
                        <FTB:FreeTextBox ID="htmlsource"  runat="server" Width="1260px" Height="1650px" ToolbarLayout="Print">
                        </FTB:FreeTextBox>

                      

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>




        <div id="divPick" runat="server">

            <h3>Choose Documents</h3>
            <asp:DropDownList ID="DropDownListdocuments" runat="server" AutoPostBack="True" DataSourceID="srcSqlDataSourceDoc" DataTextField="Text" DataValueField="value"></asp:DropDownList>

            <asp:SqlDataSource ID="srcSqlDataSourceDoc" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT distinct doc.PaperWorkGroupID as value, doc.value as Text FROM t_Doc AS doc INNER JOIN t_DocTemplate AS DocTemp ON doc.DocTemplateID = DocTemp.DocTemplateID  
where label = 'invoice number'
ORDER BY doc.value,doc.paperworkgroupid"></asp:SqlDataSource>

        </div>



        <%--   <FTB:FreeTextBox ID="htmlsource" runat="server" Width="1260px" Height="1650px" ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo,Print,Save|SymbolsMenu,StylesMenu,InsertHtmlMenu|InsertRule,InsertDate,InsertTime|InsertTable,EditTable;InsertTableRowAfter,InsertTableRowBefore,DeleteTableRow;InsertTableColumnAfter,InsertTableColumnBefore,DeleteTableColumn|InsertForm,InsertTextBox,InsertTextArea,InsertRadioButton,InsertCheckBox,InsertDropDownList,InsertButton|InsertDiv,EditStyle,InsertImageFromGallery,Preview,SelectAll,WordClean,NetSpell">
        </FTB:FreeTextBox>
        --%>


        <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" data-keyboard="false" data-backdrop="static" onclick="openModal()">
            Print
        </button>





        <FTB:FreeTextBox ID="htmlheader" runat="server" Width="1260px" Height="470px" AutoGenerateToolbarsFromString="False" ButtonSet="NotSet" EnableToolbars="False" TextDirection="LeftToRight" ToolbarBackgroundImage="False" UseToolbarBackGroundImage="False" RenderMode="Rich" EnableHtmlMode="False"></FTB:FreeTextBox>
       
        <div id="htmlbody" style="padding-left: 10px">
            
        <asp:GridView ID="GridViewbody" runat="server" AutoGenerateColumns="False" OnRowDataBound = "OnRowDataBound">
            <Columns>
      
            </Columns>
            </asp:GridView>

          </div>


    </form>
</body>
</html>
