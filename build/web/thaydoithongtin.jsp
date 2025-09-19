<%-- 
    Document   : regrister
    Created on : Sep 16, 2025, 5:28:51 PM
    Author     : Admin
--%>

<%@page import="model.KhachHang"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Thông tin</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- JS Bundle (bao gồm Popper) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <style>

            .title-center {
                text-align: center;
            }
            .red {
                color:red;
            }
        </style>
    </head>

    <body>
        <%
            Object obj = session.getAttribute("khachHang");
            KhachHang khachHang = null;
            if (obj != null) {
                khachHang = (KhachHang) obj;
            }
            if (khachHang == null) {


        %>
        <h1>Bạn chưa đăng nhập vào hệ thống. Vui lòng quay lại trang chủ!</h1>
        <a href="/index.jsp">Quay lại trang chủ</a>
        <%        } else {
        %>
        <%
            String baoLoi = request.getAttribute("baoLoi") + "";
            baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;

            String hoVaTen = khachHang.getHoVaTen();
            String gioiTinh = khachHang.getGioiTinh();
            String ngaySinh = khachHang.getNgaySinh().toString();
            String diaChiKhachHang = khachHang.getDiaChi();
            String diaChiMuaHang = khachHang.getDiaChiMuaHang();
            String diaChiNhanHang = khachHang.getDiaChiNhanHang();
            String dienThoai = khachHang.getSoDienThoai();
            String email = khachHang.getEmail();
            boolean dongYNhanMail = khachHang.isDkyNhanBanTinEmail();
            
        %>
        <div class="container">
            <h1 class="title-center">Thông tin</h1>
            <div class="red" id="baoLoi">
                <%=baoLoi%>
            </div>
            <form action="thay-doi-thong-tin" class="form" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <h3>Thông tin khách hàng</h3>
                        <div class="mb-3">
                            <label for="hoVaTen" class="hoVaTen">Họ và tên: </label>
                            <input type="text" class="form-control" id="hoVaTen" placeholder="name" name="hoVaTen" value="<%=hoVaTen%>">
                        </div>
                        <div class="mb-3">
                            <label for="gioiTinh" class="form-label">Giới tính</label>
                            <select class="form-control" id="gioiTinh" name="gioiTinh">
                                <option value="Nam" <%=(gioiTinh == "Nam") ? "selected='selected'" : ""%>>Nam</option>
                                <option value="Nu" <%=(gioiTinh == "Nữ") ? "selected='selected'" : ""%>>Nữ</option>
                                <option value="Khac" <%=(gioiTinh == "Khác") ? "selected='selected'" : ""%>>Khác</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="ngaySinh" class="form-label">Ngày sinh</label>
                            <input type="date" class="form-control" id="ngaySinh" name="ngaySinh" value="<%=ngaySinh%>">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h3>Địa chỉ</h3>

                        <div class="mb-3">
                            <label for="diaChiKhachHang" class="form-label">Địa chỉ khách hàng</label>
                            <input type="text" class="form-control" id="diaChiKhachHang" name="diaChiKhachHang" value="<%=diaChiKhachHang%>">
                        </div>
                        <div class="mb-3">
                            <label for="diaChiMuaHang" class="form-label">Địa chỉ mua hàng</label>
                            <input type="text" class="form-control" id="diaChiMuaHang" name="diaChiMuaHang" value="<%=diaChiMuaHang%>">
                        </div>
                        <div class="mb-3">
                            <label for="diaChiNhanHang" class="form-label">Địa chỉ nhận hàng</label>
                            <input type="text" class="form-control" id="diaChiNhanHang" name="diaChiNhanHang" value="<%=diaChiNhanHang%>">
                        </div>
                        <div class="mb-3">
                            <label for="dienThoai" class="form-label">Điện thoại</label>
                            <input type="text" class="form-control" id="dienThoai" name="dienThoai" value="<%=dienThoai%>">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="text" class="form-control" id="email" name="email" value="<%=email%>">
                        </div>
                        <div class="mb-3">
                            <label for="dongYNhanTB" class="form-label">Đồng ý nhận thông báo mới nhất</label>
                            <input type="checkbox" class="form-check-input" id="dongYNhanTB" name="dongYNhanTB">
                        </div>

                        <input class="btn btn-primary form-control" type="submit" value="Thay đổi thông tin" id="submit" />
                    </div>
                </div>
            </form>
        </div>
<%}%>
    </body>
</html>
