<%-- 
    Document   : formdangnhap
    Created on : Nov 25, 2024, 2:12:14 AM
    Author     : hson9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="overley" id="formOverlay">
    <div class="form-container" >
        <h1>Login</h1>
        <form id="editProductForm" action="./kiemtradn" method="POST">
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
</div>