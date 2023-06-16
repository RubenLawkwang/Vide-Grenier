<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="stats.aspx.cs" Inherits="vide_grenier_2110_22863.stats1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="container my-5" >
     <%--<ajaxToolkit:PieChart ID="PieChart1" ChartHeight="600" ChartWidth="500" ChartTitle="stats for heighest revenue" runat="server"></ajaxToolkit:PieChart>--%>
    <asp:DropDownList ID="ddlCategory" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>



    <ajaxToolkit:PieChart ID="PieChart1" ChartHeight="400" ChartWidth="400" ChartTitle="Stats for highest revenue of Product sold by categories" runat="server"></ajaxToolkit:PieChart>
        </div>



</asp:Content>
