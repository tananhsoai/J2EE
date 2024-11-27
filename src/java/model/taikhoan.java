
package model;


public class taikhoan {
    private String tentk, matkhau, quyen, hoten, diachi, sdt;
    private int trangthai;
    
    public taikhoan(){
         
    }

    public taikhoan(String tentk, String matkhau, String quyen, String hoten, String diachi, String sdt, int trangthai) {
        this.tentk = tentk;
        this.matkhau = matkhau;
        this.quyen = quyen;
        this.hoten = hoten;
        this.diachi = diachi;
        this.sdt = sdt;
        this.trangthai = trangthai;
    }

    public String getTentk() {
        return tentk;
    }

    public void setTentk(String tentk) {
        this.tentk = tentk;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }

    public String getQuyen() {
        return quyen;
    }

    public void setQuyen(String quyen) {
        this.quyen = quyen;
    }

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public int getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(int trangthai) {
        this.trangthai = trangthai;
    }

    @Override
    public String toString() {
        return "taikhoan{" + "tentk=" + tentk + ", matkhau=" + matkhau + ", quyen=" + quyen + ", hoten=" + hoten + ", diachi=" + diachi + ", sdt=" + sdt + ", trangthai=" + trangthai + '}';
    }
}
