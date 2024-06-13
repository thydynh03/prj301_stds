<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.StudentDAO" %>
<%@ page import="com.example.Student" %>

<%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || !"user".equals(currentSession.getAttribute("role"))) {
        response.sendRedirect("../login.jsp");
        return;
    }

    // Lấy danh sách sinh viên từ DAO
    StudentDAO studentDAO = new StudentDAO();
    List<Student> students = studentDAO.selectAllStudents();
    request.setAttribute("students", students);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
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
    <h2>User Dashboard</h2>

    <h3>Student List</h3>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Class</th>
            <th>Phone</th>
            <th>Address</th>
        </tr>
        <c:forEach var="student" items="${students}">
            <tr>
                <td><c:out value="${student.id}" /></td>
                <td><c:out value="${student.name}" /></td>
                <td><c:out value="${student.studentClass}" /></td>
                <td><c:out value="${student.phone}" /></td>
                <td><c:out value="${student.address}" /></td>
            </tr>
        </c:forEach>
    </table>

    <form action="LogoutServlet" method="post">
        <button type="submit" class="button">Logout</button>
    </form>
</body>
</html>
