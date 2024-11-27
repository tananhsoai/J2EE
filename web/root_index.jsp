<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" java.util.*, 
         java.text.SimpleDateFormat, 
         model.*, 
         sevice.*,
         java.text.DecimalFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <%@include file="inc/head.jsp" %>
        <title>Cập nhật sản phẩm</title>
        <link rel="stylesheet" href="css/index.css">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                display: none;
                justify-content: center;
                align-items: center;
                z-index: 1000;
            }
            .edit-form {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                max-width: 500px;
                width: 100%;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .overley {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                display: none;
                justify-content: center;
                align-items: center;
                z-index: 1000;
            }
            .form-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                max-width: 500px;
                width: 100%;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            #openFormBtn {
                padding: 12px 28px; /* Kích thước nút */
                font-size: 16px;
                font-weight: bold;
                color: white;
                background-color: #28a745; /* Màu nền xanh lá */
                border: none;
                border-radius: 8px; /* Bo góc */
                cursor: pointer;
                transition: all 0.3s ease; /* Hiệu ứng chuyển động mượt mà */
                text-transform: uppercase; /* Chữ hoa */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Bóng đổ nhẹ */
                margin-left: 540px;
                margin-bottom:  50px;
                
            }

            /* Hiệu ứng hover */
            #openFormBtn:hover {
                background-color: #218838; /* Màu nền tối hơn khi hover */
                transform: translateY(-3px); /* Nâng nút lên khi hover */
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* Tăng độ bóng đổ khi hover */
            }
            .toast {
                visibility: hidden;
                max-width: 100%;
                height: 50px;
                margin-left: -125px;
                background-color: #6c757d;
                color: #fff;
                text-align: center;
                border-radius: 10px;
                padding-top: 8px;
                position: fixed;
                z-index: 1;
                left: 50%;
                top: 5px;
                font-size: 20px;
                align-items: center;
              
            }

            /* Toast khi hiển thị */
            .toast.show {
                visibility: visible;
                /* Show the toast with an animation */
                animation: fadein 0.5s, fadeout 0.5s 4.5s;
            }

            /* Animation for fading in the toast */
            @keyframes fadein {
                from {bottom: 0; opacity: 0;}
                to {bottom: 30px; opacity: 1;}
            }

            /* Animation for fading out the toast */
            @keyframes fadeout {
                from {opacity: 1;}
                to {opacity: 0;}
            }    
   
            </style>
<!--            <script>
                // Kiểm tra nếu có thông báo từ servlet
                <%--<c:if test="${not empty message}">--%>
                    alert("${message}"); // Hiển thị thông báo alert
                <%--</c:if>--%>
            </script>-->
        </head>

        <body>
            <%
                taikhoan tk = new taikhoan();
                tk = (taikhoan) session.getAttribute("taikhoan");
                if (tk != null) {
                    String ip = (String) session.getAttribute("ip");
                    Date loginTime = (Date) session.getAttribute("loginTime");
                    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    String formattedTime = formatter.format(loginTime);
                    sanphamsv spsv = new sanphamsv();

                }else{
                response.sendRedirect("dangnhap.jsp");
            }
            %>
            <header>
                <%@include file="inc/new_nav.jsp" %>
            </header>
            
            <div class="container";
                padding: 10px;
                border-radius: 10px;
                margin-bottom: 40px">
                    <!--            <div class="card-header my-3">Sản phẩm đang có: </div>-->
                    <h1>Sản phẩm đang có:</h1>
                    <hr class="border border-danger border-2 opacity-50">
                    <div class="row row-cols-1 row-cols-md-4 g-4">
                        <%
                            sanphamsv spsv = new sanphamsv();
                            List<sanpham> ds_sp = spsv.getAllSanPham();
                            if (!ds_sp.isEmpty()) {
                                for (sanpham sp : ds_sp) {
                                    DecimalFormat formatter = new DecimalFormat("#,###");
                        %>  
                        <div class="col-md-3">
                            <div class="card w-100" style="width: 18rem;">
                            <img src="img/<%= sp.getAnh()%>" class="card-img-top" alt="">
                            <div class="card-body">
                                <h5 class="card-title"><%= sp.getTensp()%></h5>
                                <h6 class="price">Bộ nhớ: <%= sp.getRam()%>GB/<%= sp.getRom()%>GB </h6>
                                <h6 class="price">Pin: <%= sp.getPin()%> mAh</h6>
                                <h6 class="price">Màn hình: <%= sp.getManhinh()%> Inch</h6>
                                <h6 class="price">Giá: <%= formatter.format(sp.getGia())%> VND</h6>
                                <div class="mt-3 d-flex justify-content-between">
                                    
                                    <button class="btn btn-secondary edit-button" data-id="<%= sp.getMasp()%>" data-name="<%= sp.getTensp()%>" 
                                            data-ram="<%= sp.getRam()%>" data-rom="<%= sp.getRom()%>" data-pin="<%= sp.getPin()%>" 
                                            data-screen="<%= sp.getManhinh()%>" data-price="<%= sp.getGia()%>" data-img="<%= sp.getAnh()%>">Sửa thông tin</button>
                                            <a onclick="return confirm('Chắc chắn xóa sản phẩm?');" href="./xoasptrongkho?id=<%=sp.getMasp()%>" class="btn btn-primary" style="">Xóa sản phẩm</a>
                                </div>
                                <h5 style='color:crimson;
                                text-align: center'></h5>

                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %> 
                        
                    </div>
                        <button class="btn btn-primary" id="openFormBtn" style="margin-top: 40px">Thêm sản phẩm mới</button>
                </div>
                
                        
                <div id="toast" class="toast">
                        <!-- Thông báo sẽ được hiển thị ở đây -->
                </div>
                <script>
                    // Kiểm tra nếu có thông báo từ session
                    <c:if test="${not empty sessionScope.message}">
                        var toastMessage = "${sessionScope.message}";  // Lấy thông báo từ session
                        var toast = document.getElementById("toast");

                        // Hiển thị toast với thông báo
                        toast.textContent = toastMessage;
                        toast.className = "toast show";  // Thêm class "show" để hiển thị

                        // Xóa thông báo trong session sau khi hiển thị
                        <c:remove var="message" scope="session" />

                        // Tự động ẩn thông báo sau 3 giây
                        setTimeout(function() {
                            toast.className = toast.className.replace("show", "");
                        }, 5000);
                    </c:if>
                        
                </script>


                <div class="overlay" id="editOverlay">
                    <div class="edit-form">
                        <h1>Sửa sản phẩm:</h1>
                        <form method="post" action="./capnhatsanpham" id="editProductForm">
                            <input type="hidden" id="editProductId" name="masp">
                            <div class="mb-3">
                                <label for="editProductName" class="form-label">Tên sản phẩm:</label>
                                <input name="tensp" type="text" class="form-control" id="editProductName" required>
                            </div>
                            <div class="mb-3">
                                <label for="editProductRam" class="form-label">Dung lượng Ram (GB)</label>
                                <input name="ram" type="text" class="form-control" id="editProductRam" required>
                            </div>
                            <div class="mb-3">
                                <label for="editProductRom" class="form-label">Dung lượng Ổ cứng (GB)</label>
                                <input name="rom" type="text" class="form-control" id="editProductRom" required>
                            </div>
                            <div class="mb-3">
                                <label for="editProductPin" class="form-label">Dung lượng Pin (mA)</label>
                                <input name="pin" type="text" class="form-control" id="editProductPin" required>
                            </div>
                            <div class="mb-3">
                                <label for="editProductScreen" class="form-label">Kích thước màn hình (in)</label>
                                <input name="manhinh" type="text" class="form-control" id="editProductScreen" required>
                            </div>
                            <div class="mb-3">
                                <label for="editProductImg" class="form-label">File hình ảnh (.PNG)</label>
                                <input name="img" type="text" class="form-control" id="editProductImg" required>
                            </div>
                            <div class="mb-3">
                                <label for="editProductPrice" class="form-label">Giá bán (VNĐ)</label>
                                <input name="gia" type="text" class="form-control" id="editProductPrice" required>
                            </div>
                            <div class="d-flex justify-content-between">
                                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                <a class="btn btn-secondary" id="cancelEdit" href="./root_index.jsp">Hủy</a>
                                
                            </div>
                        </form>
                    </div>
                </div>




            <div class="overley" id="formOverlay">                    
                <div class="form-container">
                    <h1>Thêm sản phẩm mới: </h1>
                    <hr class="border border-danger border-2 opacity-50" style="">
                    <form method="post" action="./themspvaokho"  >
                        <div class="mb-3" style="margin-bottom: 1px">
                          <label for="exampleInputEmail1" class="form-label">Tên sản phẩm: </label>
                          <input name="tensp" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                        </div>
                        <div class="mb-3 style="margin-bottom: 1px"">
                          <label for="exampleInputPassword1" class="form-label">Dung lượng Ram (GB)</label>
                          <input name="ram" type="text" class="form-control" id="exampleInputPassword1" required>
                        </div>
                        <div class="mb-3 style="margin-bottom: 1px"">
                          <label for="exampleInputPassword1" class="form-label">Dung lượng Ổ cứng (GB)</label>
                          <input name="rom" type="text" class="form-control" id="exampleInputPassword1" required>
                        </div>
                        <div class="mb-3">
                          <label for="exampleInputPassword1" class="form-label">Dung lượng Pin (mA)</label>
                          <input name="pin" type="text" class="form-control" id="exampleInputPassword1" required>
                        </div>
                        <div class="mb-3">
                          <label for="exampleInputPassword1" class="form-label">Kích thước màn hình (in)</label>
                          <input name="manhinh" type="text" class="form-control" id="exampleInputPassword1" required>
                        </div>
                        <div class="mb-3">
                          <label for="exampleInputPassword1" class="form-label">File hình ảnh</label>
                          <input name="hinhanh" type="text" class="form-control" id="exampleInputPassword1" required>
                        </div>
                        <div class="mb-3">
                          <label for="exampleInputPassword1" class="form-label">Giá bán (VNĐ)</label>
                          <input name="gia" type="text" class="form-control" id="exampleInputPassword1" required>
                        </div>
                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-primary" >Thêm sản phẩm</button>
                            <a class="btn btn-secondary" href="./root_index.jsp" >Hủy</a>
                        </div>
                    </form>
                </div>
            </div>        
                        
                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        const editButtons = document.querySelectorAll('.edit-button');
                        const overlay = document.getElementById('editOverlay');
                        const editForm = document.querySelector('.edit-form');
                        const editProductForm = document.getElementById('editProductForm');
                        const cancelEditButton = document.getElementById('cancelEdit');
                        
                        overlay.addEventListener('click', function(event) {
                            if (event.target === overlay) {
                                overlay.style.display = 'none';
                            }
                        });
                        
                        editButtons.forEach(button => {
                            button.addEventListener('click', function () {
                                const productId = this.getAttribute('data-id');
                                const productName = this.getAttribute('data-name');
                                const productRam = this.getAttribute('data-ram');
                                const productRom = this.getAttribute('data-rom');
                                const productPin = this.getAttribute('data-pin');
                                const productScreen = this.getAttribute('data-screen');
                                const productImg = this.getAttribute('data-img');
                                const productPrice = this.getAttribute('data-price');
                                overlay.style.display = 'flex';
                                document.getElementById('editProductId').value = productId;
                                document.getElementById('editProductName').value = productName;
                                document.getElementById('editProductRam').value = productRam;
                                document.getElementById('editProductRom').value = productRom;
                                document.getElementById('editProductPin').value = productPin;
                                document.getElementById('editProductScreen').value = productScreen;
                                document.getElementById('editProductImg').value = productImg;
                                document.getElementById('editProductPrice').value = productPrice;
                            });
                        });
                    });
                    
                    
                    const openFormBtn = document.getElementById('openFormBtn');
                    const formOverlay = document.getElementById('formOverlay');
                    openFormBtn.addEventListener('click', function() {
                        formOverlay.style.display = 'flex'; // Hiển thị overlay và form
                    });
                    formOverlay.addEventListener('click', function(event) {
                        if (event.target === formOverlay) {
                            formOverlay.style.display = 'none';
                        }
                    });
                </script>
            </body>
            <footer>
                <%@include file="inc/footer.jsp" %>
            </footer>

        </html>
