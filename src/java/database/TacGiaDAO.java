package database;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.TacGia;

public class TacGiaDAO implements DAOInterface<TacGia> {

    private ArrayList<TacGia> data = new ArrayList<>();

    @Override
    public ArrayList<TacGia> selectAll() {
        ArrayList<TacGia> ketQua = new ArrayList<TacGia>();
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBC.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT * FROM tacgia";
            PreparedStatement st = con.prepareStatement(sql);

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                String maTacGia = rs.getString("matacgia");
                String hoVaTen = rs.getString("hovaten");
                Date ngaySinh = rs.getDate("ngaysinh");
                String tieuSu = rs.getString("tieusu");

                TacGia tg = new TacGia(maTacGia, hoVaTen, ngaySinh, tieuSu);
                ketQua.add(tg);
            }

            // Bước 5:
            JDBC.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    @Override
    public TacGia selectById(TacGia t) {
        TacGia ketQua = null;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBC.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT * FROM tacgia WHERE matacgia=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaTacGia());

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                String maTacGia = rs.getString("matacgia");
                String hoVaTen = rs.getString("hovaten");
                Date ngaySinh = rs.getDate("ngaysinh");
                String tieuSu = rs.getString("tieusu");

                ketQua = new TacGia(maTacGia, hoVaTen, ngaySinh, tieuSu);
                break;
            }
            // Bước 5:
            JDBC.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;

    }

    @Override
    public int insert(TacGia t) {
        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBC.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "INSERT INTO tacgia (matacgia, hovaten, ngaysinh, tieusu) "
                    + " VALUES (?,?,?,?)";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaTacGia());
            st.setString(2, t.getHoVaTen());
            st.setDate(3, t.getNgaySinh());
            st.setString(4, t.getTieuSu());

            // Bước 3: thực thi câu lệnh SQL
            ketQua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            // Bước 5:
            JDBC.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    @Override
    public int insertAll(ArrayList<TacGia> arr) {
        int dem = 0;
        for (TacGia tacGia : arr) {
            dem += this.insert(tacGia);
        }
        return dem;
    }

    @Override
    public int delete(TacGia t) {
        if (this.selectById(t) != null) {
            this.data.remove(t);
            return 1;
        }
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<TacGia> arr) {
        int dem = 0;
        for (TacGia tacGia : arr) {
            dem += this.delete(tacGia);
        }
        return dem;
    }

    @Override
    public int update(TacGia t) {
        if (this.selectById(t) != null) {
            this.data.remove(t);
            this.data.add(t);
            return 1;
        }
        return 0;
    }

    public static void main(String[] args) {
        TacGiaDAO tgd = new TacGiaDAO();
        ArrayList<TacGia> kq = tgd.selectAll();
        for (TacGia tacGia : kq) {
            System.out.println(tacGia.toString());
        }

        System.out.println("");

        TacGia tg = tgd.selectById(new TacGia("TGI", "", null, ""));
        System.out.println(tg);
        
        System.out.println("");
        TacGia th_new = new TacGia("TG10", "David", new Date(2000-1900, 10, 15), "");
        tgd.insert(th_new);
    }
}
