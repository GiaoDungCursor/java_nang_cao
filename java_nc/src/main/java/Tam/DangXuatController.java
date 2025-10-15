package Tam;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DangXuatController")
public class DangXuatController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DangXuatController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy session hiện tại (nếu có)
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate(); // Xóa toàn bộ session
        }

        // Quay về trang đăng nhập hoặc trang chủ
        response.sendRedirect(request.getContextPath() + "/DangNhap.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
