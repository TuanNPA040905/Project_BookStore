/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.util.Objects;

/**
 *
 * @author Admin
 */
public class TacGia {
    private String maTacGia;
    private String tenTacGia;
    private Date ngaySinh;
    private String tieuSu;

    public TacGia() {
    }

    public TacGia(String maTacGia, String tenTacGia, Date ngaySinh, String tieuSu) {
        this.maTacGia = maTacGia;
        this.tenTacGia = tenTacGia;
        this.ngaySinh = ngaySinh;
        this.tieuSu = tieuSu;
    }

    public String getMaTacGia() {
        return maTacGia;
    }

    public void setMaTacGia(String maTacGia) {
        this.maTacGia = maTacGia;
    }

    public String getTenTacGia() {
        return tenTacGia;
    }

    public void setTenTacGia(String tenTacGia) {
        this.tenTacGia = tenTacGia;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getTieuSu() {
        return tieuSu;
    }

    public void setTieuSu(String tieuSu) {
        this.tieuSu = tieuSu;
    }


    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final TacGia other = (TacGia) obj;
        if (!Objects.equals(this.maTacGia, other.maTacGia)) {
            return false;
        }
        if (!Objects.equals(this.tenTacGia, other.tenTacGia)) {
            return false;
        }
        if (!Objects.equals(this.tieuSu, other.tieuSu)) {
            return false;
        }
        return Objects.equals(this.ngaySinh, other.ngaySinh);
    }
    
    
}
