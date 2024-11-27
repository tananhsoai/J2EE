package model;

public class lichsugd extends sanpham {
    private int mals;
    private String tentk;
    private int soluong;
    private String Date;
    private long gia;
    private int trangthai;

    public lichsugd() {
    }

    public lichsugd(int mals, String tentk, int soluong, String Date, long gia, int trangthai) {
        this.mals = mals;
        this.tentk = tentk;
        this.soluong = soluong;
        this.Date = Date;
        this.gia = gia;
        this.trangthai = trangthai;
    }

    public int getMals() {
        return mals;
    }

    public void setMals(int mals) {
        this.mals = mals;
    }

    public String getTentk() {
        return tentk;
    }

    public void setTentk(String tentk) {
        this.tentk = tentk;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public long getGia() {
        return gia;
    }

    public void setGia(long gia) {
        this.gia = gia;
    }

    public int getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(int trangthai) {
        this.trangthai = trangthai;
    }

    

    

}
