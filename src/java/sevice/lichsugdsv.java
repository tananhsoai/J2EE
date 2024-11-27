
package sevice;

import DAO.lichsugdDAO;
import java.util.List;
import model.bieudo;
import model.lichsugd;
import model.thongke;


public class lichsugdsv {
    private lichsugdDAO lsDao;
    
    public lichsugdsv(){
        lsDao = new lichsugdDAO();
    }
    
    public int masp(int masp){
        return lsDao.MaSP(masp);
    }
    
    public boolean themLS(lichsugd ls) {
        return lsDao.themLS(ls);
    }
    
    public List<lichsugd> getLSGD(String ten) {
        return lsDao.getLSGD(ten);
    }
    
    public void xoaLS(int ma) {
        lsDao.xoaLS(ma);
    }
    
    public void xacnhan(int ma){
        lsDao.xacnhan(ma);
    }
    
    public void huyxacnhan(int ma){
        lsDao.huyxacnhan(ma);
    }
    
    public void suaTTLS(int ma) {
        lsDao.suaTTLS(ma);
    }
    public List<thongke> thongke(String nam, String thang){
        return lsDao.thongke(nam, thang);
    }
    public List<bieudo> bieudo(String nam) {
        return lsDao.bieudo(nam);
    }
    
    public List<lichsugd> getallls(){
        return lsDao.getAllLSGD();
    }
}
