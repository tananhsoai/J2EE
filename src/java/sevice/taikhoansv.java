
package sevice;

import DAO.taikhoanDAO;
import java.util.List;
import model.taikhoan;


public class taikhoansv {
    private taikhoanDAO tkDao;
    
    public taikhoansv(){
        tkDao = new taikhoanDAO();
    }
    
    public List<taikhoan> getAllTaiKhoan(){
        return tkDao.getAllTaiKhoan();
    }
    
    public void themTaiKhoan (taikhoan tk){
        tkDao.themTaiKhoan(tk);
    }
    
    public taikhoan timTK (String tentk){
        return tkDao.timTK(tentk);
    }
    
    public void suaTaikhoan(taikhoan tk) {
        tkDao.suaTaikhoan(tk);
    }
    public void xoatk(String Tentk) {
        tkDao.xoatk(Tentk);
    }
    public List<taikhoan> taikhoannv() {
       return tkDao.taikhoannv();
   }
    public void suaTaikhoanNV(taikhoan tk) {
        tkDao.suaTaikhoanNV(tk);
    }
}
