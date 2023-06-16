<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="managelocation.aspx.cs" Inherits="vide_grenier_2110_22863.managelocation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">






</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

      
    <div class="container mt-5 mb-5 text-center py-5"  style="border:5px solid">
    <div class="form-horizontal">
        <h4>Manage Location</h4>
        <hr />
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label"></asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtloc_id" Visible="false"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Location Name</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtlocname"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <div class="offset-md-2 col-md-8">
                <asp:Button runat="server" ID="btnAddmovies" OnClick="btnAddmovies_Click" Text="Add Location"
                    CssClass="btn btn-block btn-outline-primary" />
                <asp:Button runat="server" ID="btnupdate" OnClick="btnupdate_Click"   Text="Update Location"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />
                <asp:Button runat="server" ID="btndelete" OnClick="btndelete_Click"  Text="Delete Location"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" OnClientClick="return confirm('Are you sure you want to delete?')" />
                <asp:Button runat="server" ID="btncancel" Text="Cancel"  OnClick="btncancel_Click"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
    <hr />
    <asp:GridView  ID="gvs" AutoGenerateColumns="false" DataKeyNames="Loc_id"   OnSelectedIndexChanged="gvs_SelectedIndexChanged" ClientIDMode="Static"
        Width="800" runat="server">
        <HeaderStyle BackColor="#eeeeee" ForeColor="Black" Font-Bold="true"
            Height="30" />

        <AlternatingRowStyle BackColor="#f5f5f5" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnSelect" runat="server"
                        CssClass="btn btn-outline-info" CommandName="Select" Text="Select" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Location Name">
                <ItemTemplate>
                    <!-- display the movie name -->
                    <asp:Label ID="lblProductname" Text='<%#Eval("District_name")%>'
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <%-- add an imagefield here to display the poster--%>
        </Columns>
    </asp:GridView>
        </div>







</asp:Content>
