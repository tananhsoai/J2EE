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
import java.time.LocalDate;
import model.HoaDon;
import sevice.hoadonsv;
import sevice.lichsugdsv;

public class xacnhan extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            lichsugdsv neW = new lichsugdsv();
            String Id = request.getParameter("id");

            LocalDate currentDate = LocalDate.now();
            String username = request.getParameter("username");
            int k = Integer.parseInt(Id);
            if (username == null) {
                System.out.println("Đăng nhập hết hạn");
                response.sendRedirect("dangnhap.jsp?message=Đăng nhập hết hạn");
            }
                hoadonsv hdsv = new hoadonsv();
                HoaDon a = new HoaDon();
                a.setMaHoaDon(0);
                a.setMalsgd(k);
                a.setManhanVien(username);
                a.setTrangthai(0);
                a.setNgaygiaoDich(String.valueOf(currentDate));
                hdsv.addHD(a);

                System.out.println(username);
                
                neW.xacnhan(k);
                System.out.println("succsess");
                response.sendRedirect("donhang.jsp");
            
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
