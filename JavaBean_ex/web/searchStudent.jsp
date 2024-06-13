<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.Student" %>

<%
    Student student = (Student) request.getAttribute("student");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Search Student Results</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 8px 12px;
                border: 1px solid #ddd;
                text-align: left;
            }
            th {
                background-color: #f4f4f4;
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
        <h2>Search Student Results</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Class</th>
                <th>Phone</th>
                <th>Address</th>
            </tr>
            <% if (student != null) { %>
            <tr>
                <td><%= student.getId() %></td>
                <td><%= student.getName() %></td>
                <td><%= student.getStudentClass() %></td>
                <td><%= student.getPhone() %></td>
                <td><%= student.getAddress() %></td>
            </tr>
            <% } else { %>
            <tr>
                <td colspan="5">No results found.</td>
            </tr>
            <% } %>
        </table>

        <form action="LogoutServlet" method="post">
            <button type="submit" class="button">Logout</button>
        </form>
    </body>
</html>
