package funtion;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.giohang;
import model.lichsugd;
import model.taikhoan;
import sevice.lichsugdsv;

public class muasp extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession ss = request.getSession();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            taikhoan tk = (taikhoan) ss.getAttribute("taikhoan");
            if (tk != null) {
                String masp = request.getParameter("id");
                String gia = request.getParameter("gia");
                int soluong = Integer.parseInt(request.getParameter("soluong"));

                if (soluong <= 0) {
                    soluong = 1;
                }
                lichsugd lsgd = new lichsugd();
                lsgd.setMasp(Integer.parseInt(masp));
                lsgd.setTentk(tk.getTentk());
                lsgd.setSoluong(soluong);
                lsgd.setGia(Integer.parseInt(gia));
                lsgd.setDate(formatter.format(date));
                
                
                lichsugdsv lssv = new lichsugdsv();
                boolean kq = lssv.themLS(lsgd);

                if (kq) {
                    
                    ArrayList<giohang> cart_list = (ArrayList<giohang>) ss.getAttribute("ds_gh");
                    if (cart_list != null) {
                        for (giohang c : cart_list) {
                            if (c.getMasp() == Integer.parseInt(masp)) {
                                cart_list.remove(cart_list.indexOf(c));
                                break;
                            }
                        }
                    }
                    response.sendRedirect("lichsugd.jsp");
                } else {
                    out.print("Sai");
                }

            } else {
                response.sendRedirect("dangnhap.jsp");
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
