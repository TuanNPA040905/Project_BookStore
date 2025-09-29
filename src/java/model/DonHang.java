package model;

import java.util.Date;
import java.util.List;

public class DonHang {
    private int maDonHang;
    private String maKhachHang;
    private Date ngayDatHang;
    private double tongTien;
    private String trangThai;
    private String diaChiGiaoHang;
    private List<ChiTietDonHang> chiTietDonHang;
    
    // Constructors
    public DonHang() {}
    
    public DonHang(String maKhachHang, double tongTien, String diaChiGiaoHang) {
        this.maKhachHang = maKhachHang;
        this.tongTien = tongTien;
        this.diaChiGiaoHang = diaChiGiaoHang;
        this.trangThai = "pending";
    }
    
    

    public int getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(int maDonHang) {
        this.maDonHang = maDonHang;
    }

    public String getMaKhachHang() {
        return maKhachHang;
    }

    public void setMaKhachHang(String maKhachHang) {
        this.maKhachHang = maKhachHang;
    }

    public Date getNgayDatHang() {
        return ngayDatHang;
    }

    public void setNgayDatHang(Date ngayDatHang) {
        this.ngayDatHang = ngayDatHang;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getDiaChiGiaoHang() {
        return diaChiGiaoHang;
    }

    public void setDiaChiGiaoHang(String diaChiGiaoHang) {
        this.diaChiGiaoHang = diaChiGiaoHang;
    }

    public List<ChiTietDonHang> getChiTietDonHang() {
        return chiTietDonHang;
    }

    public void setChiTietDonHang(List<ChiTietDonHang> chiTietDonHang) {
        this.chiTietDonHang = chiTietDonHang;
    }
}