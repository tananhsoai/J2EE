package model;

import java.util.Date;

public class DonHang {
    private int maDonHang;
    private String tk;
    private int TrangThai;
    private int IDHangHoa;
    private Long TongTienLong;
    private String NgayThemDate;

    public int getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(int maDonHang) {
        this.maDonHang = maDonHang;
    }

    public String getMaKhachHang() {
        return tk;
    }

    public void setMaKhachHang(String maKhachHang) {
        this.tk = maKhachHang;
    }

    public int getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(int TrangThai) {
        this.TrangThai = TrangThai;
    }

    public int getIDHangHoa() {
        return IDHangHoa;
    }

    public void setIDHangHoa(int IDHangHoa) {
        this.IDHangHoa = IDHangHoa;
    }

    public Long getTongTienLong() {
        return TongTienLong;
    }

    public void setTongTienLong(Long TongTienLong) {
        this.TongTienLong = TongTienLong;
    }

    public String getNgayThemDate() {
        return NgayThemDate;
    }

    public void setNgayThemDate(String NgayThemDate) {
        this.NgayThemDate = NgayThemDate;
    }
    

    
}
