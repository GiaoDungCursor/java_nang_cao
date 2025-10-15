package Tam;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DangNhapController")
public class DangNhapController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DangNhapController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String un = request.getParameter("txtun");
        String pass = request.getParameter("txtpass");
        String captchaInput = request.getParameter("txtcaptcha");

        HttpSession session = request.getSession();
        
        // Kiểm tra CAPTCHA trước
        Integer captchaResult = (Integer) session.getAttribute("captchaResult");
        
        if (captchaResult == null || captchaInput == null) {
            response.sendRedirect("DangNhap.jsp?tb=2");
            return;
        }
        
        try {
            int userCaptcha = Integer.parseInt(captchaInput);
            
            // Nếu CAPTCHA sai
            if (userCaptcha != captchaResult) {
                response.sendRedirect("DangNhap.jsp?tb=2");
                return;
            }
            
            // CAPTCHA đúng, kiểm tra thông tin đăng nhập
            if (("admin".equals(un) && "123".equals(pass)) || ("user".equals(un) && "123".equals(pass))) {
                session.setAttribute("un", un);
                response.sendRedirect("TCController");
            } else {
                response.sendRedirect("DangNhap.jsp?tb=1");
            }
            
        } catch (NumberFormatException e) {
            response.sendRedirect("DangNhap.jsp?tb=2");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
