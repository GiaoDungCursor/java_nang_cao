<%@page import="Tam.CGioHang"%>
<%@page import="Tam.Hang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ Hàng</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h2 class="text-center mb-4">Đặt Hàng</h2>
    
    <div class="mb-3">
        <a href="TC.jsp" class="btn btn-secondary">← Quay lại trang chủ</a>
    </div>

    <form method="post" action="DatHang.jsp" class="row g-3">
        <div class="col-md-4">
            <label class="form-label">Tên hàng</label>
            <input type="text" name="txtth" class="form-control" required>
        </div>
        <div class="col-md-4">
            <label class="form-label">Giá</label>
            <input type="number" name="txtgia" class="form-control" required>
        </div>
        <div class="col-md-4">
            <label class="form-label">Số lượng</label>
            <input type="number" name="txtsl" class="form-control" required>
        </div>
        <div class="col-12">
            <button type="submit" name="un1" class="btn btn-success">Đặt Hàng</button>
            <a href="DatHang.jsp?action=deleteAll" class="btn btn-danger">Xóa Tất Cả</a>
        </div>
    </form>

    <hr>

    <h4 class="mt-4">Giỏ hàng</h4>

<%
    // Xử lý thêm hàng
    String th = request.getParameter("txtth");
    String gia = request.getParameter("txtgia");
    String sl = request.getParameter("txtsl");

    CGioHang g = (CGioHang) session.getAttribute("gh");
    if (g == null) {
        g = new CGioHang();
        session.setAttribute("gh", g);
    }

    if (th != null && gia != null && sl != null) {
        g.Them(th, Integer.parseInt(gia), Integer.parseInt(sl));
    }

    // Xử lý xóa từng mặt hàng
    String deleteItem = request.getParameter("delete");
    if (deleteItem != null) {
        for (int i = 0; i < g.ds.size(); i++) {
            if (g.ds.get(i).getTenhang().equalsIgnoreCase(deleteItem)) {
                g.ds.remove(i);
                break;
            }
        }
        session.setAttribute("gh", g);
    }

    // Xử lý xóa tất cả mặt hàng
    String action = request.getParameter("action");
    if ("deleteAll".equals(action)) {
        g.ds.clear();
        session.setAttribute("gh", g);
    }

    // Xử lý xóa nhiều mặt hàng theo checkbox
    String[] selectedItems = request.getParameterValues("selectedItems");
    if (selectedItems != null) {
        for (String itemName : selectedItems) {
            for (int i = 0; i < g.ds.size(); i++) {
                if (g.ds.get(i).getTenhang().equalsIgnoreCase(itemName)) {
                    g.ds.remove(i);
                    break;
                }
            }
        }
        session.setAttribute("gh", g);
    }

    if (g.ds.size() > 0) {
%>

    <form method="post" action="DatHang.jsp">
    <table class="table table-bordered mt-3">
        <thead class="table-dark">
            <tr>
                <th>Chọn</th>
                <th>Tên hàng</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
        <% for (int i = 0; i < g.ds.size(); i++) {
            Hang h = g.ds.get(i); %>
            <tr>
                <td><input type="checkbox" name="selectedItems" value="<%= h.getTenhang() %>"></td>
                <td><%= h.getTenhang() %></td>
                <td><%= h.getGia() %></td>
                <td>
                    <%= h.getSoluong() %>
                    <form method="post" action="sua.jsp?th=<%= h.getTenhang() %>" class="d-inline ms-2">
                        <input type="number" name="txtsua" class="form-control d-inline" style="width: 70px;" required>
                        <button type="submit" class="btn btn-sm btn-warning">Sửa</button>
                    </form>
                </td>
                <td><%= h.getThanhtien() %></td>
                <td>
                    <a href="DatHang.jsp?delete=<%= h.getTenhang() %>" class="btn btn-sm btn-danger">Xóa</a>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>

    <button type="submit" class="btn btn-danger">Xóa các mặt hàng đã chọn</button>
    </form>

    <div class="text-end mt-3">
        <strong>Tổng tiền: <%= g.Tongtien() %> VND</strong>
    </div>
<% } else { %>
    <p>Giỏ hàng trống.</p>
<% } %>

</body>
</html>
