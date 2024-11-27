package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;

public class lichsugdDAO {

    public static lichsugdDAO getInstance() {
        return new lichsugdDAO();
    }

    public boolean themLS(lichsugd ls) {
        boolean result = false;
        Connection conn = JDBCConnection.getConnection();
        String sql = "INSERT INTO `lichsugd` (`mals`, `tentk`, `masp`, `soluong`, `ngay`,`gia`, `trangthai`) VALUES (NULL, ?, ?,?, ?, ?, '0')";
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, ls.getTentk());
            pst.setInt(2, ls.getMasp());
            pst.setInt(3, ls.getSoluong());
            pst.setString(4, ls.getDate());
            pst.setLong(5, ls.getGia());
            pst.executeUpdate();
            result = true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
    
    public List<lichsugd> getAllLSGD(){
        List<lichsugd> kq = new ArrayList<lichsugd>();
        Connection conn = JDBCConnection.getConnection();
        String sql = "SELECT * FROM `lichsugd` ORDER BY trangthai";
        
        try {
            PreparedStatement kn = conn.prepareStatement(sql);
            ResultSet rs = kn.executeQuery();
            while(rs.next()){
                lichsugd num = new lichsugd();
                num.setMals(rs.getInt("mals"));
                num.setTentk(rs.getString("tentk"));
                num.setMasp(rs.getInt("masp"));
                num.setSoluong(rs.getInt("soluong"));
                num.setDate(rs.getString("ngay"));
                num.setGia(rs.getLong("gia"));
                num.setTrangthai(rs.getInt("trangthai"));
                kq.add(num);
            }
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        
        return kq;
    }
    
    public int MaSP(int mls){
        Connection conn = JDBCConnection.getConnection();
        String sql = "SELECT * FROM `lichsugd` WHERE mals = ?";
        int kq = 0;
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, mls);
            ResultSet rs = pst.executeQuery();
            kq = rs.getInt("masp");
        } catch (Exception e) {
        }
        
        return kq;
    }
    
    public List<lichsugd> getLSGD(String ten) {
        Connection conn = JDBCConnection.getConnection();
        List<lichsugd> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM `lichsugd` WHERE `tentk` = ? ORDER BY trangthai";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, ten);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                lichsugd ls = new lichsugd();
                ls.setMals(rs.getInt("mals"));
                ls.setDate(rs.getString("ngay"));
                ls.setMasp(rs.getInt("masp"));
                ls.setSoluong(rs.getInt("soluong"));
                ls.setGia(rs.getLong("gia"));
                ls.setTrangthai(rs.getInt("trangthai"));
                list.add(ls);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void xoaLS(int ma) {
        boolean result = false;
        Connection conn = JDBCConnection.getConnection();
        String sql = "DELETE FROM `lichsugd` WHERE `mals` = ?";
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, ma);
            pst.executeUpdate();
            result = true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
//    public static lichsugd timLS(int ma) {
//        lichsugd ls = new lichsugd();
//        Connection conn = JDBCConnection.getConnection();
//        String sql = "SELECT * FROM `lichsugd` WHERE `mals`=?)";
//        try {
//            PreparedStatement pst = conn.prepareStatement(sql);
//            ResultSet rs = pst.executeQuery();
//            if (rs.next()) {
//                ls.setMals(rs.getInt("mals"));
//                ls.setDate(rs.getString("ngay"));
//                ls.setMasp(rs.getInt("masp"));
//                ls.setSoluong(rs.getInt("soluong"));
//                ls.setGia(rs.getLong("gia"));
//                ls.setTrangthai(rs.getInt("trangthai"));
//            }
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//        }
//        return ls;
//    }
    
    public static void suaTTLS(int ma) {
        Connection conn = JDBCConnection.getConnection();
        String sql = "UPDATE `lichsugd` SET `trangthai` = '2' WHERE `lichsugd`.`mals` = ?";
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, ma);
            pst.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public static void xacnhan(int ma) {
        Connection conn = JDBCConnection.getConnection();
        String sql = "UPDATE `lichsugd` SET `trangthai` = '1' WHERE `lichsugd`.`mals` = ?";
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, ma);
            pst.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public static void huyxacnhan(int ma) {
        Connection conn = JDBCConnection.getConnection();
        String sql = "UPDATE `lichsugd` SET `trangthai` = '0' WHERE `lichsugd`.`mals` = ?";
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, ma);
            pst.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public List<thongke> thongke(String nam, String thang) {
        Connection conn = JDBCConnection.getConnection();
        List<thongke> list = new ArrayList<>();
        try {
            String sql = "SELECT t.hoten, s.tensp, l.soluong, l.soluong*s.gia AS tongtien\n" +
"                        FROM lichsugd l \n" +
"                        JOIN sanpham s on l.masp = s.masp\n" +
"                        JOIN taikhoan t on l.tentk = t.tentk\n" +
"                        WHERE SUBSTRING(ngay, 1, 7) = ? and l.trangthai = 2";
            String str = nam;
            str +="-";
            str+=thang;
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, str);
//            pst.setString(2, thang);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                thongke tk = new thongke();
                tk.setHoten(rs.getString("hoten"));
                tk.setTensp(rs.getString("tensp"));
                tk.setSoluong(rs.getInt("soluong"));
                tk.setTongtien(rs.getString("tongtien"));
                list.add(tk);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }
    public List<bieudo> bieudo(String nam) {
        Connection conn = JDBCConnection.getConnection();
        List<bieudo> list = new ArrayList<>();
        try {
            String sql = "SELECT\n" +
                        "    MONTH(ngay) AS thang,\n" +
                        "    SUM(gia * soluong) AS doanhthu\n" +
                        "FROM\n" +
                        "    lichsugd\n" +
                        "WHERE\n" +
                        "    trangthai = 2 and YEAR(ngay)=?\n" +
                        "GROUP BY\n" +
                        "    MONTH(ngay);";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, nam);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                bieudo bd = new bieudo();
                bd.setMonth(rs.getInt("thang"));
                bd.setTong(rs.getDouble("doanhthu"));
                list.add(bd);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }
}
