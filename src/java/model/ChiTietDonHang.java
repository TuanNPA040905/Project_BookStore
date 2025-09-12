/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class ChiTietDonHang {
    private String maChiTietDonHang;
    private DonHang donHang;
    private SanPham sanPham;
    private int soLuong;
    private double giaBia;
    private double giamGia;
    private double giaBan;
    private double VAT;
    private double tongThanhTien;

    public ChiTietDonHang() {
    }

    public ChiTietDonHang(String maChiTietDonHang, DonHang donHang, SanPham sanPham, int soLuong, double giaBia, double giamGia, double giaBan, double VAT, double tongThanhTien) {
        this.maChiTietDonHang = maChiTietDonHang;
        this.donHang = donHang;
        this.sanPham = sanPham;
        this.soLuong = soLuong;
        this.giaBia = giaBia;
        this.giamGia = giamGia;
        this.giaBan = giaBan;
        this.VAT = VAT;
        this.tongThanhTien = tongThanhTien;
    }

    public String getMaChiTietDonHang() {
        return maChiTietDonHang;
    }

    public void setMaChiTietDonHang(String maChiTietDonHang) {
        this.maChiTietDonHang = maChiTietDonHang;
    }

    public DonHang getDonHang() {
        return donHang;
    }

    public void setDonHang(DonHang donHang) {
        this.donHang = donHang;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public double getGiaBia() {
        return giaBia;
    }

    public void setGiaBia(double giaBia) {
        this.giaBia = giaBia;
    }

    public double getGiamGia() {
        return giamGia;
    }

    public void setGiamGia(double giamGia) {
        this.giamGia = giamGia;
    }

    public double getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(double giaBan) {
        this.giaBan = giaBan;
    }

    public double getVAT() {
        return VAT;
    }

    public void setVAT(double VAT) {
        this.VAT = VAT;
    }

    public double getTongThanhTien() {
        return tongThanhTien;
    }

    public void setTongThanhTien(double tongThanhTien) {
        this.tongThanhTien = tongThanhTien;
    }
    
    
}
