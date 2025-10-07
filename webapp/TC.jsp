<%@page import="Model.Loai"%>
<%@page import="Model.LoaiBO"%>
<%@page import="Model.Sach"%>
<%@page import="Model.SachBO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Danh sách sách theo loại</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="javascript:void(0)">Công ty sách</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="#">Trang chủ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="DatHang.jsp">Giỏ hàng</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Thanh toán</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Lịch sử mua hàng</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="dangnhap.jsp">Đăng nhập</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Đăng xuất</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Xin chào: <%= session.getAttribute("un") != null ? session.getAttribute("un") : "Khách" %></a>
        </li>
      </ul>
      <form class="d-flex" role="search" method="get" action="TC.jsp">
        <input name="key" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" 
               value="<%= request.getParameter("key") != null ? request.getParameter("key") : "" %>">
        <button class="btn btn-primary" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

<div class="container mt-3">

  <%
    LoaiBO lbo = new LoaiBO();
    List<Loai> dsLoai = new ArrayList<>();
    String selectedMaLoai = request.getParameter("ml");
    if (selectedMaLoai == null) selectedMaLoai = "";

    String key = request.getParameter("key");
    if (key == null) key = "";

    try {
        dsLoai = lbo.getLoai();
    } catch (Exception e) {
        out.println("Lỗi lấy loại sách: " + e.getMessage());
    }
  %>

  <div class="row">
    <div class="col-sm-3">
      <h4>Loại sách</h4>
      <div class="list-group">
        <%
          for (Loai l : dsLoai) {
              String active = l.getMaLoai().equals(selectedMaLoai) ? "active" : "";
        %>
          <a href="TC.jsp?ml=<%= l.getMaLoai() %>" class="list-group-item list-group-item-action <%= active %>">
            <%= l.getTenLoai() %>
          </a>
        <%
          }
        %>
      </div>
    </div>

    <div class="col-sm-9">
      <%
        String tenLoaiHienThi = "Tất cả";
        for (Loai l : dsLoai) {
            if (l.getMaLoai().equals(selectedMaLoai)) {
                tenLoaiHienThi = l.getTenLoai();
                break;
            }
        }
      %>

      <h4>
        <%
          if (!key.isEmpty()) {
              out.print("Kết quả tìm kiếm cho: " + key);
          } else {
              out.print("Sách theo loại: " + tenLoaiHienThi);
          }
        %>
      </h4>

      <div class="row">
        <%
          SachBO sbo = new SachBO();
          List<Sach> dsSach = new ArrayList<>();
          try {
              if (!key.isEmpty()) {
                  dsSach = sbo.Tim(key);  // Tìm kiếm theo key (tên sách hoặc tác giả)
              } else if (!selectedMaLoai.isEmpty()) {
                  dsSach = sbo.getSachTheoLoai(selectedMaLoai);
              } else {
                  dsSach = sbo.getSach();
              }
          } catch (Exception e) {
              out.println("Lỗi lấy sách: " + e.getMessage());
          }

          for (Sach s : dsSach) {
        %>
        <div class="col-md-4 mb-3">
          <div class="card h-100">
            <img src="<%= s.getAnh() %>" class="card-img-top" alt="<%= s.getTenSach() %>">
            <div class="card-body">
              <h5 class="card-title"><%= s.getTenSach() %></h5>
              <p class="card-text">Giá: <%= s.getGia() %> VNĐ</p>
              <form method="post" action="DatHang.jsp" class="mt-2">
                <input type="hidden" name="txtth" value="<%= s.getTenSach() %>">
                <input type="hidden" name="txtgia" value="<%= s.getGia() %>">
                <div class="input-group">
                  <input type="number" name="txtsl" class="form-control" value="1" min="1" required>
                  <button type="submit" class="btn btn-primary">Đặt mua</button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <%
          }
        %>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
