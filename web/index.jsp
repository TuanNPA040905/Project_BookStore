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
        <link rel="stylesheet" href="./css/index.css"/>
    </head>
    <body>
        <!-- header -->

        <jsp:include page="header.jsp"/>
        <!--Page Content-->
        <div class="container-fluid">
            <div class="row">
                <!--menu-->

                <div class="col-12">
                    <div class="list-item">
                        <ul>
                            <li><a>Hàng mới</a></li>
                            <li><a>Sản phẩm mới</a></li>
                            <li><a>Áo nam</a></li>
                            <li><a>Quần nam</a></li>
                            <li><a>Phụ kiện</a></li>
                            <li><a>Jeans</a></li>
                        </ul>
                    </div>
                </div>
                <!--end menu-->
                <!--slider and product-->

                <div class="col-lg-10 carousell">
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

            <div class="row " style="margin-top: 100px">
                <h2 class="title-content">Best Sellers</h2>
                <div class="product-list col-md-10">
                    <div class="card" style="width: 18rem;">
                        <img src="./img/img_item/best-s.jpg" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title">296,000đ<del>349,000đ</del></h5>
                            <p class="card-text">Áo Khoác Nam Xỏ Ngón Chống Nắng ICONDENIM UltraShade</p>
                            <form action="dat-hang" method="post" style="display: inline;">
                                <input type="hidden" name="maSanPham" value="SP001">
                                <input type="hidden" name="soLuong" value="1">
                                <button type="submit" class="btn btn-primary">Đặt hàng</button>
                            </form>
                        </div>
                    </div><div class="card" style="width: 18rem;">
                        <img src="./img/img_item/best-s1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">509,000đ<del>599,000đ</del></h5>
                            <p class="card-text">Áo Khoác Nam Denim ICONDENIM Vintage Wash Form Loose</p>
                            <form action="dat-hang" method="post" style="display: inline;">
                                <input type="hidden" name="maSanPham" value="SP001">
                                <input type="hidden" name="soLuong" value="1">
                                <button type="submit" class="btn btn-primary">Đặt hàng</button>
                            </form>
                        </div>
                    </div><div class="card" style="width: 18rem;">
                        <img src="./img/img_item/best-s2.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">551,000đ<del>649,000đ</del></h5>
                            <p class="card-text">Áo Khoác Jean Nam ICONDENIM Moss Sage Tint Wash Form Loose</p>
                            <form action="dat-hang" method="post" style="display: inline;">
                                <input type="hidden" name="maSanPham" value="SP001">
                                <input type="hidden" name="soLuong" value="1">
                                <button type="submit" class="btn btn-primary">Đặt hàng</button>
                            </form>
                        </div>
                    </div><div class="card" style="width: 18rem;">
                        <img src="./img/img_item/best-s3.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">424,000đ<del>499,000đ</del></h5>
                            <p class="card-text">Áo Khoác Gió Nam ICONDENIM Sonic Airflow Form Regular</p>
                            <form action="dat-hang" method="post" style="display: inline;">
                                <input type="hidden" name="maSanPham" value="SP001">
                                <input type="hidden" name="soLuong" value="1">
                                <button type="submit" class="btn btn-primary">Đặt hàng</button>
                            </form>
                        </div>
                    </div><div class="card" style="width: 18rem;">
                        <img src="./img/img_item/best-s4.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">382,000đ<del>449,000đ</del></h5>
                            <p class="card-text">Áo Khoác Nam ICONDENIM Flex Pocketable</p>
                            <form action="dat-hang" method="post" style="display: inline;">
                                <input type="hidden" name="maSanPham" value="SP001">
                                <input type="hidden" name="soLuong" value="1">
                                <button type="submit" class="btn btn-primary">Đặt hàng</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Page Content-->

        <!--footer-->
        <%@include file="footer.jsp" %>


    </body>
</html>

