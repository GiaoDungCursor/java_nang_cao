package Model;

import java.util.ArrayList;

public class LoaiDAO {
    public ArrayList<Loai> getLoai() throws Exception {
        ArrayList<Loai> ds = new ArrayList<Loai>();
        ds.add(new Loai("tin", "Công nghệ thông tin"));
        ds.add(new Loai("toan", "Toán Ứng dụng"));
        ds.add(new Loai("ly", "Điện tử viễn thông"));
        ds.add(new Loai("sinh", "Công nghệ sinh học"));
        return ds;
    }
}
