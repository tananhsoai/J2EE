
package model;


public class sanpham {
    private int masp;
    private String tensp;
    private int ram, rom, pin;
    private double manhinh;
    private String anh;
    private long gia;

    public sanpham() {
    }

    public sanpham(int masp, String tensp, int ram, int rom, int pin, double manhinh, String anh, long gia) {
        this.masp = masp;
        this.tensp = tensp;
        this.ram = ram;
        this.rom = rom;
        this.pin = pin;
        this.manhinh = manhinh;
        this.anh = anh;
        this.gia = gia;
    }

    public int getMasp() {
        return masp;
    }

    public void setMasp(int masp) {
        this.masp = masp;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }

    public int getRam() {
        return ram;
    }

    public void setRam(int ram) {
        this.ram = ram;
    }

    public int getRom() {
        return rom;
    }

    public void setRom(int rom) {
        this.rom = rom;
    }

    public int getPin() {
        return pin;
    }

    public void setPin(int pin) {
        this.pin = pin;
    }

    public double getManhinh() {
        return manhinh;
    }

    public void setManhinh(double manhinh) {
        this.manhinh = manhinh;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    public long getGia() {
        return gia;
    }

    public void setGia(long gia) {
        this.gia = gia;
    }


    @Override
    public String toString() {
        return "sanpham{" + "masp=" + masp + ", tensp=" + tensp + ", ram=" + ram + ", rom=" + rom + ", pin=" + pin + ", manhinh=" + manhinh + ", anh=" + anh + ", gia=" + gia + ", soluong=" + '}';
    }
   
}
