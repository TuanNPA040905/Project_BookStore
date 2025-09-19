<%@page import="model.KhachHang"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- JS Bundle (bao gồm Popper) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="https://upload.wikimedia.org/wikipedia/sco/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/2034px-Starbucks_Corporation_Logo_2011.svg.png" 
                         alt="logo" width="50">

                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                        data-bs-target="#navbarSupportedContent" 
                        aria-controls="navbarSupportedContent" aria-expanded="false" 
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Trang chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Sale mạnh</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" 
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Thể loại
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Quần jeans</a></li>
                                <li><a class="dropdown-item" href="#">Đồ Set</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Vest</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" aria-disabled="true">Hết hàng</a>
                        </li>
                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Nội dung tìm kiếm" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Tìm</button>
                        <%
                            Object obj = session.getAttribute("khachHang");
                            KhachHang khachHang = null;
                            if (obj != null) {
                                khachHang = (KhachHang) obj;
                            }
                            if (khachHang == null) {

                        %>
                        <a class="btn btn-primary" style="white-space: nowrap; margin-left: 10px" href="dangnhap.jsp">
                            Đăng Nhập
                        </a>
                        <%} else {%>
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 bg-infor ">
                            <li class="nav-item dropdown dropstart"><a
                                    class="nav-link dropdown-toggle" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false"> Tài khoản</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Đơn hàng của tôi</a></li>
                                    <li><a class="dropdown-item" href="#">Thông báo</a></li>
                                    <li><a class="dropdown-item" href="#">Thay đổi thông tin</a></li>
                                    <li><a class="dropdown-item" href="doimatkhau.jsp">Đổi mật khẩu</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="dang-xuat">Thoát tài khoản</a></li>
                                </ul></li>
                        </ul>		
                        <%    }%>
                    </form>
                </div>
            </div>
        </nav>
        <!--End Navbar-->

        <!--Page Content-->
        <div class="container-fluid">
            <div class="row">
                <!--menu-->

                <div class="col-lg-3">
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action" aria-current="true">
                            Thời trang nam
                        </a>
                        <a href="#" class="list-group-item list-group-item-action">Thời trang nữ</a>
                        <a href="#" class="list-group-item list-group-item-action">Dành cho bé</a>
                    </div>
                </div>
                <!--end menu-->
                <!--slider and product-->

                <div class="col-lg-9">
                    <div id="carouselExample" class="carousel slide">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="https://template.canva.com/EAFKZlEbjgw/1/0/1600w-D34oTNhK5wU.jpg" class="d-block w-100" alt="..." style="width: 500px">
                            </div>
                            <div class="carousel-item">
                                <img src="https://template.canva.com/EAGkCXgwM9M/1/0/1600w-G_eLzhlbshg.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="https://template.canva.com/EAGGoWdyn9w/2/0/1600w-DsTALLZ5WzE.jpg" class="d-block w-100" alt="...">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <!--end slider-->

            </div>
            <div class="row" style="margin-top: 100px">
                <div class="col-lg-4">
                    <div class="card">
                        <img src="https://product.hstatic.net/1000333436/product/av348_f38d712d83484212b0223b1c76b1816f_master.jpg" class="card-img-top" alt="..." style="width: 100%">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card’s content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card" >
                        <img src="https://product.hstatic.net/1000333436/product/av348_f38d712d83484212b0223b1c76b1816f_master.jpg" class="card-img-top" alt="..." style="width: 100%">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card’s content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <img src="https://product.hstatic.net/1000333436/product/av348_f38d712d83484212b0223b1c76b1816f_master.jpg" class="card-img-top" alt="..." style="width: 100%">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card’s content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Page Content-->
    </body>
</html>

