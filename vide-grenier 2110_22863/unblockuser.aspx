<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="unblockuser.aspx.cs" Inherits="vide_grenier_2110_22863.unblockuser" %>
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
            <h2>Search and Unblock deactive users</h2>
        </div>
    </div>
    <asp:GridView ID="gvs" OnPreRender="gvs_PreRender" ClientIDMode="Static" CssClass="table table-striped table-bordered" HeaderStyle-BackColor="Black"
        runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="U_fname" HeaderText="First Name" />
            <asp:BoundField DataField="U_lname" HeaderText="Last Name" />
            <asp:BoundField DataField="U_username" HeaderText="Username" />
            <asp:ImageField DataImageUrlField="U_profile_img" ControlStyle-Width="50"
                DataImageUrlFormatString="../image/{0}" HeaderText="Profile Picture" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <%-- Assign the User_Id to the link button using the CommandArgument --%>
                    <asp:LinkButton ID="lnkunblock" CssClass="btn btn-outline-warning"   OnClick="lnkunblock_Click" CommandArgument='<%# Eval("User_id") %>'
                        runat="server">Unblock</asp:LinkButton>
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
