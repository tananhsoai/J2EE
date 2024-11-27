package model;

public class thongke{

    private String hoten;
    private String tensp;
    private int soluong;
    private String tongtien;

    public thongke() {
    }

    public thongke(String hoten, String tensp, int soluong, String tongtien) {
        this.hoten = hoten;
        this.tensp = tensp;
        this.soluong = soluong;
        this.tongtien = tongtien;

    }

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public String getTongtien() {
        return tongtien;
    }

    public void setTongtien(String tongtien) {
        this.tongtien = tongtien;
    }

   

    @Override
    public String toString() {
        return "thongke{" + "hoten=" + hoten + ", tensp=" + tensp + ", soluong=" + soluong + ", tongtien=" + tongtien  + '}';
    }

    

}
