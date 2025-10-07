package Model;

public class Loai {
	private String maLoai;
	private String tenLoai;
	//phat sinh 2 ham tao
	//all cac ham get set
	public Loai() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMaLoai() {
		return maLoai;
	}
	public void setMaLoai(String maLoai) {
		this.maLoai = maLoai;
	}
	public String getTenLoai() {
		return tenLoai;
	}
	public void setTenLoai(String tenLoai) {
		this.tenLoai = tenLoai;
	}
	public Loai(String maLoai, String tenLoai) {
		super();
		this.maLoai = maLoai;
		this.tenLoai = tenLoai;
	}
	
	

}

