/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Util;

import java.security.MessageDigest;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author Admin
 */
public class MaHoa {

    //md5
    //SHA-1 thường được sử dụng  (Secure Hash Algorithms 1)
    public static String toSHA1(String str) {
        String salt = ".dsajdnasdasnodas;/!dnawosd"; //làm cho mật khẩu phức tạp lên
        String result = null;

        str = str + salt;

        try {
            byte[] dataBytes = str.getBytes("UTF-8");
            //Chuyển chuỗi str thành một mảng byte sử dụng mã hóa UTF-8
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            result = Base64.encodeBase64String(md.digest(dataBytes));
            //md.digest(dataBytes): Tính giá trị băm SHA-1 từ mảng byte dataBytes và trả về một mảng byte (20 byte trong trường hợp SHA-1).
            //Base64.encodeBase64String(...): Chuyển mảng byte này thành một chuỗi Base64 để dễ dàng lưu trữ hoặc truyền tải. Base64 là một phương thức mã hóa giúp biểu diễn dữ liệu nhị phân thành chuỗi ký tự ASCII.
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(toSHA1("tuan2005tx"));
    }
}
