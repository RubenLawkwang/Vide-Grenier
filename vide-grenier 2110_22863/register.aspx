<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="vide_grenier_2110_22863.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/register.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">



    <%-- start of register form --%>
    <section class="reg-bac">


        <style>
            .reg-bac {
                background-image: url('../image/reg.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                padding-top: 70px;
                padding-bottom: 70px;
            }
        </style>

        <asp:ValidationSummary ID="ValidationSummary1"
            HeaderText="Errors in the form are:"
            ShowMessageBox="true"
            ShowSummary="true"
            runat="server" />


        <div class="regis-2 container py-5" style="background-color: #01386a; color: white; width: 700px; border-radius: 10px;">
            <h4>Register</h4>
            <hr />
            <div class="mb-3">
                <asp:Label runat="server"
                    CssClass="form-label">First Name</asp:Label>
                <asp:TextBox runat="server" ID="txtFname"
                    CssClass="form-control" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtFname"
                    Display="Dynamic"
                    SetFocusOnError="true"
                    ErrorMessage="First Name is required"></asp:RequiredFieldValidator>


            </div>

            <div class="mb-3">
                <asp:Label runat="server"
                    CssClass="form-label">last Name</asp:Label>
                <asp:TextBox runat="server" ID="txtLname"
                    CssClass="form-control" />

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtLname"
                    Display="Dynamic"
                    SetFocusOnError="true"
                    ErrorMessage="Last Name is required"></asp:RequiredFieldValidator>

            </div>


            <div class="mb-3">
                <asp:Label runat="server"
                    CssClass="form-label">Date Of Birth (You should be at least 18 years old)</asp:Label>
                <asp:TextBox runat="server" ID="txtdob"
                    CssClass="form-control" TextMode="Date" />


                <asp:RangeValidator ID="rvdob" runat="server"
                    ControlToValidate="txtdob"
                    ErrorMessage="Your age do not match our requirements"></asp:RangeValidator>




            </div>

            <div class="mb-3">
                <asp:Label ID="lblCountry" runat="server" Text="District" AssociatedControlID="ddlDistrict"></asp:Label>
                        <div class="div_texbox">
                            <asp:DropDownList ID="ddlDistrict" runat="server"
                                CssClass="form-control">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ddlDistrict" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>

                        </div>

                <div class="mb-3">
                    <asp:Label runat="server"
                        CssClass="form-label">Address</asp:Label>
                    <asp:TextBox runat="server" ID="txtAddress"
                        CssClass="form-control" />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ControlToValidate="txtAddress"
                        Display="Dynamic"
                        SetFocusOnError="true"
                        ErrorMessage="Address is required"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-3">
                    <asp:Label runat="server"
                        CssClass="form-label">Email</asp:Label>
                    <asp:TextBox runat="server" ID="txtEmail"
                        CssClass="form-control" />

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="^[a-z0-9][-a-z0-9._]+@([-a-z0-9]+[.])+[a-z]{2,5}$"
                        ErrorMessage="Incorrect Email"></asp:RegularExpressionValidator>


                </div>


                <div class="mb-3">
                    <asp:Label runat="server"
                        CssClass="form-label">Mobile Number</asp:Label>
                    <asp:TextBox runat="server" ID="txtmob"
                        CssClass="form-control" />


                    <asp:CompareValidator ID="CompareValidator2"
                        ControlToValidate="txtmob"
                        Operator="DataTypeCheck"
                        Type="Integer"
                        runat="server" ErrorMessage="Wrong data type"></asp:CompareValidator>


                </div>


                <div class="mb-3">
                    <asp:Label runat="server"
                        CssClass="form-label">Username</asp:Label>
                    <asp:TextBox runat="server" ID="txtUname"
                        CssClass="form-control" />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ControlToValidate="txtUname"
                        Display="Dynamic"
                        SetFocusOnError="true"
                        ErrorMessage="Username is required"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-3">
                    <asp:Label runat="server"
                        CssClass="form-label">Password</asp:Label>
                    <asp:TextBox runat="server" ID="txtpassword"
                        CssClass="form-control" TextMode="Password" />

                    <asp:CustomValidator ID="CustomValidator1" runat="server"
                        ControlToValidate="txtpassword" OnServerValidate="CustomValidator1_ServerValidate"
                        ValidateEmptyText="true"
                        ErrorMessage="Your password must be more than 8 character"></asp:CustomValidator>
                </div>

                <div class="mb-3">
                    <asp:Label runat="server"
                        CssClass="form-label">Confirm password</asp:Label>
                    <asp:TextBox runat="server" ID="txtCpass"
                        CssClass="form-control" TextMode="Password" />

                    <asp:CompareValidator ID="CompareValidator1" runat="server"
                        ControlToValidate="txtCpass"
                        ControlToCompare="txtpassword"
                        Operator="Equal"
                        ErrorMessage="Password Does Not Match"></asp:CompareValidator>

                </div>



                <div class="mb-3">
                    <h5>Upload a profile picture</h5>
                    <asp:FileUpload ID="profilepic" runat="server" CssClass="" />
                    <asp:Image ID="Image2" runat="server" Visible="false" Width="75"
                        Height="100" />

                </div>


                <div class="mb-3">
                    <asp:Button runat="server"  OnClick="btnregister_Click1" Text="Register"
                        ID="btnregister"
                        CssClass="col-12 btn btn-outline-primary btn-lg" />
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </div>

                <div class="mb-3">
                    <asp:Button runat="server" Text="Reset"
                        CssClass="col-12 btn btn-outline-primary btn-lg"  OnClick="Unnamed_Click" OnClientClick="return confirm ('Are you sure you wanna clear the form')" />
                </div>
            </div>
        </div>
    </section>


    <%-- end of register form --%>
</asp:Content>
