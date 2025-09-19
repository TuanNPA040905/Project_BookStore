/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import Util.MaHoa;
import database.KhachHangDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.KhachHang;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DoiMatKhau", urlPatterns = {"/doi-mat-khau"})
public class DoiMatKhau extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DoiMatKhau</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DoiMatKhau at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        RequestDispatcher rd = request.getRequestDispatcher("/doimatkhau.jsp");
        rd.forward(request, response);
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
        String matKhauHienTai = request.getParameter("matKhauHienTai") + "";
        String matKhauMoi = request.getParameter("matKhauMoi") + "";
        String matKhauMoiNhapLai = request.getParameter("matKhauMoiNhapLai") + "";

        String matKhauHienTai_SHA1 = MaHoa.toSHA1(matKhauHienTai);

        String baoLoi = "";
        String url = "/doimatkhau.jsp";

        //Kiểm tra mật khẩu cũ có giống hay không
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("khachHang");
        KhachHang khachHang = null;
        if (obj != null) {
            khachHang = (KhachHang) obj;
        }
        if (khachHang == null) {
            baoLoi = "Bạn chưa đăng nhập vào hệ thống!";
        } else if (!matKhauHienTai_SHA1.equals(khachHang.getMatKhau())) {
            baoLoi = "Mật khẩu hiện tại không chính xác! Vui lòng kiểm tra lại!";
        } else if (!matKhauMoi.equals(matKhauMoiNhapLai)) {
            baoLoi = "Mật khẩu nhập lại không khớp! Vui lòng kiểm tra lại!";
        } else {
            String matKhauMoi_SHA1 = MaHoa.toSHA1(matKhauMoi);
            if (matKhauMoi_SHA1.equals(khachHang.getMatKhau())) {
                baoLoi = "Mật khẩu mới không được trùng với mật khẩu cũ!";
            } else {

                khachHang.setMatKhau(matKhauMoi_SHA1);
                KhachHangDAO khd = new KhachHangDAO();
                if (khd.changePassword(khachHang)) {
                    baoLoi = "Thay đổi mật khẩu thành công!";
                    request.setAttribute("showHomeLink", true); // gắn cờ

                } else {
                    baoLoi = "Quá trình thay đổi mật khẩu không thành công!";
                }
            }
        }

        request.setAttribute("baoLoi", baoLoi);
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
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
