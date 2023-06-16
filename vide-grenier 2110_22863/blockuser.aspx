<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="blockuser.aspx.cs" Inherits="vide_grenier_2110_22863.blockuser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
 #gvs {
 width:100%;
 }
 th {
 background: #494e5d;
 color: white;
 }
</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="container my-5 text-center">
    <div class="row">
        <div class="col-lg-12 text-center">
            <h2>Search and block active users</h2>
        </div>
    </div>
    <asp:GridView ID="gvs" OnPreRender="gvs_PreRender" HeaderStyle-BackColor="Black" ClientIDMode="Static" CssClass="table table-striped table-bordered"
        runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="U_fname" HeaderText="First Name" />
            <asp:BoundField DataField="U_lname" HeaderText="Last Name" />
            <asp:BoundField DataField="U_username" HeaderText="Username" />
            <asp:ImageField DataImageUrlField="U_profile_img" ControlStyle-Width="50"
                DataImageUrlFormatString="../image/{0}" HeaderText="Profile picture" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <%-- Assign the User_Id to the link button using the CommandArgument --%>
                    <asp:LinkButton ID="lnkblock" CssClass="btn btn-outline-warning"  OnClick="lnkblock_Click" CommandArgument='<%# Eval("User_id") %>'
                        runat="server">Block</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
