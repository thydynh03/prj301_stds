<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Student" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Dashboard</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            th, td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
            }
            th {
                background-color: #999999;
            }
            .content {
                text-align: center;
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
        <h2 class="content">Student Dashboard</h2>
        <%
            List<Student> students = (List<Student>) request.getAttribute("students");
            if (students == null || students.isEmpty()) {
                out.println("<p>No students available</p>");
            } else {
        %>
        <table>
            <tr>
                <th>ID</th>
                <th>Full name</th>
                <th>Class</th>
                <th>Phone</th>
                <th>Address</th>
            </tr>
            <%
                for (Student student : students) {
            %>
            <tr>
                <td><%= student.getId() %></td>
                <td><%= student.getName() %></td>
                <td><%= student.getStudentClass() %></td>
                <td><%= student.getPhone() %></td>
                <td><%= student.getAddress() %></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }
        %>
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
