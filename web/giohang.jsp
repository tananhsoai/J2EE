<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" java.util.*, 
         java.text.SimpleDateFormat, 
         model.*, 
         sevice.*,
         java.text.DecimalFormat" %>
<%
    DecimalFormat formatter = new DecimalFormat("#,###");
    
    taikhoan tk = (taikhoan) session.getAttribute("taikhoan");
    int n = 2;
    session.setAttribute("kiemtradn", n);
    ArrayList<giohang> ds_gh = (ArrayList<giohang>) session.getAttribute("ds_gh");
    List<giohang> gh_sp = null;
    if (ds_gh != null) {
        sanphamsv spsv = new sanphamsv();
        gh_sp = spsv.getGioHang(ds_gh);
        long gia = spsv.getTongGiaGH(ds_gh);
        request.setAttribute("gia", gia);
        request.setAttribute("ds_gh", ds_gh);
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="inc/head.jsp" %>
        <link rel="stylesheet" href="css/giohang.css">
        <link rel="stylesheet" href="css/index.css">
        <title>Giỏ hàng</title>
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
        <!-- nav -->
        <header>
            <%@include file="inc/nav.jsp" %>
        </header>

        <!-- than -->
        <div class="container my-3">

            <div class="d-flex py-3"><h3>Tổng giá: ${gia} VND </h3> <!--<a class="mx-3 btn btn-primary" href="cart-check-out">Kiểm tra lại</a>--> </div>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Tên</th>
                        <th scope="col">Giá</th>
                        <th scope="col">Số lượng</th>
                        <th scope="col">Hủy</th>        
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (ds_gh != null) {
                            for (giohang c : gh_sp) {
                            
                    %>
                    <tr>
                        <td><%= c.getTensp()%></td>
                        <td><%= formatter.format(c.getGia())%> VND</td>
                        <td>
                            <form action="./mua" method="post" class="form-inline">
                                <input type="hidden" name="id" value="<%= c.getMasp() %>" class="form-input">
                                <input type="hidden" name="gia" value="<%= c.getGia() %>">
                                <div class="form-group d-flex justify-content-between">
                                    <a class="btn bnt-sm btn-incre" href="soluong?action=inc&id=<%= c.getMasp() %>"><i class="fas fa-plus-square"></i></a> 
                                    <input type="text" name="soluong" class="form-control" value="<%= c.getSoluongsp() %>" readonly> 
                                    <a class="btn btn-sm btn-decre" href="soluong?action=dec&id=<%= c.getMasp() %>"><i class="fas fa-minus-square"></i></a>
                                    <button type="submit" class="btn btn-primary btn-sm">Mua</button>
                                </div>
                            </form>
                        </td>

                        <td><a href="xoa_spgh?id=<%= c.getMasp()%>" class="btn btn-sm btn-danger">Xóa</a></td>

                    </tr>
                    <%
                        }}%>
                </tbody>
            </table>
        </div>
        <script src="js/giohang.js"></script>
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
