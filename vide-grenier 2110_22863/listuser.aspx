<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="listuser.aspx.cs" Inherits="vide_grenier_2110_22863.listuser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <div class="container">
    <asp:GridView ID="gvs" runat="server"
        OnPreRender="gvs_PreRender"
        DataSourceID="srcUsers"
        ClientIDMode="Static"
        User-ControlWidth="8px"
        AutoGenerateColumns="False" ForeColor="#333333">
        <Columns>
            <asp:ImageField DataImageUrlField="U_profile_img"
                DataImageUrlFormatString="../image/{0}" HeaderText="Poster"
                SortExpression="Poster" />
            <asp:BoundField DataField="U_username" HeaderText="Username"
                SortExpression="username" />
            <asp:BoundField DataField="U_status" HeaderText="Status"
                SortExpression="Status" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource
            ID="srcUsers"
            runat="server"
            TypeName="DataAccessLayer"
            SelectMethod="GetUsers"
            />
        </div>

</asp:Content>
