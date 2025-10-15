<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <a class="navbar-brand" href="TCController">Công ty sách</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="TCController">Trang chủ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="GioHangController">Giỏ hàng</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Thanh toán</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Lịch sử mua hàng</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="DangNhapController">Đăng nhập</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="DangXuatController">Đăng xuất</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">
            Xin chào: ${sessionScope.un != null ? sessionScope.un : 'Khách'}
          </a>
        </li>
      </ul>

      <form class="d-flex" method="get" action="TCController">
        <input name="key" class="form-control me-2" type="search" placeholder="Search" 
               value="${requestScope.key != null ? requestScope.key : ''}">
        <button class="btn btn-primary" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

<div class="container mt-3">
  <div class="row">
    <div class="col-sm-3">
      <h4>Loại sách</h4>
      <div class="list-group">
        <c:forEach var="loai" items="${requestScope.dsLoai}">
          <c:set var="active" value="${loai.maLoai eq requestScope.selectedMaLoai ? 'active' : ''}" />
          <a href="TCController?ml=${loai.maLoai}" 
             class="list-group-item list-group-item-action ${active}">
             ${loai.tenLoai}
          </a>
        </c:forEach>
      </div>
    </div>

    <div class="col-sm-9">
      <h4>
        <c:choose>
          <c:when test="${requestScope.hasSearch}">
            Kết quả tìm kiếm cho: ${requestScope.key}
          </c:when>
          <c:otherwise>
            Sách theo loại: ${requestScope.tenLoaiHienThi}
          </c:otherwise>
        </c:choose>
      </h4>

      <div class="row">
        <c:choose>
          <c:when test="${requestScope.hasBooks}">
            <c:forEach var="sach" items="${requestScope.dsSach}">
              <div class="col-md-4 mb-3">
                <div class="card h-100">
                  <img src="${sach.anh}" class="card-img-top" alt="${sach.tenSach}">
                  <div class="card-body">
                    <h5 class="card-title">${sach.tenSach}</h5>
                    <p class="card-text">Giá: ${sach.gia} VNĐ</p>
                    <form method="post" action="DatHangController" class="mt-2">
                      <input type="hidden" name="txtth" value="${sach.tenSach}">
                      <input type="hidden" name="txtgia" value="${sach.gia}">
                      <input type="hidden" name="txtma" value="${sach.maSach}">
                      <input type="hidden" name="txtanh" value="${sach.anh}">
                      <div class="input-group">
                        <input type="number" name="txtsl" class="form-control" value="1" min="1" required>
                        <button type="submit" class="btn btn-primary">Đặt mua</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <p>Không có sách để hiển thị.</p>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>