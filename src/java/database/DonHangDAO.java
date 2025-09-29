package database;

import model.DonHang;
import model.ChiTietDonHang;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DonHangDAO implements DAOInterface<DonHang> {

    @Override
    public ArrayList<DonHang> selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public boolean createOrder(DonHang donHang, List<ChiTietDonHang> chiTiet) {
        Connection conn = null;
        try {
            conn = JDBC.getConnection();
            conn.setAutoCommit(false); // Bắt đầu transaction

            // 1. Thêm đơn hàng
            String sqlDonHang = "INSERT INTO DonHang (maKhachHang, tongTien, diaChiGiaoHang) VALUES (?, ?, ?)";
            PreparedStatement pstDonHang = conn.prepareStatement(sqlDonHang, Statement.RETURN_GENERATED_KEYS);
            pstDonHang.setString(1, donHang.getMaKhachHang());
            pstDonHang.setDouble(2, donHang.getTongTien());
            pstDonHang.setString(3, donHang.getDiaChiGiaoHang());

            int affectedRows = pstDonHang.executeUpdate();
            if (affectedRows == 0) {
                conn.rollback();
                return false;
            }

            // Lấy mã đơn hàng vừa tạo
            ResultSet rs = pstDonHang.getGeneratedKeys();
            int maDonHang = 0;
            if (rs.next()) {
                maDonHang = rs.getInt(1);
            }

            // 2. Thêm chi tiết đơn hàng
            String sqlChiTiet = "INSERT INTO ChiTietDonHang (maDonHang, maSanPham, soLuong, gia) VALUES (?, ?, ?, ?)";
            PreparedStatement pstChiTiet = conn.prepareStatement(sqlChiTiet);

            for (ChiTietDonHang ct : chiTiet) {
                pstChiTiet.setInt(1, maDonHang);
                pstChiTiet.setString(2, ct.getMaSanPham());
                pstChiTiet.setInt(3, ct.getSoLuong());
                pstChiTiet.setDouble(4, ct.getGia());
                pstChiTiet.addBatch();
            }

            pstChiTiet.executeBatch();
            conn.commit();
            return true;

        } catch (SQLException e) {
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (conn != null) {
                    conn.setAutoCommit(true);
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public DonHang selectById(DonHang t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insert(DonHang t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertAll(ArrayList<DonHang> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int delete(DonHang t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int deleteAll(ArrayList<DonHang> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int update(DonHang t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
