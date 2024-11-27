/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package funtion;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.lichsugd;
import sevice.lichsugdsv;
import sevice.sanphamsv;

/**
 *
 * @author trand
 */
public class getInfo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id = request.getParameter("id");
        String info;
        
        int idlsq = Integer.parseInt(id);
        
        int idls = idlsq;
        lichsugdsv sv_lsgd = new lichsugdsv();
        List<lichsugd> l_gd = new ArrayList<lichsugd>();
        lichsugd kq = new lichsugd();
        int idsp= 0;
        String name = new String();
        int tt = 0, masp = 0;
        for(lichsugd a : sv_lsgd.getallls()){
            if(idls == a.getMals()){
                kq = new lichsugd(a.getMals(), a.getTentk(), a.getSoluong(), a.getDate(), a.getGia(), a.getTrangthai());
                name = new String(a.getTentk());
                tt = a.getTrangthai();
            }
        }
        
        for(lichsugd a : sv_lsgd.getLSGD(name)){
            if(a.getTrangthai() == tt){
                masp = a.getMasp();
            }
        }
        
        sanphamsv sv_sp = new sanphamsv();
        
        System.out.println(name);
        System.out.println(tt);
        System.out.println(kq.getDate());
        System.out.println(sv_sp.timSP(masp).getTensp());
        System.out.println(sv_sp.timSP(masp).getGia());
        String trangthai = new String();
        if(tt == 0){
            trangthai = "Chờ Xác Nhận";
        }else{
            trangthai = "Chờ Nhận Hàng";
        }
        
        String value = "Tên:"+name + "<br>Trạng Thái:" + trangthai + "<br>Ngày Chọn:" + kq.getDate()+ "<br>Tên sản phẩm:"+ sv_sp.timSP(masp).getTensp() +"<br>Giá SP:" + sv_sp.timSP(masp).getGia()+"VNĐ";
        
        response.setContentType("text/html");
        response.getWriter().write(String.valueOf(value));
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
//        String id = request.getParameter("id");
//        String info;
//        
//        // Xác định thông tin dựa trên ID
//        if ("1".equals(id)) {
//            info = "Thông tin cho ID 1.";
//        } else if ("2".equals(id)) {
//            info = "Thông tin cho ID 2.";
//        } else {
//            info = "ID không hợp lệ.";
//        }
//        
//        response.setContentType("text/html");
//        response.getWriter().write(info);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
