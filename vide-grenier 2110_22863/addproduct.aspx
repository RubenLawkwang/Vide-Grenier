<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="vide_grenier_2110_22863.addproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">


    <asp:ValidationSummary ID="ValidationSummary1"
            HeaderText="Errors in the form are:"
            ShowMessageBox="true"
            ShowSummary="false"
            runat="server" />


    <section style="background-color: blanchedalmond">
        <div class="container-fluid py-5">
            <div class="row">
                <div class="container col-md-6" style="width: 500px;">
                    <h4>Add product</h4>
                    <hr />
                    <div class="mb-3">
                        <div class="form-group row justify-content-center">
                            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Select
a Category</asp:Label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="ddlcat" runat="server"
                                    CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <asp:Label runat="server"
                            CssClass="form-label">Product name</asp:Label>
                        <asp:TextBox runat="server" ID="txtProdName"
                            CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtProdName"
                    Display="Dynamic"
                    SetFocusOnError="true"
                    ErrorMessage="Product Name is required"></asp:RequiredFieldValidator>
                    </div>
                    <div class="mb-3">
                        <asp:Label runat="server"
                            CssClass="form-label">Description</asp:Label>
                        <asp:TextBox runat="server" ID="txtProdDesc"
                            TextMode="Multiline" CssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <asp:Label runat="server"
                            CssClass="form-label">Product Brand</asp:Label>
                        <asp:TextBox runat="server" ID="txtpBrand"
                            CssClass="form-control" />
                    </div>

                    <asp:CheckBox ID="pcheck" runat="server" Text="Product available" />

                    <div class="mb-3">
                        <asp:Label runat="server"
                            CssClass="form-label">Product expired date</asp:Label>
                        <asp:TextBox runat="server" ID="txtexdate"
                            TextMode="Date"
                            CssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <asp:Label runat="server"
                            CssClass="form-label">Product Price</asp:Label>
                        <asp:TextBox runat="server" ID="txtPprice"
                            CssClass="form-control" />

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtPprice"
                    Display="Dynamic"
                    SetFocusOnError="true"
                    ErrorMessage="Product Price is required"></asp:RequiredFieldValidator>
                    </div>







                    <div class="mb-3">
                        <asp:Button runat="server" Text="Add Product"
                            OnClick="btnAddProd_Click"
                            ID="btnAddProd"
                            CssClass="col-12 btn btn-outline-primary btn-lg" />
                         <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="container">
                        <h4>Product image</h4>

                        <asp:FileUpload ID="fupimage" runat="server" CssClass="col-12 btn btn-outline-primary btn-lg" />
                    </div>
                </div>
                <div class="col-md-6">
                    <img src="image/product.png" class="img-responsive" style="width: 500px; height: 400px;" />

                </div>


            </div>
        </div>

    </section>
</asp:Content>
