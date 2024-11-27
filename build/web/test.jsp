
<%@page import="DAO.lichsugdDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" java.util.*, 
         java.text.SimpleDateFormat, 
         model.*, 
         sevice.*,
         java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/donhang.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <%@include file="inc/head.jsp" %>
        <title>Document</title>
    </head>

    <body>
        <%
            taikhoan tk = new taikhoan();
            String username = tk.getTentk();
            tk = (taikhoan) session.getAttribute("taikhoan");
            if (tk != null) {
                session.setAttribute("taikhoan", tk);
                username = new String(tk.getTentk());
                String ip = (String) session.getAttribute("ip");
                Date loginTime = (Date) session.getAttribute("loginTime");
                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                String formattedTime = formatter.format(loginTime);
            }
        %>
        <header>

            <%@include file="inc/nav_nhanvien.jsp" %>
        </header>
        <main>
            <!--<p>Tên tài khoản trong session: <%= username %></p>-->
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
                            
                                DecimalFormat formatter = new DecimalFormat("#,###");
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
                            <td><%=(a.getGia()>0)?formatter.format(a.getGia()):0%>VNĐ</td>
                            <td>
                                <%
                                    if (a.getTrangthai() == 0) {
                                %>
                                <a href="xacnhan?id=<%=a.getMals()%>&username=<%=username%>" type="button" class="btn btn-primary">Xác Nhận</a>
                                <a href="xoaDonHang?id=<%=a.getMals()%>" type="button" class="btn btn-danger">Xóa</a>
                                <%
                                } else {
                                    if (a.getTrangthai() == 1) {
                                %>
                                <a href="huyXacNhan?id=<%=a.getMals()%>" type="button" class="btn btn-warning">Hủy Xác Nhận</a>                               
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



        <!-- Bootstrap JS -->
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
