package Model;

import java.util.ArrayList;

public class SachDAO {
	public ArrayList<Sach> getSach() throws Exception{
			ArrayList<Sach> ds = new ArrayList<Sach>();
			ds.add(new Sach("s1", "Cấu trúc dữ liệu", "Nga", 10, 10000, "b1.jpg", "tin"));
			ds.add(new Sach("s2", "Cơ sở dữ liệu", "Nga", 10, 10000, "b2.jpg", "tin"));
			ds.add(new Sach("s3", "Toán rời rạc", "Nga", 10, 10000, "b3.jpg", "toan"));
			ds.add(new Sach("s4", "Phân tích và thiết kế", "Nga", 10, 10000, "b4.jpg", "tin"));
			ds.add(new Sach("s5", "Vật lí đại cương", "Nga", 10, 10000, "b5.jpg", "ly"));
			ds.add(new Sach("s6", "Công nghệ sinh học", "Nga", 10, 10000, "b6.jpg", "sinh"));
			ds.add(new Sach("s7", "Sinh đại cương", "Nga", 10, 10000, "b7.jpg", "sinh"));
			ds.add(new Sach("s8", "Giải tích", "Nga", 10, 10000, "b8.jpg", "toan"));
			return ds;
	}
}
