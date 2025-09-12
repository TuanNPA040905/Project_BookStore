/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.util.ArrayList;
import model.TacGia;

/**
 *
 * @author Admin
 */
public class TacGiaDAO {

    private ArrayList<TacGia> data = new ArrayList<TacGia>();

    private ArrayList<TacGia> selectAll() {
        return data;
    }

    public TacGia selectByID(String ms) {
        TacGia result = null;
        for (int i = 0; i < data.size(); i++) {
            if (data.get(i).getMaTacGia().equals(ms)) {
                result = data.get(i);
            }
        }
        return result;
    }

    public int insert(TacGia tg) {
        if (selectByID(tg.getMaTacGia()) == null) {
            data.add(tg);
            return 1;
        } else {
            return 0;
        }
    }

    public int insertAll(ArrayList<TacGia> list) {
        int dem = 0;
        for (TacGia tacGia : list) {
            dem += this.insert(tacGia);
        }
        return dem;
    }

    public int delete(TacGia tg) {
        TacGia kiemTraTonTai = this.selectByID(tg.getMaTacGia());
        if (kiemTraTonTai == null) {
            data.remove(tg);
            return 1;
        } else {
            return 0;
        }
    }
    
    public int deleteAll() {
        if(data.isEmpty()) return 0;
        for (int i = data.size() - 1; i >= 0; i--) {
            data.remove(data.get(i));
        }
        return 1;
    }
    
    public int update(TacGia tg) {
        TacGia kiemTraTonTai = this.selectByID(tg.getMaTacGia());
        if (kiemTraTonTai == null) {
            data.remove(kiemTraTonTai);
            data.add(tg);
            return 1;
        } else {
            return 0;
        }
    }
}
