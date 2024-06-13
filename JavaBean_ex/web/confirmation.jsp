<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Confirmation</title>
        <style>
            /* Thêm CSS tùy ý */
            table {
                width: 50%;
                margin: 20px auto;
                border-collapse: collapse;
            }
            th, td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            .buttons {
                text-align: center;
                margin-top: 20px;
            }
            .buttons input {
                padding: 10px 20px;
                margin: 0 10px;
            }
            .button {
                background-color: #ffcc99;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 5px;
                width: 6%;
                margin-top: 10px; /* Để tạo khoảng cách với phần trên */
            }

            .button:hover {
                background-color: #ff9933; /* Màu nền khi di chuột vào */
            }
        </style>
    </head>
    <body>
        <h2>Student Information Confirmation</h2>
        <table>
            <tr>
                <th>ID</th>
                <td>${student.id}</td>
            </tr>
            <tr>
                <th>Name</th>
                <td>${student.name}</td>
            </tr>
            <tr>
                <th>Class</th>
                <td>${student.studentClass}</td>
            </tr>
            <tr>
                <th>Phone</th>
                <td>${student.phone}</td>
            </tr>
            <tr>
                <th>Address</th>
                <td>${student.address}</td>
            </tr>
        </table>
        <div class="buttons">
            <form action="StudentServlet" method="post">
                <input type="hidden" name="id" value="${student.id}">
                <input type="hidden" name="name" value="${student.name}">
                <input type="hidden" name="class" value="${student.studentClass}">
                <input type="hidden" name="phone" value="${student.phone}">
                <input type="hidden" name="address" value="${student.address}">
                <input type="submit" name="action" value="Yes">
                <input type="submit" name="action" value="No">
            </form>
        </div>
        <!-- Add Back Button -->
        <button onclick="goBack()">Back</button>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>

        <form action="LogoutServlet" method="post">
            <button type="submit" class="button">Logout</button>
        </form>
    </body>
</html>
