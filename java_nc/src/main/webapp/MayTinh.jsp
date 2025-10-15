<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Máy Tính JSP</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px auto;
            width: 320px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fafafa;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }
        input, select {
            padding: 6px;
            width: 100%;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            width: 100%;
            padding: 8px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover { background-color: #45a049; }
        .result {
            font-size: 18px;
            color: #333;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Máy Tính JSP</h2>

    <form action="maytinhController" method="post">
        <label>Nhập số A:</label>
        <input type="text" name="txta" required>

        <label>Nhập số B:</label>
        <input type="text" name="txtb" required>

        <label>Phép toán:</label>
        <select name="pheptoan">
            <option value="+">Cộng (+)</option>
            <option value="-">Trừ (-)</option>
            <option value="*">Nhân (×)</option>
            <option value="/">Chia (÷)</option>
        </select>

        <button type="submit">Tính</button>
    </form>

    <div class="result">
        <% 
            Object kq = request.getAttribute("kq");
            if (kq != null) {
                out.print("<hr>Kết quả: <b>" + kq + "</b>");
            }
        %>
    </div>
</body>
</html>
