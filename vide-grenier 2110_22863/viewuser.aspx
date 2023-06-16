<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="viewuser.aspx.cs" Inherits="vide_grenier_2110_22863.viewuser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%-- 
    <style type="text/css">
        .floater {
            float: left;
            border: solid 1px black;
            padding: 5px;
            margin: 5px;
        }
    </style>
    --%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <div class="" style="width: 500px; margin-top: 50px; margin-bottom: 50px;">
        <h3>List of Users</h3>
        <asp:GridView
            ID="GrdView1"
            AutoGenerateColumns="false"
            OnPageIndexChanging="GrdView1_PageIndexChanging"
            AllowPaging="true"
            PageSize="3"
            CellPadding="500"
            runat="server">
            <Columns>
                <asp:ImageField DataImageUrlField="U_profile_img"
                    DataImageUrlFormatString="../image/{0}"
                    HeaderText="Profile picture" SortExpression="U_profile_img"
                    ControlStyle-Width="300" />
                <%-- 
                <asp:TemplateField HeaderText="Product Price">
                    <ItemTemplate>
                        <h5>
                            <%# Eval("P_cost","{0:c}") %>
                        </h5>
                    </ItemTemplate>
                </asp:TemplateField>
                --%>
                <asp:BoundField HeaderText="Username" DataField="U_username" />
                <asp:BoundField HeaderText="Email" DataField="U_email" />
                <asp:BoundField HeaderText="First Name" DataField="U_fname" />
                <asp:BoundField HeaderText="Last Name" DataField="U_lname" />
                <asp:BoundField HeaderText="Address" DataField="U_address" />
                <asp:BoundField HeaderText="Date of Birth" DataField="U_dob" />
                <%-- 
                <asp:HyperLinkField HeaderText="Details" DataTextField="P_name" DataNavigateUrlFields="P_id"
                    DataNavigateUrlFormatString="details.aspx?id={0}" />
                    --%>
            </Columns>
        </asp:GridView>
    </div>



</asp:Content>
