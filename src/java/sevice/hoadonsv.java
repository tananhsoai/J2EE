package sevice;

import model.HoaDon;
import DAO.hoadonDao;
import java.util.List;

public class hoadonsv {
    private hoadonDao hd_svDao;
    public hoadonsv(){
        hd_svDao = new hoadonDao();
    }
    
    public List<HoaDon> getallhd(){
        return hd_svDao.getALLHoaDon();
    }
    
    public boolean addHD(HoaDon a){
        return hd_svDao.themHD(a);
    }
    
    public void XoaHD(int id){
        hd_svDao.xoaHD(id);
    }
    
    public void XacNhanTT(int id){
    
        hd_svDao.xacnhanThanhToan(id);
    }
    
}
