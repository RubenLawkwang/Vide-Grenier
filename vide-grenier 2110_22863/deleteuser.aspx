<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="deleteuser.aspx.cs" Inherits="vide_grenier_2110_22863.deleteuser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="container my-5 text-center">
        <div class="form-horizontal">
        <h4>Delete User</h4>
        <hr />
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label"></asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtUid" Visible="false"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">User name</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtUname"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label">First Name</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtUfname"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Last Name</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtUlname"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label">Profile Picture</asp:Label>
            <div class="col-md-8">
                <asp:Image ID="Image1" runat="server" Visible="false" Width="75"
                    Height="100" />
            </div>
        </div>

        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label"></asp:Label>
        </div>
        <div class="form-group row justify-content-center">
            <div class="offset-md-2 col-md-8">
                <asp:Button runat="server" ID="btndelete"  OnClick="btndelete_Click" Text="Delete User"
                    OnClientClick="return confirm ('Are you sure you want to delete this user?')"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
    <hr />

    <asp:GridView ID="gvs" AutoGenerateColumns="false"
        DataKeyNames="User_id"  OnSelectedIndexChanged="gvs_SelectedIndexChanged" ClientIDMode="Static"
        Width="800" runat="server">
        <HeaderStyle BackColor="#eeeeee" ForeColor="Black" Font-Bold="true"
            Height="30" />

        <AlternatingRowStyle BackColor="#f5f5f5" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnSelect" runat="server"
                        CssClass="btn btn-outline-info" CommandName="Select" Text="Select" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Username">
                <ItemTemplate>
                    <!-- display the suername name -->
                    <asp:Label ID="lblUsername" Text='<%#Eval("U_fname")%>'
                        runat="server" />

                    
                    
                </ItemTemplate>

            </asp:TemplateField>
            <asp:ImageField DataImageUrlField="U_profile_img" 
                    DataImageUrlFormatString="../image/{0}"
                    HeaderText="Product Image" HeaderStyle-ForeColor="#ff6600" SortExpression="Profile picture"
                    ControlStyle-Width="150" />
            <%-- add an imagefield here to display the poster--%>
        </Columns>
    </asp:GridView>
        </div>






    
</asp:Content>
