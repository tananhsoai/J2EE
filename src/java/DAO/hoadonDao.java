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

public class hoadonDao {

    public List<HoaDon> getALLHoaDon() {
        List<HoaDon> list = new ArrayList<HoaDon>();
        Connection conn = JDBCConnection.getConnection();
        String sql = "SELECT * FROM `hoadon`";

        try {
            PreparedStatement kn = conn.prepareStatement(sql);
            ResultSet rs = kn.executeQuery();
            while (rs.next()) {
                HoaDon a = new HoaDon();
                a.setMaHoaDon(rs.getInt("mahoadon"));
                a.setManhanVien(rs.getString("tknhanvien"));
                a.setMalsgd(rs.getInt("mals"));
                a.setNgaygiaoDich(rs.getString("ngaytao"));
                a.setTrangthai(rs.getInt("trangthai"));
                list.add(a);
            }
            conn.close();
        } catch (SQLException ex) {
                System.out.println(ex);
        }
        return list;
    }

    public boolean themHD(HoaDon ls) {
        boolean result = false;
        Connection conn = JDBCConnection.getConnection();
        String sql = "INSERT INTO `hoadon` (`mahoadon`, `tknhanvien`, `ngaytao`, `mals`,`trangthai`) VALUES (NULL, ?, ?, ?, 0)";
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, ls.getManhanVien());
            pst.setString(2, ls.getNgaygiaoDich());
            pst.setInt(3, ls.getMalsgd());
            pst.executeUpdate();
            result = true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
    
    public void xacnhanThanhToan(int id){
        Connection conn = JDBCConnection.getConnection();
        String sql = "UPDATE `hoadon` SET `trangthai` = '1' WHERE `hoadon`.`mahoadon` = ?;";
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            int result = pst.executeUpdate();
            JDBCConnection.closeConnection(conn);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
    }
    
    public void xoaHD(int id){
        Connection conn = JDBCConnection.getConnection(); 
        String sql = "DELETE FROM `hoadon` WHERE `hoadon`.`mahoadon` = ?";
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            int result = pst.executeUpdate();
            JDBCConnection.closeConnection(conn);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
    }
    
}
