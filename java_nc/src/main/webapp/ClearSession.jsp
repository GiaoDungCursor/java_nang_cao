<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Clear Session</title>
</head>
<body>
    <h2>Clearing old session data...</h2>
    
    <%
        session.removeAttribute("giohang");
        session.removeAttribute("GioHang");
        out.println("<p>Session cleared successfully!</p>");
    %>
    
    <a href="TCController">Go to Home</a> | 
    <a href="GioHangController">Go to Cart</a>
</body>
</html>
