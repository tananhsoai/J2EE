
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" java.util.*, 
         java.text.SimpleDateFormat, 
         model.*, 
         sevice.*,
         java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="inc/head.jsp" %>
        <link rel="stylesheet" href="css/index.css">
        <title>Sản phẩm</title>
        <style>
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
        </style>
    </head>

    <body>
        <%
            taikhoan tk = new taikhoan();
            tk = (taikhoan) session.getAttribute("taikhoan");
            int n = 1;
            session.setAttribute("kiemtradn", n);
        %>
        <header>
            <%@include file="inc/nav.jsp" %>
        </header>

        <div class="container" style="margin-bottom: 30px">
            <div class="card-header my-3">Tất cả sản phẩm </div>
            <hr class="border border-danger border-2 opacity-50">
            <div class="row row-cols-1 row-cols-md-4 g-4">
                <%
                    sanphamsv spsv = new sanphamsv();
                    List<sanpham> ds_sp = spsv.getAllSanPham();
                    if( !ds_sp.isEmpty()){
                        for(sanpham sp : ds_sp){
                        DecimalFormat formatter = new DecimalFormat("#,###");
                %>  
                <div class="col-md-3">
                    <div class="card w-100" style="width: 18rem;">
                        <img src="img/<%= sp.getAnh() %>" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title"><%= sp.getTensp() %></h5>
                            <h6 class="price">Bộ nhớ: <%= sp.getRam()%>GB/<%= sp.getRom()%>GB </h6>
                            <h6 class="price">Pin: <%= sp.getPin() %> mAh</h6>
                            <h6 class="price">Màn hình: <%= sp.getManhinh() %> Inch</h6>
                            <h6 class="price">Giá: <%= formatter.format(sp.getGia()) %> VND</h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a href="./add_to_card?id=<%= sp.getMasp()%>" class="btn btn-dark">Thêm vào giỏ hàng</a>
                                <a href="./mua?gia=<%= sp.getGia() %>&soluong=1&id=<%=sp.getMasp()%>" class="btn btn-primary">Mua Ngay</a>
                            </div>
                            <h5 style='color:crimson; text-align: center'></h5>

                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %> 
            </div>
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
</html>