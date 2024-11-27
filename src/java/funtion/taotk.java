package funtion;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.taikhoan;
import sevice.taikhoansv;

public class taotk extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");

            taikhoan tk = new taikhoan();
            taikhoansv tksv = new taikhoansv();
            String tentk = request.getParameter("dkusername");
            String mktk = request.getParameter("dkpassword");
            String dc = request.getParameter("diachi");
            String ht = request.getParameter("hoten");
            String quyen = "khachhang";
            String sdt = request.getParameter("sdt");

            tk.setTentk(tentk);
            tk.setMatkhau(mktk);
            tk.setDiachi(dc);
            tk.setHoten(ht);
            tk.setQuyen(quyen);
            tk.setTrangthai(1);
            tk.setSdt(sdt);

            //tao 1 danh sach chua tat ca tk
            List<taikhoan> ds_taikhoan = new ArrayList<taikhoan>();
            ds_taikhoan = tksv.getAllTaiKhoan();

            String errorMessage = "";
            for (taikhoan tksql : ds_taikhoan) {
                if (tk.getTentk().equals(tksql.getTentk())) {
                    errorMessage = "Tên tài khoản đã tồn tại.";
                    break;
                }
            }

            if (!errorMessage.isEmpty()) {
                // Store form data in request attributes
                request.setAttribute("tentk", tentk);
                request.setAttribute("mktk", mktk);
                request.setAttribute("dc", dc);
                request.setAttribute("ht", ht);
                request.setAttribute("sdt", sdt);
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("dangky.jsp").forward(request, response);
            } else {
                tksv.themTaiKhoan(tk);
                response.sendRedirect("dangnhap.jsp");
            }
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
