<%@page import="DAO.lichsugdDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" java.util.*, 
         java.text.SimpleDateFormat, 
         model.*, 
         sevice.*,
         java.text.DecimalFormat" %>
<%
    DecimalFormat formatter = new DecimalFormat("#,###");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/donhang.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Example</title>
        <%@include file="inc/head.jsp" %>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
        <script>
            $(document).ready(function () {
                $(".myLink").click(function (event) {
                    event.preventDefault();
                    var messageId = $(this).data("id"); // Lấy ID từ thuộc tính data-id
                    $.ajax({
                        url: 'getInfo',
                        method: 'GET',
                        data: {id: messageId}, // Gửi ID đến servlet
                        success: function (response) {
                            showDialog(response);
                        },
                        error: function (xhr, status, error) {
                            console.error('Error: ' + error);
                        }
                    });
                });
            });

            function showDialog(content) {
                $("<div>").html(content).dialog({
                    title: 'Thông tin Khách Hàng:',
                    modal: true,
                    buttons: {
                        Thoát: function () {
                            $(this).dialog("close");
                        }
                    }
                });
            }
        </script>
    </head>
    <body>

        <%
            taikhoan tk = new taikhoan();
            String username = tk.getTentk();
            tk = (taikhoan) session.getAttribute("taikhoan");
            if (tk != null) {
                session.setAttribute("taikhoan", tk);
                username = new String(tk.getTentk());
            }else{
                response.sendRedirect("dangnhap.jsp");
            }
        %>

        <header>
            <%@include file="inc/nav_nhanvien.jsp" %>
        </header>

        <main>
            <!--<p>Tên tài khoản trong session: <%= username%></p>-->
            <div class="left-column">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="searchInput" placeholder="Nhập tên người mua hàng" aria-label="Recipient's username" aria-describedby="button-addon2">
                    <button class="btn btn-outline-secondary" type="button" id="button-addon2">Tìm</button>
                </div>
                <table class="table table-striped mt-3" id="customerTable">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Mã</th>
                            <th scope="col">Khách hàng</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Ngày tạo</th>
                            <th scope="col">Tổng tiền</th>
                            <th scope="col">Trạng Thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            lichsugdsv cd = new lichsugdsv();
                            List<lichsugd> ff = cd.getallls();
                            int i = 1;
                            for (lichsugd a : ff) {
                                if (a.getTrangthai() != 2) {
                        %>
                        <tr>

                            <td><%=i%></td>
                            <td><%=a.getMals()%></td>
                            <td><% //=a.getMaKhachHang()
                                taikhoansv l_tk = new taikhoansv();
                                List<taikhoan> ltk = l_tk.getAllTaiKhoan();
                                for (taikhoan k : ltk) {
                                    if (k.getTentk().equals(a.getTentk())) {
                                        out.println(k.getHoten());
                                    }
                                }
                                %></td>


                            <td><%=a.getSoluong()%></td>
                            <td><%=a.getDate()%></td>

                            <td><%=a.getGia()%> VNĐ</td>
                            <td>
                                <%
                                    if (a.getTrangthai() == 0) {
                                %>
                                <a href="xacnhan?id=<%=a.getMals()%>&username=<%=username%>" type="button" class="btn btn-primary">Xác Nhận</a>
                                <a href="xoaDonHang?id=<%=a.getMals()%>" type="button" class="btn btn-danger">Xóa</a>
                                <a href="#" class="btn btn-primary myLink" data-id=<%=a.getMals()%>>Chi tiết</a>
                                <%
                                } else {
                                    if (a.getTrangthai() == 1) {
                                %>
                                <a href="huyXacNhan?id=<%=a.getMals()%>" type="button" class="btn btn-warning">Hủy Xác Nhận</a>
                                <a href="#" class="btn btn-primary myLink" data-id=<%=a.getMals()%>>Chi tiết</a>
                                <%
                                            }
                                        }
                                    }
                                %>


                            </td>


                        </tr>
                        <%
                                i++;
                            }
                        %>
                    </tbody>
                </table>    

            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const searchInput = document.getElementById("searchInput");
                const searchButton = document.getElementById("button-addon2");
                const customerTable = document.getElementById("customerTable");
                function filterTable() {
                    const filter = searchInput.value.toUpperCase();
                    const tr = customerTable.getElementsByTagName("tr");
                    for (let i = 1; i < tr.length; i++) { // Bỏ qua hàng tiêu đề
                        const td = tr[i].getElementsByTagName("td")[2]; // Cột thứ 3 chứa tên khách hàng
                        if (td) {
                            const txtValue = td.textContent || td.innerText;
                            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                tr[i].style.display = "";
                            } else {
                                tr[i].style.display = "none";
                            }
                        }
                    }
                }

                // Gắn sự kiện 'keyup' cho thanh tìm kiếm
                searchInput.addEventListener("keyup", filterTable);
                // Gắn sự kiện 'click' cho nút tìm kiếm
                searchButton.addEventListener("click", filterTable);
            });
        </script>
    </body>
</html>

