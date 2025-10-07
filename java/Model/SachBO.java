package Model;

import java.util.ArrayList;

public class SachBO {
    SachDAO sdao = new SachDAO();
    ArrayList<Sach> ds;

    public SachBO() throws Exception {
        ds = sdao.getSach();
    }

    public ArrayList<Sach> getSach() throws Exception {
        return ds;
    }

    public ArrayList<Sach> getSachTheoLoai(String maLoai) throws Exception {
        ArrayList<Sach> dsLoai = new ArrayList<>();
        for (Sach s : ds) {
            if (s.getMaLoai().equalsIgnoreCase(maLoai)) {
                dsLoai.add(s);
            }
        }
        return dsLoai;
    }

    public ArrayList<Sach> TimMa(String maLoai) throws Exception {
        ArrayList<Sach> tam = new ArrayList<>();
        for (Sach s : ds) {
            if (s.getTenSach().trim().toLowerCase().equals(maLoai.trim().toLowerCase())) {
                tam.add(s);
            }
        }
        return tam;
    }

    public ArrayList<Sach> Tim(String key) throws Exception {
        ArrayList<Sach> tam = new ArrayList<>();
        for (Sach s : ds) {
            if (s.getTenSach().trim().toLowerCase().contains(key.trim().toLowerCase())
                    || s.getTacGia().trim().toLowerCase().contains(key.trim().toLowerCase())) {
                tam.add(s);
            }
        }
        return tam;
    }
}
