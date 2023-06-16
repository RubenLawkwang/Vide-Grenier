<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="manageproduct.aspx.cs" Inherits="vide_grenier_2110_22863.manageproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <div class="container my-5 text-center">
    <div class="form-horizontal">
        <h4>Manage product</h4>
        <hr />
         <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtProductid" Visible="false"
                    CssClass="form-control" />
            </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Select
a Category</asp:Label>
            <div class="col-md-8">
                <asp:DropDownList ID="ddlcat" runat="server"
                    CssClass="form-control">
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label"></asp:Label>
           
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Product name</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtPname"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label">Product Brand</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtPbrand"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Product price</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtprice"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label">Product Description</asp:Label>

            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtPdesc" TextMode="Multiline"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label">Product image</asp:Label>
            <div class="col-md-8">
                <asp:FileUpload ID="fuimage" runat="server" CssClass="" />
                <asp:Image ID="Image1" runat="server" Visible="false" Width="75"
                    Height="100" />
            </div>
        </div>

        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label"></asp:Label>
            <div class="col-md-8">
                <div class="form-check-inline">
                    <asp:CheckBox runat="server" ID="chkstatus"
                        CssClass="form-check-input" />
                    <asp:Label runat="server"
                        CssClass="form-check-label">Status</asp:Label>
                </div>
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <div class="offset-md-2 col-md-8">
                <asp:Button runat="server" ID="btnupdate" OnClick="btnupdate_Click" Text="Update Product"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />
                <asp:Button runat="server" ID="btndelete" OnClick="btndelete_Click" Text="Delete Product"
                    OnClientClick="return confirm ('Are you sure you want to delete?')"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />
                <asp:Button runat="server" ID="btncancel" OnClick="btncancel_Click" Text="Cancel"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
    <hr />

    <asp:GridView ID="gvs" AutoGenerateColumns="false"
        DataKeyNames="P_id"
        OnSelectedIndexChanged="gvs_SelectedIndexChanged" ClientIDMode="Static"
        Width="800" runat="server">
        <HeaderStyle BackColor="#eeeeee" ForeColor="White" Font-Bold="true"
            Height="30" />

        <AlternatingRowStyle BackColor="#f5f5f5" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnSelect" runat="server"
                        CssClass="btn btn-outline-info" CommandName="Select" Text="Select" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Name">
                <ItemTemplate>
                    <!-- display the movie name -->
                    <asp:Label ID="lblproductname" Text='<%#Eval("P_name")%>'
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <%-- add an imagefield here to display the poster--%>
        </Columns>
    </asp:GridView>
        </div>
</asp:Content>
