<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%
    HttpSession currentSession = request.getSession(false);
    String username = null;

    if (currentSession != null) {
        username = (String) currentSession.getAttribute("username");
    }

    if (username == null) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                    break;
                }
            }
        }
    }

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student Management System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>Welcome, <%= username %>!</div>
        <div>
            <a href="studentForm.jsp">Add Student</a>
            <a href="LogoutServlet">Logout</a>
        </div>
        
    </body>
</html>
