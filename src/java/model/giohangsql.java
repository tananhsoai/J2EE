
package model;


public class giohangsql {
    private int magh;
    private String tentk, tensp;
    private long gia;
    private int soluong;

    public giohangsql() {
    }

    public giohangsql(String tentk, String tensp, long gia, int soluong) {
        this.tentk = tentk;
        this.tensp = tensp;
        this.gia = gia;
        this.soluong = soluong;
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

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    @Override
    public String toString() {
        return "giohangsql{" + "magh=" + magh + ", tentk=" + tentk + ", tensp=" + tensp + ", gia=" + gia + ", soluong=" + soluong + '}';
    }
    
    
    
}
