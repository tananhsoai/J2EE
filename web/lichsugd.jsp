
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" java.util.*, 
         java.text.SimpleDateFormat, 
         model.*, 
         sevice.*,
         java.text.DecimalFormat" %>
<%
               taikhoan tk = (taikhoan) session.getAttribute("taikhoan");
               if (tk == null){
                   response.sendRedirect("dangnhap.jsp");
               }else{
                   String username = tk.getTentk();
                   session.setAttribute("tentk", username);
               }
           
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="inc/head.jsp" %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/index.css">
        <title>Document</title>
    </head>

    <body>

        <header>
            <%@include file="inc/nav.jsp" %>
        </header>
        <div class="container">
            <div class="card-header my-3">All Orders</div>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Ngày</th>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Số lượng</th>
                        <th scope="col">Giá</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Hủy đơn hàng</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    lichsugdsv lssv = new lichsugdsv();
                    sanphamsv spsv = new sanphamsv();
                    String tentk = (String) session.getAttribute("tentk");
                    List<lichsugd> ds_ls = lssv.getLSGD(tentk);
                    
                    if(ds_ls != null){
                        for(lichsugd l : ds_ls){
                            DecimalFormat formatter = new DecimalFormat("#,###");
                            String t = spsv.getTenSp(l.getMasp());
                            String tt = "Đã xác nhận";
                            if(l.getTrangthai() == 0){
                                tt = "Chờ xác nhận";
                            }
                            if(l.getTrangthai() == 2){
                                tt = "Đã nhận hàng";
                            }
                        
                    %>
                    <tr>
                        <td><%= l.getDate()%></td>
                        <td><%= t%></td>
                        <td><%=l.getSoluong()%></td>
                        <td> <%=(l.getGia()>0)?formatter.format(l.getGia()):0%> VND</td>
                        <td><%= tt%></td>
                        <%    
                            if(l.getTrangthai() == 0){ 
                        %> 
                        <td><a class="btn btn-sm btn-danger" onclick="return confirm('Bạn có đồng ý hủy đơn hàng này không');" href="huydh?id=<%=l.getMals()%>">Hủy</a></td>
                        <%    
                            }if(l.getTrangthai() == 1){       
                        %> 
                        <td><a class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc đã nhận đơn hàng');" href="./ttdanhanhang?id=<%=l.getMals()%>">Đã nhận hàng</a></td>
                        <%   
                            }if(l.getTrangthai() == 2){
                        %> 
                        <td><a class="btn btn-sm" ></a></td>
                        <%   
                            }
                        %>
                    </tr>
                    <%   
                        }
                    }
                    %>

                </tbody>
            </table>
        </div>

    </body>

</html>
