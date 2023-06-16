<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="userproduct.aspx.cs" Inherits="vide_grenier_2110_22863.userproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="container py-5">
    <div class="text-center">
        <h1>My Products</h1>
        <div class="content">
            <asp:Repeater
                ID="rptMovies"
                runat="server">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-sm">
                    <section style="background-color: #eee;">
                        <div class="container py-5">
                            <div class="row justify-content-center">
                                <div class="col-md-8 col-lg-6 col-xl-4">
                                    <div class="card text-black">
                                        <div style="justify-content:center;">
                                       <asp:Image  ID="imgposter" ImageUrl='<%# Eval("P_image", "../image/{0}") %>'
                                CssClass="img-fluid" Width="300" runat="server" />
                                            </div>
                                        <div class="card-body">
                                            <div class="text-center">
                                                 <h1><%#Eval("P_name") %></h1>
                                                <p class="text-muted mb-4">Product name</p>
                                                
                                            </div>
                                            <div>
                                                 <h1>Rs <%#Eval("P_cost")  %></h1>
                                                <p class="text-muted mb-4">Product Price</p>
                                                </div>
                                                <div >
                                                    <h1><%#Eval("P_description") %></h1>
                                                    <p class="text-muted mb-4">Product Description</p>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-between total font-weight-bold mt-4">
                                                <asp:LinkButton PostBackUrl='<%# Eval("P_id", "usermanageproduct.aspx?={0}") %>' ID="lnkmovdetails" runat="server" Text="Edit"                  CssClass="btn btn-info"></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                    </section>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

   </div>

</asp:Content>
