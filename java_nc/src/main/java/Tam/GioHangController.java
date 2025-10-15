package Tam;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import Model.GioHangBO;

@WebServlet("/GioHangController")
public class GioHangController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        
        // Clear session cũ nếu có (để tránh conflict)
        Object oldGioHang = session.getAttribute("GioHang");
        if (oldGioHang != null && !(oldGioHang instanceof GioHangBO)) {
            session.removeAttribute("GioHang");
            session.removeAttribute("giohang"); // Clear cả tên cũ
        }
        
        GioHangBO gh = (GioHangBO) session.getAttribute("GioHang");

        String action = request.getParameter("action");
        String maSach = request.getParameter("maSach");
        String changeStr = request.getParameter("change");
        String[] selectedItems = request.getParameterValues("selectedItems");

        System.out.println("Action: " + action);
        System.out.println("MaSach: " + maSach);
        System.out.println("SelectedItems: " + (selectedItems != null ? java.util.Arrays.toString(selectedItems) : "null"));

        if (gh == null) gh = new GioHangBO();

        if ("xoa".equals(action) && maSach != null) {
            System.out.println("Xóa 1 item: " + maSach);
            gh.Xoa(maSach);
        } else if ("xoahet".equals(action)) {
            System.out.println("Xóa tất cả items");
            gh.getDs().clear();
        } else if ("xoaSelected".equals(action) && selectedItems != null) {
            // Xóa nhiều items được chọn
            System.out.println("Xóa " + selectedItems.length + " items được chọn");
            for (String itemMaSach : selectedItems) {
                System.out.println("Đang xóa item: " + itemMaSach);
                gh.Xoa(itemMaSach);
            }
        } else if ("update".equals(action) && maSach != null && changeStr != null) {
            try {
                int change = Integer.parseInt(changeStr);
                for (Model.GioHang item : gh.getDs()) {
                    if (item.getMaSach().equalsIgnoreCase(maSach)) {
                        long newQuantity = item.getSoLuong() + change;
                        if (newQuantity > 0) {
                            item.setSoLuong(newQuantity);
                        } else {
                            // Xóa item nếu quantity <= 0
                            gh.Xoa(maSach);
                        }
                        break;
                    }
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        session.setAttribute("GioHang", gh);
        
        // Set attributes cho JSTL
        request.setAttribute("hasItems", gh != null && !gh.getDs().isEmpty());
        
        RequestDispatcher rd = request.getRequestDispatcher("DatHang.jsp");
        rd.forward(request, response);
    }
}
