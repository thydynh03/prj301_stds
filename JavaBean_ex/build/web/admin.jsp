<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.StudentDAO" %>
<%@ page import="com.example.Student" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || !"admin".equals(currentSession.getAttribute("role"))) {
        response.sendRedirect("../login.jsp");
        return;
    }
    StudentDAO studentDAO = new StudentDAO();
    List<Student> students = studentDAO.selectAllStudents();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard</title>
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
            .action-links a {
                margin-right: 10px;
            }
            .action-links h2.text {
                display: inline-block;
                margin: 10px;
                background-color: orange;
                padding: 10px 20px;
                border-radius: 5px;
                ;
            }
            .action-links  {
                text-align: center;
            }
            .link {
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .link a {
                text-decoration: none;
                color: black;
            }
            .text {
                display: flex;
                text-align: center;
            }
            .search-text{
                font-size: large;
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
            .search-text {
                margin-bottom: 10px; /* Khoảng cách với phần tử phía dưới */
            }

            .search-button {
                background-color: #4CAF50; /* Màu nền xanh lá cây */
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 5px;
                transition: background-color 0.3s; /* Hiệu ứng thay đổi màu nền */
            }

            .search-button:hover {
                background-color: #45a049; /* Màu nền xanh lá cây khi di chuột vào */
            }

            .search-button:focus {
                outline: none; /* Loại bỏ đường viền khi focus */
            }

            /* Định dạng phần input search */
            input[type=text] {
                width: 30%; /* Chiều rộng của input */
                padding: 10px; /* Khoảng cách bên trong input */
                border-radius: 5px;
                border: 1px solid #ccc; /* Đường viền xám nhạt */
                box-sizing: border-box; /* Đảm bảo rằng padding không làm thay đổi chiều rộng */
                margin-right: 10px; /* Khoảng cách với phần tử bên cạnh */
            }
        </style>
    </head>
    <body>
        <h2>Admin Dashboard</h2>
        <div class="link">
            <table>
                <tr>
                    <td class="action-links">
                        <h2 class="text"><a href="studentForm.jsp?id=${student.id}">Add</a></h2>
                        <h2 class="text"><a href="editStudent.jsp?id=${student.id}">Edit</a></h2>
                        <h2 class="text"><a href="deleteStudent.jsp?id=${student.id}">Delete</a></h2>
                    </td>
                </tr>
            </table>
        </div>

        <h3 class="search-text">Search Student</h3>
        <form action="SearchStudentServlet" method="post">
            <input type="text" name="searchQuery" placeholder="Enter student ID">
            <input type="submit" value="Search"class="search-button">
        </form>

        <h3>Student List</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
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

        <form action="LogoutServlet" method="post">
            <button type="submit" class="button">Logout</button>
        </form>
    </body>
</html>
