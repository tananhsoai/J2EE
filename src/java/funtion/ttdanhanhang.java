package funtion;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.HoaDon;
import model.taikhoan;
import sevice.hoadonsv;
import sevice.lichsugdsv;

@WebServlet(name = "ttdanhanhang", urlPatterns = {"/ttdanhanhang"})
public class ttdanhanhang extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession ss = request.getSession();
            taikhoan tk = (taikhoan) ss.getAttribute("taikhoan");
            if (tk != null) {
                int mals = Integer.parseInt(request.getParameter("id"));

                hoadonsv hdsv = new hoadonsv();
                List<HoaDon> lhd = hdsv.getallhd();
                for (HoaDon a : lhd) {
                    if (a.getMalsgd() == mals) {
                        hdsv.XacNhanTT(a.getMaHoaDon());
                        System.out.println("xóa thành công");
                    }
                }

                lichsugdsv lssv = new lichsugdsv();
                out.print(mals);
                lssv.suaTTLS(mals);
                response.sendRedirect("lichsugd.jsp");
            }
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
