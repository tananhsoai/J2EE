/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package funtion;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.sanpham;
import sevice.sanphamsv;
@WebServlet(name = "themspvaokho", urlPatterns = {"/themspvaokho"})
/**
 *
 * @author ASUS
 */
public class themspvaokho extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            sanpham t = new sanpham();
            sanphamsv spsv = new sanphamsv();
            String tensp = request.getParameter("tensp");
            String ram = request.getParameter("ram");
            int rami = Integer.parseInt(ram);
            String rom = request.getParameter("rom");
            int romi = Integer.parseInt(rom);
            String pin = request.getParameter("pin");
            int pini = Integer.parseInt(pin);
            String manhinh = request.getParameter("manhinh");
            double man = Double.parseDouble(manhinh);
            String hinhanh = request.getParameter("hinhanh");
            String gia = request.getParameter("gia");
            long giaban = Long.parseLong(gia);
            
            t.setTensp(tensp);
            t.setRam(rami);
            t.setRom(romi);
            t.setPin(pini);
            t.setManhinh(man);
            t.setAnh(hinhanh);
            t.setGia(giaban);
            
            spsv.themSanPham(t);
            //response.getWriter().println("<script type=\"text/javascript\">alert('Đã thêm sản phẩm!');</script>");
            HttpSession session = request.getSession();
            session.setAttribute("message", "Đã thêm sản phẩm thành công!");
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
