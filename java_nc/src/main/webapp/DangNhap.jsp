<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  // Tạo CAPTCHA đơn giản (phép tính cộng)
  int num1 = (int)(Math.random() * 10) + 1;
  int num2 = (int)(Math.random() * 10) + 1;
  int captchaResult = num1 + num2;
  
  // Lưu kết quả vào session
  session.setAttribute("captchaResult", captchaResult);
%>
<!DOCTYPE html>
<html>
<head>
<title>Đăng nhập</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
        <li class="nav-item"><a class="nav-link" href="TCController">Trang chủ</a></li>
        <li class="nav-item"><a class="nav-link" href="GioHangController">Giỏ hàng</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Thanh toán</a></li>
        
        <li class="nav-item"><a class="nav-link" href="#">Xin chào: <%= session.getAttribute("un") != null ? session.getAttribute("un") : "Khách" %></a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-5" style="max-width: 400px;">
  <h3 class="text-center mb-3">Đăng nhập hệ thống</h3>
  <form action="DangNhapController" method="post">
    <div class="mb-3">
      <label class="form-label">Tên đăng nhập:</label>
      <input type="text" name="txtun" class="form-control" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Mật khẩu:</label>
      <input type="password" name="txtpass" class="form-control" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Xác nhận CAPTCHA:</label>
      <div class="input-group">
        <span class="input-group-text bg-light" style="font-weight: bold; font-size: 18px; color: #0066cc;">
          <%= num1 %> + <%= num2 %> = ?
        </span>
        <input type="number" name="txtcaptcha" class="form-control" placeholder="Nhập kết quả" required>
      </div>
      <small class="text-muted">Vui lòng nhập kết quả phép tính trên</small>
    </div>
    <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
  </form>

  <%
    String tb = request.getParameter("tb");
    if ("1".equals(tb)) {
  %>
    <div class="alert alert-danger mt-3 text-center">
      Sai tên đăng nhập hoặc mật khẩu!
    </div>
  <%
    } else if ("2".equals(tb)) {
  %>
    <div class="alert alert-danger mt-3 text-center">
      Sai CAPTCHA! Vui lòng thử lại.
    </div>
  <%
    }
  %>
</div>
</body>
</html>
