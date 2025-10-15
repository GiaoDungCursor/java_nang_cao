package Tam;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/maytinhController")
public class maytinhController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public maytinhController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tama = request.getParameter("txta");
        String tamb = request.getParameter("txtb");
        String op = request.getParameter("pheptoan"); // lấy phép toán từ select

        double kq = 0, a = 0, b = 0;

        if (tama != null && tamb != null && op != null) {
            a = Double.parseDouble(tama);
            b = Double.parseDouble(tamb);

            switch (op) {
                case "+": kq = a + b; break;
                case "-": kq = a - b; break;
                case "*": kq = a * b; break;
                case "/": 
                    if (b != 0)
                        kq = a / b;
                    else
                        request.setAttribute("kq", "Không thể chia cho 0!");
                    break;
            }
        }

        request.setAttribute("kq", kq);
        request.getRequestDispatcher("MayTinh.jsp").forward(request, response);
    }

}
