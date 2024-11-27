<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" java.util.*, 
         java.text.SimpleDateFormat, 
         model.*, 
         sevice.*,
         java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN" />
<!DOCTYPE html>
<html lang="vi">

    <head>
        <%@include file="inc/head.jsp" %>
        <title>Thống Kê</title>
        <link rel="stylesheet" href="css/index.css">
        <!--<link rel="stylesheet" href="css/newcss.css">-->
        <!--<link rel="stylesheet" href="css/thongke.css">-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            td, th {padding-left: 5px; padding-right: 5px}
                table, td, th {border: 1px solid #dee2e6;}
                tbody{border: 1px solid #ccc}
                table {border-collapse: separate; margin-bottom: 2em; }
                table {width: 250px}
                th {height: 10px; text-align: center}
                td{white-space: nowrap; vertical-align: middle}
                table {font-size: 20px}
                .sl{text-align: center}
                .tien{text-align: right}
                #qq{width: 100%; height: 300px; overflow: hidden; overflow-y : scroll}
                #revenueChart{margin-bottom: 100px; }
                
        </style>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
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
                ArrayList<giohang> ds_gh = (ArrayList<giohang>) session.getAttribute("ds_gh");
                List<giohang> gh_sp = null;
                
            }else{
                response.sendRedirect("dangnhap.jsp");
            }
            DecimalFormat formatter = new DecimalFormat("#,###");
        %>
        <header>
            <%@include file="inc/new_nav.jsp" %>
        </header>

        <div class="container" style="margin-bottom: 10px; background-color: #d2d4d4; border-radius: 10px; padding: 30px">
            <h1>Thống Kê Doanh Số Theo Tháng Dạng Bảng</h1>
            <hr class="border border-danger border-2 opacity-50" style="">
            <form method="post" action="./thongkethang" style="margin: 10px" >
      Chọn Năm: <select name="nam" type="text" style="margin-right: 10px">
                    <option value="2023">2023</option>          
                    <option value="2024">2024</option>
                    
                </select>

    Chọn Tháng: <select name="thang" type="text" style="">
                    <option value="01">Tháng 1</option>
                    <option value="02">Tháng 2</option>
                    <option value="03">Tháng 3</option>
                    <option value="04">Tháng 4</option>
                    <option value="05">Tháng 5</option>
                    <option value="06">Tháng 6</option>
                    <option value="07">Tháng 7</option>
                    <option value="08">Tháng 8</option>
                    <option value="09">Tháng 9</option>
                    <option value="10">Tháng 10</option>
                    <option value="11">Tháng 11</option>
                    <option value="12">Tháng 12</option>
                </select>
                <button type="submit" class="btn btn-primary" style="margin: 10px">Xuất Thống Kê</button>
            </form>
        </div>
        <div class="container" >
            
            
            <c:if test="${not empty results}">
                <h2>Thống Kê Doanh Số Tháng ${date}: </h2>
                <div class="container" id="qq">
                    <table style="margin-left: auto; margin-right: auto; width: 100%"><tbody style="white-space: nowrap">
                            <tr>
                                <th>Họ Tên Khách Hàng</th>
                                <th>Sản Phẩm Đã Bán</th>
                                <th>Số Lượng</th>
                                <th>Tổng Tiền</th>                
                            </tr>
                            <c:set var="tong" value="0" /> 
                            <c:forEach items="${results}" var="result">
                                <tr>
                                    <td>${result.hoten}</td>
                                    <td>${result.tensp}</td>
                                    <td class="sl">${result.soluong}</td>
                                    <td class="tien"><fmt:formatNumber value="${result.tongtien}" pattern="#,###" /></td>
                                    <c:set var="tong" value="${tong + Long.parseLong(result.tongtien)}" />
                                    <c:set var="tsl" value="${tsl + Integer.parseInt(result.soluong)}" />
                                </tr>
                            </c:forEach>
                </div>
                            <tr>
                                <th style="text-align: center" colspan="2">Tổng</th>
                                <th class="s1"><fmt:formatNumber value="${tsl}" pattern="#,###" /></th>
                                <th class="tien"><fmt:formatNumber value="${tong}" pattern="#,###" /></th>
                                
                            </tr>    

                    </table>
                
            </c:if>


            <c:if test="${empty results}">
                <!--<h3 style="margin-left: 50px"><li>Không có dữ liệu</li></h3>-->
            </c:if>        
        </div>      
        

        <div class="container" id="formOverlay">
            <div class="edit-form">
                <h1>Thống Kê Doanh Thu Dạng Biểu Đồ</h1>
                
                <form action="./xuatbieudo" method="GET" style="margin-left: 50px; margin-bottom: 30px">
                    <label style="font-size: 20px" for="year">Chọn năm:</label>
                    <select style="font-size: 20px" name="year" id="year">
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
                        <option value="2025">2025</option>
                        <!-- Thêm các năm khác nếu cần -->
                    </select>
                    <input type="submit" class="btn btn-primary" value="Xuất biểu đồ">
                </form>
                <c:if test="${not empty revenueData}">
                <h2 style="margin-left: 480px; color: green">Biểu đồ doanh thu năm ${year} </h2>    
                <canvas id="revenueChart" width="400" height="200"></canvas>
                </c:if>


                <c:if test="${empty revenueData}">
                    <!--<h3 style="margin-left: 50px"><li>Không có dữ liệu</li></h3>-->
                </c:if>  
            </div>
        </div>        
 
        <script>
            // Parse the JSON data passed from the Servlet
            var revenueData = JSON.parse('${revenueData}');  // Dữ liệu doanh thu từ Servlet (JSON)
            console.log(revenueData);  // Kiểm tra dữ liệu trong console

            if (revenueData && revenueData.length > 0) {
                // Tạo danh sách tháng từ dữ liệu doanh thu
                var months = revenueData.map(function(data) {
                    return "Tháng " + data.month;  // Chuyển đổi số tháng thành dạng "Tháng 1", "Tháng 2", ...
                });

                // Tạo danh sách doanh thu từ đối tượng revenueData
                var revenue = revenueData.map(function(data) {
                    return data.tong;  // Lấy giá trị tổng doanh thu của từng tháng
                });

                // Khởi tạo biểu đồ với Chart.js (biểu đồ cột)
                var ctx = document.getElementById('revenueChart').getContext('2d');
                var chart = new Chart(ctx, {
                    type: 'bar',  // Kiểu biểu đồ là cột
                    data: {
                        labels: months,  // Các nhãn của biểu đồ, ở đây là danh sách tháng
                        datasets: [{
                            label: 'Doanh thu (VNĐ)',
                            data: revenue,  // Dữ liệu doanh thu của các tháng
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',  // Màu nền của cột
                            borderColor: 'rgba(75, 192, 192, 1)',  // Màu viền của cột
                            borderWidth: 1  // Độ dày của viền cột
                        }]
                    },
                    options: {
                        responsive: true,  // Biểu đồ phản hồi với kích thước màn hình
                        plugins: {
                            datalabels: {
                                color: 'black',  // Màu chữ của giá trị trên cột
                                font: {
                                    weight: 'bold',  // Đặt chữ đậm
                                    size: 16  // Tăng kích thước chữ lên (ví dụ: 16px)
                                },
                                align: 'center',  // Căn chỉnh chữ vào giữa cột
                                anchor: 'end',  // Đặt chữ lên trên đầu cột
                                offset: 100,  // Giảm khoảng cách từ chữ tới đỉnh cột (đặt gần hơn)
                                display: true  // Đảm bảo giá trị luôn hiển thị
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true  // Đảm bảo trục y bắt đầu từ 0
                            }
                        }
                    },
                    plugins: [ChartDataLabels]  // Thêm plugin vào biểu đồ
                });
            } else {
                console.error("Dữ liệu không hợp lệ hoặc trống.");
            }
        </script>








        
    </body>
    <footer>
        <%@include file="inc/footer.jsp" %>
    </footer>

</html>
