<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="viewproduct.aspx.cs" Inherits="vide_grenier_2110_22863.viewproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <div class="container my-5 text-center py-5" style="width: 50%;">
        <h3>Products</h3>
        <asp:GridView
            ID="GrdView1"
            AutoGenerateColumns="false"
             OnPageIndexChanging="GrdView1_PageIndexChanging1"
            AllowPaging="true"
             Width="50"
             CellSpacing="100"
            PageSize="3"
            CellPadding="500"
            runat="server">
            <Columns>
                <asp:ImageField DataImageUrlField="P_image"
                    DataImageUrlFormatString="../image/{0}"
                    HeaderText="Product image" SortExpression="P_image"
                    ControlStyle-Width="300" />
                
                <asp:TemplateField HeaderText="Product Price">
                    <ItemTemplate>
                        <h5>
                            <%# Eval("P_cost","{0:c}") %>
                        </h5>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField HeaderText="Product name" DataField="P_name" />
                 <asp:BoundField HeaderText="Category" DataField="Cat_type" />
                <asp:HyperLinkField HeaderText="Details" DataTextField="P_name" DataNavigateUrlFields="P_id"
                    DataNavigateUrlFormatString="productdetails.aspx?id={0}" />
            </Columns>
        </asp:GridView>
    </div>







</asp:Content>
