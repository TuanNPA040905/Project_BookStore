/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.util.ArrayList;
import model.KhachHang;

/**
 *
 * @author Admin
 */
public class KhachHangDAO {

    private ArrayList<KhachHang> data = new ArrayList<KhachHang>();

    private ArrayList<KhachHang> selectAll() {
        return data;
    }

    public KhachHang selectByID(String id) {
        for (KhachHang khachHang : data) {
            if (khachHang.getMaKhachHang().equals(id)) {
                return khachHang;
            }
        }
        return null;
    }

    public int insert(KhachHang khachHang) {
        KhachHang kiemTraTonTai = this.selectByID(khachHang.getMaKhachHang());
        if (kiemTraTonTai == null) {
            data.add(khachHang);
            return 1;
        } else {
            return 0;
        }
    }

    public int insertAll(ArrayList<KhachHang> list) {
        int dem = 0;
        for (KhachHang khachHang : list) {
            dem += this.insert(khachHang);
        }
        return dem;
    }

    public int delete(KhachHang khachHang) {
        KhachHang kiemTraTonTai = this.selectByID(khachHang.getMaKhachHang());
        if (kiemTraTonTai != null) {
            data.remove(khachHang);
            return 1;
        } else {
            return 0;
        }
    }

    public int deleteAll(ArrayList<KhachHang> list) {
        int dem = 0;
        for (KhachHang khachHang : list) {
            KhachHang kiemTraTonTai = this.selectByID(khachHang.getMaKhachHang());
            if (kiemTraTonTai != null) {
                data.remove(khachHang);
                dem++;
            }
        }
        return dem;
    }

    public int update(KhachHang khachHang) {
        KhachHang kiemTraTonTai = this.selectByID(khachHang.getMaKhachHang());
        if (kiemTraTonTai != null) {
            data.remove(kiemTraTonTai);
            data.add(khachHang);
            return 1;
        } else {
            return 0;
        }
    }
}
