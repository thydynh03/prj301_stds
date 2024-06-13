<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
            margin: 0;
        }
        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px; /* Tổng chiều rộng của form */
        }
        .input-group {
            margin-bottom: 15px;
        }
        .input-group label {
            display: block;
            margin-bottom: 5px;
        }
        .input-group input, .input-group label {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }
        .input-group.checkbox {
            display: flex;
            align-items: center;
        }
        .input-group.checkbox label {
            margin-bottom: 0;
            margin-left: 5px;
            font-size: 14px;
        }
        .input-group.checkbox input[type="checkbox"] {
            width: auto;
            margin: 0;
            transform: scale(0.8);
        }
        .button {
            background-color: #ffcc99;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
        }
        .button:hover {
            background-color: #ff9933; /* Màu nền khi di chuột vào */
        }
        .login {
            font-size: larger;
            color: #ff9900;
            text-align: center;
            margin-bottom: 20px;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <form action="LoginServlet" method="post">
        <h2 class="login">LOGIN</h2>
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <p class="error"><%= error %></p>
        <%
            }
        %>
        <div class="input-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="input-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="input-group checkbox">
            <input type="checkbox" id="remember" name="remember">
            <label for="remember">Remember Me</label>
        </div>
        <button class="button" type="submit">Login</button>
    </form>
</body>
</html>
