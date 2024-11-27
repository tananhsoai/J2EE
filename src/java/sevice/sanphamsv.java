
package sevice;

import DAO.*;
import java.util.ArrayList;
import java.util.List;
import model.*;


public class sanphamsv {
    private sanphamDAO spDao;
    
    public sanphamsv(){
        spDao = new sanphamDAO();
    }
    
    public List<sanpham> getAllSanPham(){
        return spDao.getAllSanPham();
    }
    
    public List<giohang> getGioHang(ArrayList<giohang> ds_gh){
        return spDao.getGioHang(ds_gh);
    }
    
    public long getTongGiaGH(ArrayList<giohang> ds_gh) {
        return spDao.getTongGiaGH(ds_gh);
    }
    
    public String getTenSp(int ma) {
        return spDao.getTenSp(ma);
    }
    
    public sanpham timSP(int ma) {
        return spDao.timSP(ma);
    }
    public void themSanPham(sanpham t) {
        spDao.themSanPham(t);
    }
    public void xoaSanPham(int masp){
        spDao.xoaSanPham(masp);
    }
    public void suaSanPham(sanpham t) {
        spDao.suaSanPham(t);
    }
}
