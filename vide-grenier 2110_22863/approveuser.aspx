<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="approveuser.aspx.cs" Inherits="vide_grenier_2110_22863.approveuser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="container text-center my-5">
    <h2>Approve / Reject Subscription: </h2>
    <asp:GridView ID="gvs" OnPreRender="gvs_PreRender" ClientIDMode="Static" CssClass="table table-striped table-bordered"
        runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="fname" HeaderText="First Name" />
            <asp:BoundField DataField="lname" HeaderText="Last Name" />
            <asp:BoundField DataField="uname" HeaderText="Username" />
            <asp:ImageField DataImageUrlField="image"
                DataImageUrlFormatString="../image/{0}" ControlStyle-Width="100" HeaderText="ProfilePic" />
            <asp:BoundField DataField="accdate" HeaderText="Request Date&Time" />
            <asp:BoundField DataField="pname" HeaderText="Product name" />
            <asp:BoundField DataField="tumstatus" HeaderText="Access Status" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <%--store the movie id in the hiddenfield--%>
                    <asp:HiddenField ID="hidmov" runat="server" Value='<%#Eval("pid")%>'/>
                    <%--store the user id in the LinkButtons--%>
                    <asp:LinkButton ID="lnkdeny" OnClick="lnkdeny_Click" CssClass="btn btn-danger" CommandArgument='<%#Eval("user_id") %>'
                        runat="server">Deny Access</asp:LinkButton><br />

                    <br />
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("pid")%>'/>
                    <asp:LinkButton ID="lnkgrant"  OnClick="lnkgrant_Click" CssClass="btn btn-success" CommandArgument='<%#Eval("user_id") %>'
                        runat="server">Grant Access</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        </div>




</asp:Content>
