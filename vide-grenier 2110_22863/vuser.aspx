<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="vuser.aspx.cs" Inherits="vide_grenier_2110_22863.stats" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <div class="container my-5">
    <div class="container-fluid">
       <asp:GridView ID="gvs" BackColor="#edf1fe" runat="server"
         OnPreRender="gvs_PreRender"
        DataSourceID="srcUsers"
        ClientIDMode="Static"
        AutoGenerateColumns="False" ForeColor="#333333c">
        <Columns>
       <%--     <asp:ImageField   ControlStyle-Width="80px"
                DataImageUrlFormatString="~/images/{0}" HeaderText="Profile"
                SortExpression="profile_pic" />--%>

            <asp:ImageField DataImageUrlField="U_profile_img"
                 ControlStyle-Width="80px"
                DataImageUrlFormatString="../image/{0}" HeaderText="Profile"
                SortExpression="profile_pic" />


            <asp:BoundField DataField="U_username" HeaderText="U_username"
                SortExpression="username" />
            <asp:BoundField DataField="U_status" HeaderText="Status"
                SortExpression="U_status" />
        </Columns>
    </asp:GridView>

 <asp:ObjectDataSource
            ID="srcUsers"
            runat="server"
            TypeName="DataAccessLayer"
            SelectMethod="GetUsers"
            />
    </div>

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
