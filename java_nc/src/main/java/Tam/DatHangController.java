package Tam;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import Model.GioHangBO;

@WebServlet("/DatHangController")
public class DatHangController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        
        // Clear session cũ nếu có (để tránh conflict)
        Object oldGioHang = session.getAttribute("GioHang");
        if (oldGioHang != null && !(oldGioHang instanceof GioHangBO)) {
            session.removeAttribute("GioHang");
        }
        
        GioHangBO gh = (GioHangBO) session.getAttribute("GioHang");
        if (gh == null) gh = new GioHangBO();

        String tenSach = request.getParameter("txtth");
        String strGia = request.getParameter("txtgia");
        String strSl = request.getParameter("txtsl");
        String maSach = request.getParameter("txtma");
        String anh = request.getParameter("txtanh");

        if (tenSach != null && strGia != null && strSl != null && maSach != null && anh != null) {
            try {
                long gia = Long.parseLong(strGia);
                long sl = Long.parseLong(strSl);
                gh.Them(maSach, tenSach, sl, gia, anh);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        session.setAttribute("GioHang", gh);
        response.sendRedirect(request.getContextPath() + "/GioHangController");

    }
}
