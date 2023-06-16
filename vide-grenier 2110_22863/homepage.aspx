<%@ Page Title="Home" Language="C#" MasterPageFile="~/guessmaster.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="vide_grenier_2110_22863.homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- start of font aswome --%>
    <script src="https://kit.fontawesome.com/8181027d18.js" crossorigin="anonymous"></script>
    <%-- end of font aswome --%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <%-- start of carousel --%>
    <div id="carouselExampleCaptions" class="container-fluid carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="image/wel.jpg" class="img-responsive d-block w-100" style="height: 500px; width: 100%;" />
                <div class="carousel-caption d-none d-md-block">
                    <h3 style="color: black;">Our Team Wish You</h3>
                    <h4 style="color: black;">A warm Welcome to vide de grenier</h4>
                </div>
            </div>
            <div class="carousel-item">
                <img src="image/vid1.jpg" class="img-responsive d-block w-100" style="height: 500px; width: 100%;" />
                <div class="carousel-caption d-none d-md-block">
                    <h3 style="color: black;">We Hope That</h3>
                    <h4 style="color: white;">You find what you are searching for</h4>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <%-- end of carousel --%>

    <%-- start of list of product --%>
    <div class="container mt-5" style="margin-bottom:50px; margin:auto;">

        <div class="row form-group" runat="server">
            <div class="col-sm-6 " style="float: left">
                <h2>List of Product</h2>
            </div>
            <div class="col-sm-3" style="float: right;">
                <div class="input-group">
                    <%--Trigger the TextChanged event--%>
                    <asp:DropDownList OnSelectedIndexChanged="TextBox1_TextChanged"  ID="ddlCategory"  runat="server"
                        CssClass="form-control" AutoPostBack="true">
                    </asp:DropDownList>&nbsp;
                </div>
            </div>
            <div class="col-sm-3" style="float: right;">
                <div class="input-group">
                    <%--generate text changed event--%>
                    <asp:TextBox ID="TextBox1" OnTextChanged="TextBox1_TextChanged" runat="server" AutoPostBack="true" CssClass="form-control" Placeholder="Search..." />
                    <span class="input-group-addon">
                        <i class="fa fa-search"></i></span>
                </div>
            </div>
        </div>

        <%-- START AJAX CONTROL --%>
        <hr />

        <asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>

        <ContentTemplate>
            <asp:ListView  OnPagePropertiesChanging="lvMovies_PagePropertiesChanging"
            ID="lvMovies"
            runat="server" ItemPlaceholderID="itemPlaceholder" DataKeyNames="P_id">


            <ItemTemplate>

                <div class="card"
                    style="width: 200px; float: left; margin: 8px;">
                    <asp:Image runat="server"
                        ImageUrl='<%# Eval("P_image", "../image/{0}")%>' ID="Image1"
                        class="card-img-top" alt="Card image" Width="193px" Height="195px" />
                    <div class="card-body">
                        <h6 class="card-title"><%# Eval("P_name")%></h6>
                        <p class="card-text">
                            by 
                        <asp:HyperLink runat="server" NavigateUrl='<%#Eval("P_id","~/productdetails.aspx?id={0}")%>'>
                            <%#Eval("P_brand").ToString() +": "+ Eval("P_name").ToString() %>
                        </asp:HyperLink>
                        </p>

                        <p class="card-text">
                            <span><strong>Product Price:<br />
                            </strong></span><%# Eval("P_cost","{0:c}")%>
                        </p>
                        <%--Eval movie_id as the commandargument--%>
                        <asp:LinkButton OnClick="LinkButton1_Click" ID="LinkButton1" runat="server" Text="Request access" CommandName="btnAccess" CommandArgument='<%#Eval("P_id") %>' CssClass="btn btn-primary"  />

                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholder" class="categoryContainer" runat="server">
                </div>
                <hr style="clear: both" />

                <div class="text-right">
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link"
                                ShowNextPageButton="false" ShowFirstPageButton="true" />
                            <asp:NumericPagerField />
                            <asp:NextPreviousPagerField ButtonType="Link"
                                ShowPreviousPageButton="false" ShowLastPageButton="true" />
                        </Fields>
                    </asp:DataPager>
                </div>

            </LayoutTemplate>
        </asp:ListView>
        </ContentTemplate>

        <Triggers>
           
            <aspAsyncPostBackTrigger ControlId="ddlCategory" EventName="SelectedIndexChanged" />
            
            <aspAsyncPostBackTrigger ControlId="TextBox1" EventName="TextChanged" />
        </Triggers>

        
        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
    </div>
    <%-- end of profuct --%>

    <%-- start of about us section --%>
    <div class="sec1 containter-fluid py-5">
        <h1>About Us</h1>
        <div class="row col-md-12">
            <div class="col-md-6">
                <h3>Our History</h3>
                <p>Vide grenier is an  electronic commerce is the buying and selling of goods or services on the Internet. It encompasses a wide variety of data, systems and tools for online buyers and sellers, including mobile shopping and online payment encryption.

Most businesses with an online presence use an online store and/or platform to conduct ecommerce marketing and sales activities and to oversee logistics and fulfillment.</p>
            </div>


            <div class="col-md-6">
                <h3>Our Team</h3>
                <img src="image/about.jpg" class="img-responsive" style="height: 500px; width: 100%;" />

            </div>
        </div>
    </div>
    <%-- end of about us section --%>
  

    <%-- start of Terms and condition --%>
    <div class="sec2 container-fluid py-5">
        <h2>Our Terms, Policy and Services</h2>

        <div class="ser1 row col-md-12">

            <div class="col-md-3">
                <h3>Security</h3>
                <i class="fa-solid fa-key"></i>
                <p>We provide the best security</p>
            </div>
            <div class="col-md-3">
                <h3>Policy</h3>
                <i class="fa-sharp fa-solid fa-building-shield"></i>
                <p>We are approved by the law</p>
            </div>

            <div class="col-md-3">
                <h3>Fast Service</h3>
                <i class="fa-brands fa-aws"></i>

                <p>We provide fast delivery</p>
            </div>
            <div class="col-md-3">
                <h3>We are reliable</h3>
                <i class="fa-regular fa-handshake"></i>
                <p>Trust Us</p>
            </div>



        </div>
    </div>

    <%-- end of  Terms and condition --%>

    <%--start of item section --%>
    <div class="sec-3 container-fluid mb-5">
        <h2>Here are some of our available items.</h2>
        <%-- start of gallery --%>
        <!-- Modal gallery -->
<section class="pt-5">
  <!-- Section: Images -->
  <section class="">
    <div class="row">
      <div class="col-lg-4 col-md-12 mb-4 mb-lg-0">
        <div
          class="bg-image hover-overlay ripple shadow-1-strong rounded"
          data-ripple-color="light"
        >
            <img src="image/iphone.jpg" class="img-responsive w-100" />
          <a href="#!" data-mdb-toggle="modal" data-mdb-target="#exampleModal1">
            <div class="mask" style="background-color: rgba(251, 251, 251, 0.2);"></div>
          </a>
        </div>
      </div>

      <div class="col-lg-4 mb-4 mb-lg-0">
        <div
          class="bg-image hover-overlay ripple shadow-1-strong rounded"
          data-ripple-color="light"
        >
            <img src="image/ps5.png" class="img-responsive w-100" />
          <a href="#!" data-mdb-toggle="modal" data-mdb-target="#exampleModal2">
            <div class="mask" style="background-color: rgba(251, 251, 251, 0.2);"></div>
          </a>
        </div>
      </div>

      <div class="col-lg-4 mb-4 mb-lg-0">
        <div
          class="bg-image hover-overlay ripple shadow-1-strong rounded"
          data-ripple-color="light"
        >
            <img src="image/glass.jpg" class="img-responsive w-100" />
          <a href="#!" data-mdb-toggle="modal" data-mdb-target="#exampleModal3">
            <div class="mask" style="background-color: rgba(251, 251, 251, 0.2);"></div>
          </a>
        </div>
      </div>
    </div>
  </section>

</section>
        <%-- end of gallery --%>
    </div>
    <%-- end of item section --%>
</asp:Content>
