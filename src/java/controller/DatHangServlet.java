/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.DonHangDAO;
import database.KhachHangDAO;
import database.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ChiTietDonHang;
import model.DonHang;
import model.KhachHang;
import model.SanPham;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DatHangServlet", urlPatterns = {"/dat-hang"})
public class DatHangServlet extends HttpServlet {

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
            out.println("<title>Servlet DatHangServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DatHangServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");

        if (khachHang == null) {
            response.sendRedirect("dangnhap.jsp");
            return;
        }

        try {
            String diaChiGiaoHang = request.getParameter("diaChi");
            String[] maSanPhams = request.getParameterValues("maSanPham");
            String[] soLuongs = request.getParameterValues("soLuong");

            if (maSanPhams == null || soLuongs == null) {
                request.setAttribute("error", "Không có sản phẩm để đặt hàng");
                request.getRequestDispatcher("gio-hang.jsp").forward(request, response);
                return;
            }

            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            List<ChiTietDonHang> chiTiet = new ArrayList<>();
            double tongTien = 0;

            for (int i = 0; i < maSanPhams.length; i++) {
                String maSanPham = maSanPhams[i];
                int soLuong = Integer.parseInt(soLuongs[i]);

                SanPham sanPham = sanPhamDAO.selectById(maSanPham);
                if (sanPham != null) {
                    ChiTietDonHang ct = new ChiTietDonHang();
                    ct.setMaSanPham(maSanPham);
                    ct.setSoLuong(soLuong);
                    ct.setGia(sanPham.getGiaBan());
                    chiTiet.add(ct);

                    tongTien += sanPham.getGiaBan() * soLuong;
                }
            }

            DonHang donHang = new DonHang(khachHang.getMaKhachHang(), tongTien, diaChiGiaoHang);
            DonHangDAO donHangDAO = new DonHangDAO();

            boolean success = donHangDAO.createOrder(donHang, chiTiet);

            if (success) {
                // Xóa giỏ hàng sau khi đặt hàng thành công
                session.removeAttribute("gioHang");
                response.sendRedirect("thanhcong.jsp?type=datHang");
            } else {
                request.setAttribute("error", "Đặt hàng thất bại. Vui lòng thử lại!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
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
