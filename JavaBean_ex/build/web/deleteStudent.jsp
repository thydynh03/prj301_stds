<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Delete Student</title>
        <style>
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
        <h2>Delete Student</h2>
        <form action="deleteStudent" method="get">
            <label for="studentId">Student ID:</label>
            <input type="text" id="studentId" name="id" required><br><br>
            <input type="submit" value="Delete">
        </form>

        <form action="LogoutServlet" method="post">
            <button type="submit" class="button">Logout</button>
        </form>
    </body>
</html>
