import sevice.*;
import model.*;
import DAO.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
public class test {
    public static void main(String[] args) {
        int idls = 21;
        lichsugdsv sv_lsgd = new lichsugdsv();
        List<lichsugd> l_gd = new ArrayList<lichsugd>();
        lichsugd kq = new lichsugd();
        int idsp= 0;
        String name = new String();
        int tt = 0, masp = 0;
        for(lichsugd a : sv_lsgd.getallls()){
            if(idls == a.getMals()){
                kq = new lichsugd(a.getMals(), a.getTentk(), a.getSoluong(), a.getDate(), a.getGia(), a.getTrangthai());
                name = new String(a.getTentk());
                tt = a.getTrangthai();
            }
        }
        
        for(lichsugd a : sv_lsgd.getLSGD(name)){
            if(a.getTrangthai() == tt){
                masp = a.getMasp();
            }
        }
        
        sanphamsv sv_sp = new sanphamsv();
        
        System.out.println(name);
        System.out.println(tt);
        System.out.println(kq.getDate());
        System.out.println(sv_sp.timSP(masp).getTensp());
        System.out.println(sv_sp.timSP(masp).getGia());
    }
}
