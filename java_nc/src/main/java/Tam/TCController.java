package Tam;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import Model.Loai;
import Model.LoaiBO;
import Model.Sach;
import Model.SachBO;

@WebServlet("/TCController")
public class TCController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String ml = request.getParameter("ml");
        String key = request.getParameter("key");
        if (ml == null) ml = "";
        if (key == null) key = "";

        try {
            LoaiBO lbo = new LoaiBO();
            SachBO sbo = new SachBO();

            List<Loai> dsLoai = lbo.getLoai();
            List<Sach> dsSach;

            if (!key.isEmpty()) {
                dsSach = sbo.Tim(key);
            } else if (!ml.isEmpty()) {
                dsSach = sbo.getSachTheoLoai(ml);
            } else {
                dsSach = sbo.getSach();
            }

            // Xử lý logic hiển thị
            String tenLoaiHienThi = "Tất cả";
            if (!ml.isEmpty()) {
                for (Loai l : dsLoai) {
                    if (l.getMaLoai().equals(ml)) {
                        tenLoaiHienThi = l.getTenLoai();
                        break;
                    }
                }
            }
            
            request.setAttribute("dsLoai", dsLoai);
            request.setAttribute("dsSach", dsSach);
            request.setAttribute("selectedMaLoai", ml);
            request.setAttribute("key", key);
            request.setAttribute("tenLoaiHienThi", tenLoaiHienThi);
            request.setAttribute("hasSearch", !key.isEmpty());
            request.setAttribute("hasBooks", dsSach != null && !dsSach.isEmpty());

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
        }

        RequestDispatcher rd = request.getRequestDispatcher("TC.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
