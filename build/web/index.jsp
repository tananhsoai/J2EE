<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" java.util.*, 
         java.text.SimpleDateFormat, 
         model.*, 
         sevice.*,
         java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <%@include file="inc/head.jsp" %>
        <title>Trang Chủ</title>
        <link rel="stylesheet" href="css/index.css">
        <style>

            /* Đặt kiểu dáng cho overlay */
            .overley {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                display: none;
                justify-content: center;
                align-items: center;
            }

            /* Đặt kiểu dáng cho container của form */
            .form-container {
                background: #fff;
                padding: 40px; /* Tăng padding để tạo không gian rộng hơn */
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 400px; /* Tăng chiều rộng của form */
                text-align: center;
            }

            /* Đặt kiểu dáng cho tiêu đề */
            .form-container h1 {
                margin-bottom: 30px; /* Tăng khoảng cách dưới tiêu đề */
            }

            /* Đặt kiểu dáng cho nhóm form */
            .form-group {
                margin-bottom: 20px; /* Tăng khoảng cách giữa các nhóm */
                text-align: left;
            }

            /* Đặt kiểu dáng cho nhãn */
            .form-group label {
                display: block;
                margin-bottom: 10px; /* Tăng khoảng cách dưới nhãn */
            }

            /* Đặt kiểu dáng cho input */
            .form-group input {
                width: 100%;
                padding: 15px; /* Tăng padding của input để input lớn hơn */
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            /* Đặt kiểu dáng cho nút */
            button[type="submit"] {
                background: #4CAF50;
                color: white;
                padding: 15px 20px; /* Tăng padding của nút */
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            button[type="submit"]:hover {
                background: #45a049;
            }

            /* Đặt kiểu dáng cho link */
            .form-container a {
                color: #007BFF;
                text-decoration: none;
            }

            .form-container a:hover {
                text-decoration: underline;
            }

            /* Đặt kiểu dáng cho đoạn văn bản màu đỏ */
            .form-group p {
                margin: 0;
                color: red;
            }

            h3{
                text-align: center
            }
            /* Footer */
            footer {
                background-color: #f1c40f;  /* Màu vàng chủ đạo */
                color: #333;  /* Màu chữ tối để dễ đọc */
                font-family: Arial, sans-serif;
                padding: 20px 0;

            }

            .footer-container {
                display: flex;
                justify-content: space-around;
                gap: 20px;
                flex-wrap: wrap;
                margin-bottom: 20px;
            }

            .footer-info, .footer-social {
                flex: 1;
                min-width: 200px;
            }

            .footer-info h3, .footer-social h3 {
                font-size: 18px;
                margin-bottom: 10px;
                color: #333;
                font-weight: bold;
            }

            .footer-info ul, .footer-social ul {
                list-style: none;
                padding: 0;

            }

            .footer-info ul li, .footer-social ul li {
                margin-bottom: 8px;
                font-size: 14px;
            }

            .footer-info ul li a, .footer-social ul li a {
                color: #333;
                text-decoration: none;
            }

            .footer-info ul li a:hover, .footer-social ul li a:hover {
                color: #e67e22; /* Màu cam nhẹ khi hover */
            }

            .footer-bottom {
                font-size: 12px;
                color: #333;
                margin-top: 10px;
                text-align: center;
            }

            .footer-bottom p {
                font-size: 15px;
                margin: 0;
            }

            /* Responsive for smaller screens */
            @media screen and (max-width: 768px) {
                .footer-container {
                    flex-direction: column;
                    align-items: center;
                }
            }
            .footer-info ul{
                justify-content: left;
                margin-left: 250px
            }
            .footer-social ul{
                margin-left: 00px;
                text-align: center
            }

        </style>
    </head>

    <body>
        <%
            taikhoan tk = new taikhoan();
            tk = (taikhoan) session.getAttribute("taikhoan");
            int n = 0;
            session.setAttribute("kiemtradn", n);
            if (tk != null){
            session.setAttribute("taikhoan", tk);
            }
        %>
        <header>
            <%@include file="inc/nav.jsp" %>
        </header>

        <div>
            <section>
                <img src="./img/trangchu1.png" alt="" width="100%">
            </section>
        </div>

    </body>
    <%@include file="inc/formdangnhap.jsp" %>
    <script>
        const openFormBtn = document.getElementById('openFormBtn');
        const formOverlay = document.getElementById('formOverlay');
        openFormBtn.addEventListener('click', function () {
            formOverlay.style.display = 'flex'; // Hiển thị overlay và form
        });
        formOverlay.addEventListener('click', function (event) {
            if (event.target === formOverlay) {
                formOverlay.style.display = 'none';
            }
        });
    </script>
    <footer>
        <div class="footer-container">
            <div class="footer-info">
                <h3>Thông Tin Liên Hệ</h3>
                <ul>
                    <li><strong>Địa chỉ:</strong> 123 Đường ABC, Quận XYZ, TP.HCM</li>
                    <li><strong>Điện thoại:</strong> <a href="tel:+84901234567">+84 901 234 567</a></li>
                    <li><strong>Email:</strong> <a href="mailto:contact@laptopstore.com">contact@laptopstore.com</a></li>
                </ul>
            </div>
            <div class="footer-social">
                <h3>Theo Dõi Chúng Tôi</h3>
                <ul>
                    <li><a href="#" target="_blank">Facebook</a></li>
                    <li><a href="#" target="_blank">Instagram</a></li>
                    <li><a href="#" target="_blank">Twitter</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 MyLaptop.</p>
        </div>
    </footer>
</html>
