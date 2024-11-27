
package model;


public class giohang extends sanpham{
    private int magh;
    private String tentk;
    private String tensp;
    private long gia;
    private int soluongsp;
    
    public giohang(){
        
    }

    public giohang(int magh, String tentk, String tensp, long gia, int soluongsp) {
        this.magh = magh;
        this.tentk = tentk;
        this.tensp = tensp;
        this.gia = gia;
        this.soluongsp = soluongsp;
    }
    
    public giohang(int soluongsp) {
        this.soluongsp = soluongsp;
    }

    public int getSoluongsp() {
        return soluongsp;
    }

    public void setSoluongsp(int soluongsp) {
        this.soluongsp = soluongsp;
    }

    public int getMagh() {
        return magh;
    }

    public void setMagh(int magh) {
        this.magh = magh;
    }

    public String getTentk() {
        return tentk;
    }

    public void setTentk(String tentk) {
        this.tentk = tentk;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }

    public long getGia() {
        return gia;
    }

    public void setGia(long gia) {
        this.gia = gia;
    }

    
    
}
