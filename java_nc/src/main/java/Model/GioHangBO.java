package Model;

import java.util.ArrayList;

public class GioHangBO {
	private ArrayList<GioHang> ds= new ArrayList<GioHang> ();
	public ArrayList<GioHang> getDs() {
		return ds;
	}
	public void Them(String maSach, String tenSach, long soLuong, long gia, String anh) {
		for(GioHang h: ds) {
			  if(h.getMaSach().trim().toLowerCase().equals(maSach.trim().toLowerCase())) {
		            h.setSoLuong(h.getSoLuong()+ soLuong);
		            return;
		        }
		}
		ds.add(new GioHang(maSach, tenSach, soLuong, gia, anh));
	}public void Xoa(String masach) {
	    for(GioHang h: ds) {
	        if(h.getMaSach().trim().toLowerCase().equals(masach.trim().toLowerCase())) {
	            ds.remove(h);
	            return;
	        }
	    }
	}
	public long Tong() {
	    long s=0;
	    for(GioHang h: ds) s=s+h.getThanhTien();
	    return s;
	}
	
	public long getTong() {
	    return Tong();
	}
}
