<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.StudentDAO" %>
<%@ page import="com.example.Student" %>

<%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || !"admin".equals(currentSession.getAttribute("role"))) {
        response.sendRedirect("../login.jsp");
        return;
    }
    StudentDAO studentDAO = new StudentDAO();
    List<Student> students = studentDAO.selectAllStudents();
    request.setAttribute("students", students);
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
        }
        .action-links {
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
        .search-text {
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
            margin-top: 10px;
        }
        .button:hover {
            background-color: #ff9933;
        }
        .search-text {
            margin-bottom: 10px;
        }
        .search-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .search-button:hover {
            background-color: #45a049;
        }
        .search-button:focus {
            outline: none;
        }
        input[type=text] {
            width: 30%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <h2>Admin Dashboard</h2>
    <div class="link">
        <table>
            <tr>
                <td class="action-links">
                    <h2 class="text"><a href="studentForm.jsp">Add</a></h2>
                    <h2 class="text"><a href="editStudent.jsp">Edit</a></h2>
                    <h2 class="text"><a href="deleteStudent.jsp">Delete</a></h2>
                </td>
            </tr>
        </table>
    </div>

    <h3 class="search-text">Search Student</h3>
    <form action="SearchStudentServlet" method="post">
        <input type="text" name="searchQuery" placeholder="Enter student ID">
        <input type="submit" value="Search" class="search-button">
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
