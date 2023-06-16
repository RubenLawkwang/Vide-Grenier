<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="adminlog.aspx.cs" Inherits="vide_grenier_2110_22863.adminlog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <%-- start of login --%>
    <section class="adm-bac">



        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <asp:ValidationSummary runat="server" CssClass="text-danger" />

        <style>
            .adm-bac {
                background-image: url('../image/reg.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                padding-top: 70px;
                padding-bottom: 70px;
            }
        </style>
        <div class="container text-center" style="width: 500px; margin-bottom: 200px; margin-top: 40px; background-color: #01386a; padding: 50px; color: white; border-radius: 30px;">
            <h4>Admin-Login</h4>
            <hr />
            <div class="mb-3">
                <asp:Label runat="server"
                    CssClass="form-label">Username</asp:Label>
                <asp:TextBox runat="server" ID="txtUsername"
                    CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsername"
                    CssClass="text-danger" ErrorMessage="Username." />
            </div>
            <div class="mb-3">
                <asp:Label runat="server"
                    CssClass="form-label">Password</asp:Label>
                <asp:TextBox runat="server" ID="txtpass"
                    TextMode="password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtpass"
                    CssClass="text-danger" ErrorMessage="Enter proper password" />
            </div>
            <div class="mb-3">
                <asp:Button runat="server" Text="Login"
                    ID="txtadminlog"
                    CssClass="col-12 btn btn-outline-primary btn-lg" />
            </div>
        </div>
    </section>
    <%-- end of login --%>
</asp:Content>
