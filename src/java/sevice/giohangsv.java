
package sevice;

import DAO.giohangDAO;
import java.util.List;
import model.giohang;
import model.giohangsql;


public class giohangsv {
    private giohangDAO ghDao;
    
    public giohangsv(){
        ghDao = new giohangDAO();
    }
    
    public List<giohangsql> getAllGioHang(String ten) {
        return ghDao.getAllGioHang(ten);
    }
    
    public void themGioHang(giohangsql t) {
        ghDao.themGioHang(t);
    }
    
    
    public void xoaGioHang(int magh) {
        ghDao.xoaGioHang(magh);
    }
}
