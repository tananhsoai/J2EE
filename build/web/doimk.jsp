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
        <title>Đổi mật khẩu</title>
    </head>
    <header>
        <%@include file="inc/nav.jsp" %>
    </header>
    <body>
        <div class="dangky-container">
            <h1>Đổi mật khẩu</h1>
            <form id="dangkyForm" action="./test" method="POST">
                <div class="form-group">
                    <label for="dkusername">Tên tài khoản:</label>
                    <input type="text" id="dkusername" name="dkusername" value="${tentk}" disabled>
                </div>

                <div class="form-group">
                    <label for="dkpassword">Mật khẩu mới:</label>
                    <input type="password" id="dkpassword" name="dkpassword" value="${mktk}" required>
                </div>

                <div class="form-group">
                    <label for="repassword">Nhập lại mật khẩu:</label>
                    <input type="password" id="repassword" name="repassword" value="${mktk}" required>
                </div>
                <div class="button-container">
                    <button type="submit">Đổi</button>
                </div>
            </form>
        </div>
    </body>
    <script src="js/dangky.js"></script>
</html>
