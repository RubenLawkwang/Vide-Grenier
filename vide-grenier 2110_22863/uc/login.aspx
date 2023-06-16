<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="vide_grenier_2110_22863.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%@ Register Src="~/uc/login.ascx" TagPrefix="uc" TagName="Login" %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="container text-center text-white my-5">
    <%-- start of login --%>
        <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-3 mt-5" style="border-radius: 3rem; width: 900px;">
            <div class="card bg-glass">
                <div class="card-body px-4 py-3 px-md-5 " style="background-color:#01386a;">
                    <div class="container mt-5 mb-5 " id="wrapper" style="border-radius: 3rem; width: 800px;">
                        <h1>Login</h1>
                        <div class="form">

                            <uc:Login runat="server" ID="userlogin" ValidationGroup="usergroup" />

                            <br />
                            <br />
                            <asp:Button ID="btnLogin" OnClick="btnLogin_Click" ValidationGroup="usergroup" runat="server"
                                CssClass="btn btn-outline-primary" Text="Log in" />
                        </div>
                        <fieldset>
                            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label><br />
                            <asp:Button ID="btnRegister" runat="server"
                                PostBackUrl="~/register.aspx" Text="Don’t have an account yet? Join now"
                                CausesValidation="false" CssClass="btn btn-outline-warning" /><br />
                        </fieldset>

                    </div>
                </div>
            </div>
        </div>
        </div>
    <%-- end of login --%>
</asp:Content>
