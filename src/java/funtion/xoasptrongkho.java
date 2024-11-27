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
import model.*;
import DAO.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import sevice.lichsugdsv;
import sevice.sanphamsv;
@WebServlet(name = "xoasptrongkho", urlPatterns = {"/xoasptrongkho"})
/**
 *
 * @author ASUS
 */
public class xoasptrongkho extends HttpServlet {

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

            String idsp = request.getParameter("id");
            int masp = Integer.parseInt(idsp);
            HttpSession session = request.getSession();
            sanphamsv spsv = new sanphamsv();
            lichsugdsv lssv = new lichsugdsv();
            List<lichsugd> ds_ls = lssv.getallls();
            for(lichsugd l : ds_ls){
                if(l.getMasp() == masp){
                    session.setAttribute("message", "Sản phẩm đã được bán không thể xóa");
                    out.print("fahwjfafbwaf");
                    response.sendRedirect("root_index.jsp");
                    return;
                }
                
            }
            spsv.xoaSanPham(masp);
            session.setAttribute("message", "Đã xóa sản phẩm thành công!");
            response.sendRedirect("root_index.jsp");
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
