<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Đăng nhập</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
            crossorigin="anonymous">
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/sign-in.css"/>
        <!-- Custom styles for this template -->
        <%
            String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + request.getContextPath();
        %>

    </head>
    <body>
        <main class="form-signin w-100 m-auto">
            <form class="text-center" action="dang-nhap" method="POST">
                <img class="mb-4" src="<%=url%>/img/logo/logo.png"
                     alt="" width="100px">
                <h1 class="h3 mb-3 fw-normal dang-nhap">ĐĂNG NHẬP</h1>
                <%
                    String baoLoi = request.getAttribute("baoLoi") + "";
                    if (baoLoi.equals("null")) {
                        baoLoi = "";
                    }
                %>
                <div class="text-center"><span class="red"><%=baoLoi%></span></div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="tenDangNhap"
                           placeholder="Tên đăng nhập" name="tenDangNhap"> <label for="tenDangNhap">Tên đăng nhập</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="matKhau"
                           placeholder="Mật khẩu" name="matKhau"> <label for="matKhau">Mật khẩu</label>
                </div>

                <div class="checkbox mb-3 ghinho">
                    <label> <input type="checkbox" value="remember-me">
                        Ghi nhớ tài khoản này
                    </label>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Đăng nhập</button>
                <div class="other-pthuc">
                    <a><img src="https://th.bing.com/th/id/R.f3c43c44ccaad925bbfc9fa3e7ef41d9?rik=7Nve9oCWW%2bQY9g&riu=http%3a%2f%2ffreelogopng.com%2fimages%2fall_img%2f1657952641google-logo-png-image.png&ehk=TUA%2f%2b8UOXjIxyGqKnYo3ibaYcl8%2fdjn5iTF3kQIpxxg%3d&risl=&pid=ImgRaw&r=0" width="50px" height="50px" alt="alt"/>></a>
                    <a><img src="https://tse3.mm.bing.net/th/id/OIP.R9IDeyqRKdfB9aKoCeGQ0AHaHX?rs=1&pid=ImgDetMain&o=7&rm=3" width="50px" height="50px" alt="alt"/>>

                </div>
                <a href="regrister.jsp" class="dangky">Đăng ký tài khoản mới</a>
                <p class="mt-5 mb-3 text-muted">&copy; 2017–2025</p>
            </form>
        </main>
    </body>
</html>