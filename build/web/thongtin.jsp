<%@ page import=" java.util.*, 
         java.text.SimpleDateFormat, 
         model.*, 
         sevice.*,
         java.text.DecimalFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
               taikhoan tk = (taikhoan) session.getAttribute("taikhoan");
               if (tk == null){
                   response.sendRedirect("dangnhap.jsp");
               }else{
                   String username = tk.getTentk();
                   session.setAttribute("tentk", username);
                   session.setAttribute("ht", tk.getHoten());
                   session.setAttribute("sdt", tk.getSdt());
                   session.setAttribute("dc", tk.getDiachi());
               }
           
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="inc/head.jsp" %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/dangky.css">
        <link rel="stylesheet" href="css/index.css">
        <title>Hồ sơ</title>
    </head>
    <body>
        <header>
            <%@include file="inc/nav.jsp" %>
        </header>
        <div class="dangky-container">
            <h1>Hồ sơ</h1>
            <form id="dangkyForm" action="./suatt" method="POST">
                <div class="form-group">
                    <label for="dkusername">Tên tài khoản:</label>
                    <input type="text" id="dkusername" name="dkusername" value="${tentk}" disabled>
<!--                    <p style="color: red;">${errorMessage}</p>-->
                </div>

                <!--                <div class="form-group">
                                    <label for="dkpassword">Mật khẩu:</label>
                                    <input type="password" id="dkpassword" name="dkpassword" value="${mktk}" required>
                                </div>
                
                                <div class="form-group">
                                    <label for="repassword">Nhập lại mật khẩu:</label>
                                    <input type="password" id="repassword" name="repassword" value="${mktk}" required>
                                </div>-->

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
                    <button type="submit">Sửa thông tin</button>
                    <button type="button" onclick="redirectToPage()">Đổi mật khẩu</button>
                </div>
            </form>
        </div>
    </body>
    <script>
        function redirectToPage() {
            window.location.href = "doimk.jsp";
        }
    </script>
</html>
