<%-- 
    Document   : regrister
    Created on : Sep 16, 2025, 5:28:51 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Trang đăng kí tài khoản</title>
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
            String baoLoi = request.getAttribute("baoLoi") + "";
            baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;

            String tenDangNhap = request.getAttribute("tenDangNhap") + "";
            tenDangNhap = (tenDangNhap.equals("null")) ? "" : tenDangNhap;

            String hoVaTen = request.getAttribute("hoVaTen") + "";
            hoVaTen = (hoVaTen.equals("null")) ? "" : hoVaTen;

            String gioiTinh = request.getAttribute("gioiTinh") + "";
            gioiTinh = (gioiTinh.equals("null")) ? "" : gioiTinh;

            String ngaySinh = request.getAttribute("ngaySinh") + "";
            ngaySinh = (ngaySinh.equals("null")) ? "" : ngaySinh;

            String diaChiKhachHang = request.getAttribute("diaChiKhachHang") + "";
            diaChiKhachHang = (diaChiKhachHang.equals("null")) ? "" : diaChiKhachHang;

            String diaChiMuaHang = request.getAttribute("diaChiMuaHang") + "";
            diaChiMuaHang = (diaChiMuaHang.equals("null")) ? "" : diaChiMuaHang;

            String diaChiNhanHang = request.getAttribute("diaChiNhanHang") + "";
            diaChiNhanHang = (diaChiNhanHang.equals("null")) ? "" : diaChiNhanHang;

            String dienThoai = request.getAttribute("dienThoai") + "";
            dienThoai = (dienThoai.equals("null")) ? "" : dienThoai;

            String email = request.getAttribute("email") + "";
            email = (email.equals("null")) ? "" : email;

            String dongYNhanTB = request.getAttribute("dongYNhanTB") + "";
            dongYNhanTB = (dongYNhanTB.equals("null")) ? "" : dongYNhanTB;

        %>
        <div class="container">
            <h1 class="title-center">ĐĂNG KÝ TÀI KHOẢN</h1>
            <div class="red" id="baoLoi">
                <%=baoLoi%>
            </div>
            <form action="do-regrister" class="form" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <h3>Tài khoản</h3>
                        <div class="mb-3">
                            <label for="tenDangNhap" class="tenDangNhap">username<span class="red">*</span></label>
                            <input type="text" class="form-control" id="tenDangNhap" placeholder="username" name="tenDangNhap" value="<%=tenDangNhap%>">
                        </div>
                        <div class="mb-3">
                            <label for="matKhau" class="form-label">Mật khẩu<span class="red">*</span></label>
                            <input type="password" class="form-control" id="matKhau" name="matKhau" > 
                        </div>
                        <div class="mb-3">
                            <label for="matKhauNhapLai" class="form-label">Mật khẩu nhập lại<span class="red">*</span>
                                <span id="msg" class="red"></span></label>
                            <input type="password" class="form-control" id="matKhauNhapLai" name="matKhauNhapLai" onkeyup="kiemTraMatKhau()"> 
                        </div>
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
                            <label for="ngaySinh" class="form-label">ngaySinh</label>
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
                            <label for="dongYDieuKhoan" class="form-label">Đồng ý với điều khoản của công ty<span id="red">*</span></label>
                            <input type="checkbox" class="form-check-input" id="dongYDieuKhoan" name="dongYDieuKhoan" required="required" onchange="kiemTraDongY()" value="<%%>">
                        </div>
                        <div class="mb-3">
                            <label for="dongYNhanTB" class="form-label">Đồng ý nhận thông báo mới nhất</label>
                            <input type="checkbox" class="form-check-input" id="dongYNhanTB" name="dongYNhanTB">
                        </div>

                        <input class="btn btn-primary form-control" type="submit" value="Đăng ký" id="submit" style="display: none"/>
                    </div>
                </div>
            </form>
        </div>

    </body>
    <script>
        function kiemTraMatKhau() {
            matKhau = document.getElementById("matKhau").value;
            matKhauNhapLai = document.getElementById("matKhauNhapLai").value;
            if (matKhau != matKhauNhapLai) {
                document.getElementById("msg").innerHTML = "Mật khẩu không khớp!";
                return false;
            } else {
                document.getElementById("msg").innerHTML = "";
                return true;
            }
        }

        function kiemTraDongY() {
            let check = document.getElementById("dongYDieuKhoan");
            let btn = document.getElementById("submit");

            if (check.checked) {
                btn.style.display = "block";
            } else {
                btn.style.display = "none";
            }
        }

    </script>
</html>
