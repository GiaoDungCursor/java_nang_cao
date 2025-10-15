package Model;

import java.util.ArrayList;

public class LoaiBO {
	LoaiDAO ldao = new LoaiDAO();
	public ArrayList<Loai> getLoai() throws Exception {
		return ldao.getLoai();
	}
}
