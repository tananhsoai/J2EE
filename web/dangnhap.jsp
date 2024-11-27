<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat, model.taikhoan" %>
        <%
            taikhoan tk = new taikhoan();
            tk = (taikhoan) session.getAttribute("taikhoan");
            if (tk != null){
                response.sendRedirect("index.jsp");
            }
        %> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="inc/head.jsp" %>
        <title>Đăng Nhập</title>
        <link rel="stylesheet" href="css/login.css">

    </head>

    <body>
        
        <div class="login-container">
            <h1>Login</h1>
            <form id="loginForm" action="./kiemtradn" method="POST">
                <div class="form-group">
                    <label for="username">Tên tài khoản:</label>
                    <input type="text" id="username" name="username" value="${tentk}" required>
                </div>  

                <div class="form-group">
                    <label for="password">Mật khẩu:</label>
                    <input type="password" id="password" name="password" value="${mktk}" required>
                </div>
                <div class="form-group">
                    <p style="color: red;">${errorMessage}</p>
                </div>
                <button type="submit">Đăng nhập</button>
            </form>
            <p>Chưa có tài khoản? <a href="dangky.jsp">Đăng ký</a></p>
        </div>
    </body>
    

</html>  