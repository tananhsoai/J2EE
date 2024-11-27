
<%@page import="model.taikhoan"%>
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
            tk = (taikhoan) session.getAttribute("taikhoan");
            if (tk != null) {
                session.setAttribute("taikhoan", tk);

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

            <div class="left-column">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="searchInput" placeholder="Nhập tên người mua hàng" aria-label="Recipient's username" aria-describedby="button-addon2">
                    <button class="btn btn-outline-secondary" type="button" id="button-addon2">Tìm</button>
                </div>
                <table class="table table-striped mt-3" id="customerTable">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">Mã</th>
                            <th scope="col">Nhân Viên</th>
                            <th scope="col">Khách Hàng</th>
                            <th scope="col">Tên Hàng</th>
                            <th scope="col">Tổng tiền</th>
                            <th scope="col">Ngày Thanh Toán</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            hoadonsv listdh = new hoadonsv();
                            List<HoaDon> ldh = listdh.getallhd();
                            for (HoaDon a : ldh) {
                                DecimalFormat formatter = new DecimalFormat("#,###");
                                int i = 1;
                                if (a.getTrangthai() == 1) {
                        %>
                        <tr>
                            <td><%=a.getMaHoaDon()%></td>
                            <td><%//=a.getManhanVien()
                                taikhoansv l_tk = new taikhoansv();
                                List<taikhoan> ltk = l_tk.getAllTaiKhoan();
                                for (taikhoan k : ltk) {
                                    if (k.getTentk().equals(a.getManhanVien())) {
                                        out.println(k.getHoten());
                                    }
                                }
                                %></td>
                            <td><%
                                lichsugdsv l_ls = new lichsugdsv();
                                List<lichsugd> lgd = l_ls.getallls();
                                for (lichsugd b : lgd) {
                                    if (a.getMalsgd() == b.getMals()) {
                                        for (taikhoan k : ltk) {
                                            if (k.getTentk().equals(b.getTentk())) {
                                                out.println(k.getHoten());
                                            }
                                        }
                                    }
                                }
                                %></td>
                            <td><%
                                for (lichsugd b : lgd) {
                                    if (a.getMalsgd() == b.getMals()) {
//                                        out.println(b.getTensp());
                                        sanphamsv lsv = new sanphamsv();
                                        List<sanpham> lsap = lsv.getAllSanPham();
                                        for(sanpham m : lsap){
                                            if(b.getMasp() == m.getMasp()){
                                                out.println(m.getTensp());
                                                break;
                                            }
                                        }
                                    }
                                }
                                %></td>
                                <%
                                    lichsugd yy = new lichsugd();
                                    for (lichsugd b : lgd) {
                                        if (a.getMalsgd() == b.getMals()) {
                                            //out.println(b.getGia());
                                            yy = new lichsugd(b.getMals(), b.getTentk(), b.getSoluong(), b.getDate(), b.getGia(), b.getTrangthai());
                                        }
                                    }
                                %>
                            <td><%=(yy.getGia()>0)?formatter.format(yy.getGia()):0%>VNĐ</td>
                            <td><%=a.getNgaygiaoDich()%></td>
                        </tr>
                        <%
                                    i++;
                                }
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
