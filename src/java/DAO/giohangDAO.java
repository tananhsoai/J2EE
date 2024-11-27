package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.giohang;
import model.giohang;
import model.giohangsql;

public class giohangDAO {

    public static giohangDAO getInstance() {
        return new giohangDAO();
    }

    public List<giohangsql> getAllGioHang(String ten) {
        List<giohangsql> ds_giohang = new ArrayList<giohangsql>();
        Connection conn = JDBCConnection.getConnection();

        String sql = "Select * from giohang WHERE tentk =?";

        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, ten);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                giohangsql ghsql = new giohangsql(rs.getString(2),
                        rs.getString(3), rs.getInt(4), rs.getInt(5));
                ds_giohang.add(ghsql);
            }
        } catch (SQLException ex) {
            Logger.getLogger(giohangDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        JDBCConnection.closeConnection(conn);
        return ds_giohang;

    }

    public void themGioHang(giohangsql t) {

        try {
            Connection conn = JDBCConnection.getConnection();

            String sql = "INSERT INTO `giohang` (`magh`, `tentk`, `tensp`, `gia`, `soluong`) VALUES (NULL, ?, ?, ?, ?)";

            PreparedStatement pst = conn.prepareStatement(sql);

            pst.setString(1, t.getTentk());
            pst.setString(2, t.getTensp());
            pst.setLong(3, t.getGia());
            pst.setInt(4, t.getSoluong());
            int rs = pst.executeUpdate();
            JDBCConnection.closeConnection(conn);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

//    public void suaGioHang(giohang t) {
//
//        try {
//            Connection conn = JDBCConnection.getConnection();
//            String sql = "UPDATE `giohang` SET `tentk` = ?, `tensp` = ?, `gia` = ?, `soluong` = ? WHERE `giohang`.`magh` = ?";
//            PreparedStatement pst = conn.prepareStatement(sql);
//            pst.setString(1, t.getTensp());
//            pst.setLong(3, t.getGia());
//            pst.setString(2, t.getTensp());
//            pst.setInt(4, t.getSoluongsp());
//            pst.setInt(5, t.getMagh());
//
//            int rs = pst.executeUpdate();
//            JDBCConnection.closeConnection(conn);
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }

//    }
    public void xoaGioHang(int magh) {
        int result = 0;
        try {
            Connection con = (Connection) JDBCConnection.getConnection();
            String sql = "DELETE FROM giohang WHERE `giohang`.`magh` = ?";
            PreparedStatement pst = (PreparedStatement) con.prepareStatement(sql);
            pst.setInt(1, magh);
            result = pst.executeUpdate();
            JDBCConnection.closeConnection(con);
        } catch (SQLException ex) {
            Logger.getLogger(giohang.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
