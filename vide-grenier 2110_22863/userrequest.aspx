<%@ Page Title="" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="userrequest.aspx.cs" Inherits="vide_grenier_2110_22863.userrequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <div class="container py-5 mb-5">
    <div class="text-center">
        <h1>My Request</h1>
        <div class="content">
            <asp:Repeater
                ID="rptMovies"
                runat="server">
                <ItemTemplate>
                   <section class="vh-100 gradient-custom-2 py-4">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-10 col-lg-8 col-xl-6">
        <div class="card card-stepper" style="border-radius: 16px;">
          <div class="card-header p-4">
            <div class="d-flex justify-content-between align-items-center">
              <div>

                <%--<p class="text-muted mb-2"> Requested By <span class="fw-bold text-body">1222528743</span></p>--%>
                  <p class="text-muted mb-4">Requested By</p>
                  <h1><%#Eval("U_username") %></h1>
                  
               
              </div>
              <div>
                <asp:HyperLink runat="server" NavigateUrl='<%#Eval("P_id","~/productdetails.aspx?id={0}")%>'>
                            <%#Eval("P_brand").ToString() +": "+ Eval("P_name").ToString() %>
                        </asp:HyperLink>
              </div>
            </div>
          </div>
          <div class="card-body p-4">
            <div class="d-flex flex-row mb-4 pb-2">
              <div class="flex-fill">
               <h1><%#Eval("P_name") %></h1>
                <p class="text-muted">Product Name</p>
                <h4 class="mb-3"> Rs <%#Eval("P_cost") %> <span class="small text-muted"> Product Price</span></h4>
                <p class="text-muted"><%# Eval("AccessDate") %><span class="text-body"> Request Date</span></p>
              </div>
              <div>
                <asp:Image  ID="imgposter" ImageUrl='<%# Eval("P_image", "../image/{0}") %>'
                                CssClass="img-fluid" Width="200" runat="server" />
              </div>
            </div>
            <ul id="progressbar-1" class="mx-0 mt-0 mb-5 px-0 pt-0 pb-4">
              <li class="step0 text-muted text-end" id="step3"><span
                  style="margin-right: 22px; color:green;"><%#Eval("Status") %></span>
                  <h4>Request Status</h4>
              </li>
            </ul>
          </div>
          <div class="card-footer p-4">
            <div class="d-flex justify-content-between">
             
              <div class="border-start h-100">
               
                
              <div class="border-start h-100"></div>
              
              <div class="border-start h-100"></div>
              <h5 class="fw-normal mb-0"><a href="#!" class="text-muted"><i class="fas fa-ellipsis-v"></i></a>
              </h5>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

   </div>





</asp:Content>
