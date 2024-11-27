

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng ký</title>
        <link rel="stylesheet" href="css/dangky.css">
    </head>

    <body>
        <div class="dangky-container">
            <h1>Đăng ký</h1>
            <form id="dangkyForm" action="./taotk" method="POST">
                <div class="form-group">
                    <label for="dkusername">Tên tài khoản:</label>
                    <input type="text" id="dkusername" name="dkusername" value="${tentk}" required>
                    <p style="color: red;">${errorMessage}</p>
                </div>

                <div class="form-group">
                    <label for="dkpassword">Mật khẩu:</label>
                    <input type="password" id="dkpassword" name="dkpassword" value="${mktk}" required>
                </div>

                <div class="form-group">
                    <label for="repassword">Nhập lại mật khẩu:</label>
                    <input type="password" id="repassword" name="repassword" value="${mktk}" required>
                </div>

                <div class="form-group">
                    <label for="hoten">Họ và tên:</label>
                    <input type="text" id="hoten" name="hoten" value="${ht}" required>
                </div>

                <div class="form-group">
                    <label for="diachi">Địa chỉ:</label>
                    <input type="text" id="diachi" name="diachi" value="${dc}" required>
                </div>

                <div class="form-group">
                    <label for="sdt">Số điện thoại:</label>
                    <input type="tel" id="sdt" name="sdt" value="${sdt}" required>
                </div>
                <div class="button-container">
                    <button type="submit">Đăng ký</button>
                    <button type="reset">Xóa</button>
                </div>
            </form>
            <p>Quay lại đăng nhập? <a href="dangnhap.jsp">Đăng nhập</a></p>
        </div>
        <script src="js/dangky.js"></script>
    </body>

</html>