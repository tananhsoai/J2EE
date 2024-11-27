package funtion;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.taikhoan;
import sevice.taikhoansv;

public class kiemtradn extends HttpServlet {

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String tentkdn = request.getParameter("username");
            String mk = request.getParameter("password");
            taikhoansv tksv = new taikhoansv();
            List<taikhoan> ds_taikhoan = new ArrayList<taikhoan>();
            ds_taikhoan = tksv.getAllTaiKhoan();
            String errorMessage = "";
            taikhoan tk = new taikhoan();
            tk = tksv.timTK(tentkdn);
            int quyen = 0;
            for (taikhoan tk1 : ds_taikhoan) {
                if (tentkdn.equals(tk1.getTentk())) {
                    if (mk.equals(tk1.getMatkhau())) {
                        if (tk1.getTrangthai() != 0) {
                            errorMessage = "";
                            if (tk.getQuyen().equals("khachhang")) {
                                break;
                            } else if (tk.getQuyen().equals("nhanvien")) {
                                quyen = 1;
                                break;
                            } else {
                                quyen = 2;
                                break;
                            }
                        } else {
                            errorMessage = "Tài khoản bị khóa.";
                            break;
                        }
                    } else {
                        errorMessage = "Mật khẩu không đúng.";
                        break;
                    }
                } else {
                    errorMessage = "Tên tài khoản không tồn tại.";
                }
            }
            if (!errorMessage.isEmpty()) {
                // Store form data in request attributes
                request.setAttribute("tentk", tentkdn);
                request.setAttribute("mktk", mk);
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
            } else {
                HttpSession ss = request.getSession();
                ss.setMaxInactiveInterval(10000);
                String kt = "";
                try {
                    InetAddress ip = InetAddress.getLocalHost();
                    kt = ip.getHostAddress();
                } catch (UnknownHostException ex) {
                    kt = "Không thể xác định địa chỉ IP";
                }
                Date loginTime = new Date();
                ss.setAttribute("taikhoan", tk);
                ss.setAttribute("loginTime", loginTime);
                ss.setAttribute("ip", kt);
                if(quyen == 0){
                    int n = (int) ss.getAttribute("kiemtradn");
                    if(n == 1){
                        response.sendRedirect("lichsugd.jsp");
                    }else if(n == 2){
                        response.sendRedirect("giohang.jsp");
                    }else{
                        response.sendRedirect("index.jsp");
                    }
                }else if(quyen == 1){
                    response.sendRedirect("donhang.jsp");
                }else{
                    response.sendRedirect("root_index.jsp");
                }
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
