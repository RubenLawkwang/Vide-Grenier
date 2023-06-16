<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="productdetails.aspx.cs" Inherits="vide_grenier_2110_22863.productdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="container my-5">
    <h1 style="text-align:center;">Product details</h1>
    <div class="d-flex align-items-center justify-content-center">
        
     <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="false">
         
        <Fields>

            <asp:ImageField ControlStyle-Height="500px" DataImageUrlField="P_image"
                DataImageUrlFormatString="../image/{0}"
                SortExpression="Product image" />

            <asp:TemplateField>

                <ItemTemplate>
                    <h5><strong><em>
                        <%# Eval("P_name") %>
                    </em></strong></h5>
                    <br />
                   <h5> <%# Eval("P_description") %></h5>

                    <h5> Rs<strong><em>
                        <%# Eval("P_cost") %>
                    </em></strong></h5>
                </ItemTemplate>

            </asp:TemplateField>

            <asp:CheckBoxField DataField="P_status" />

        </Fields>
             
    </asp:DetailsView>
        </div>
        </div>

</asp:Content>
