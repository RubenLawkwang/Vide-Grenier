<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="userviewproduct.aspx.cs" Inherits="vide_grenier_2110_22863.userviewproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style>
        .vys{
            border-radius:50%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section class="container" style="margin: auto;">
    <div class="container my-5 text-center" style="margin:auto; width:50%;">
        <h1>Our Latest Product</h1>
        <h1>
            <asp:Label ID="lblcount" runat="server"></asp:Label></h1>
        <asp:DataList
            ID="dlstMovies"
            RepeatColumns="3"
           RepeatDirection="Horizontal"
           
            runat="server">
            <ItemTemplate>
                <div class="card bg-white text-dark h-100 " style="margin: 8px;">
                    <asp:Image runat="server"  ImageUrl='<%# Eval("P_image", "../image/{0}")%>' ID="Image1"
                        CssClass="card-img-top img-fluid vys" AlternateText="Card image" Width="190px" Height="200px" />
                    <div class="card-body">
                        <h6 class="card-title"><%# Eval("P_name")%></h6>
                        <p class="card-text">
                           
                           <%-- <asp:HyperLink CssClass="btn btn-outline-primary stretched-link" Text="Subscribe"
                                runat="server"  NavigateUrl='<%# Eval("P_id","../uc/login.aspx?id={0}") %>'>
                            </asp:HyperLink>--%>
                        </p>
                        <p class="card-text">
                            <span><strong>Product Price:<br />
                            </strong></span><%# Eval("P_cost","{0:c}")%>
                        </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
        </section>








</asp:Content>
