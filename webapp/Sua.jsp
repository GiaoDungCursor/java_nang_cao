<%@page import="Tam.CGioHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sửa số lượng</title>
</head>
<body>
<%
    CGioHang g = (CGioHang)session.getAttribute("gh");
    String th = request.getParameter("th");
    String sl = request.getParameter("txtsua");
    if (g != null && th != null && sl != null) {
        g.Them(th, 111, Integer.parseInt(sl)); 
        session.setAttribute("gh", g);
    }
    response.sendRedirect("DatHang.jsp");
%>
</body>
</html>
