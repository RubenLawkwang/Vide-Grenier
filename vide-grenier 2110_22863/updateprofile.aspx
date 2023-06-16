<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="updateprofile.aspx.cs" Inherits="vide_grenier_2110_22863.updateprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
<!-- Section: Design Block -->
    
<section class=" container text-center text-lg-start my-5">
    <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
  <style>
    .rounded-t-5 {
      border-top-left-radius: 0.5rem;
      border-top-right-radius: 0.5rem;
    }

    @media (min-width: 992px) {
      .rounded-tr-lg-0 {
        border-top-right-radius: 0;
      }

      .rounded-bl-lg-5 {
        border-bottom-left-radius: 0.5rem;
      }
    }
  </style>
    
  <div class="card mb-3" style="background-color:#ffe5b4;">
      
    <div class="row g-0 d-flex align-items-center">
      <div class="col-lg-4 d-none d-lg-flex" style="padding-left:50px;">
         <asp:DetailsView AutoGenerateRows="false"  BorderStyle="None" ID="DetailsView1" runat="server" Height="200px" Width="200px">
               <Fields>
                   <asp:TemplateField>
                       <ItemTemplate>
                           <h4>Profile Picture</h4>
                 <asp:Image runat="server"  ImageUrl='<%# Eval("U_profile_img", "image/{0}")%>' ID="Image1"
                        CssClass="card-img-top img-fluid vys" AlternateText="Profile Picture" Width="190px" Height="200px" />
                           </ItemTemplate>
                        </asp:TemplateField>
            </Fields>
            </asp:DetailsView>
      </div>
      <div class="col-lg-8">
        <div class="card-body py-5 px-md-5">
           
           
           <fieldset>
               
                    
                       
                   
                
            <!-- Email input -->
             <div class="form">
                                <asp:Label ID="lblFname" runat="server" Text="First Name:" AssociatedControlID="txtFname"></asp:Label>
                                <div class="div_texbox">
                                    <asp:TextBox ID="txtFname" runat="server"
                                        CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqFname" ControlToValidate="txtFname" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </div>
            <!-- Password input -->
<asp:Label ID="lblLname" runat="server" Text="Last Name:" AssociatedControlID="txtLname"></asp:Label>
                                <div class="div_texbox">
                                    <asp:TextBox ID="txtLname" runat="server"
                                        CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqLname" ControlToValidate="txtLname" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                </div>




                 <asp:Label ID="lblEmail" runat="server" Text="Email" AssociatedControlID="txtEmail"></asp:Label>
                                <div class="div_texbox">

                                    <asp:TextBox ID="txtEmail" runat="server"
                                        CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqEmail" ControlToValidate="txtEmail" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator><br />
                                    <asp:RegularExpressionValidator ID="RegEmail" runat="server" ControlToValidate="txtEmail"
                                        ValidationExpression="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$" ErrorMessage="Not Valid"></asp:RegularExpressionValidator>
                                </div>
                            </div>

            <!-- 2 column grid layout for inline styling -->
            <div class="row mb-4">

               <fieldset>
                            <asp:Button ID="btnupdate" OnClick="btnupdate_Click" runat="server"
                                Text="Update Profile"
                                CssClass="btn btn-outline-primary btn-block" />

                        </fieldset>
            </div>
                
            <!-- Submit button -->

         
        </fieldset>
        </div>
      </div>
    </div>
          
  </div>
         
</section>
<!-- Section: Design Block -->

</asp:Content>
