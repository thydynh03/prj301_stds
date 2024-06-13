package com.example;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession currentSession = request.getSession(false);
        if (currentSession == null || !"admin".equals(currentSession.getAttribute("role"))) {
            response.sendRedirect("../login.jsp");
            return;
        }

        StudentDAO studentDAO = new StudentDAO();
        List<Student> students = studentDAO.selectAllStudents();
        
        request.setAttribute("students", students);
        request.getRequestDispatcher("/admin.jsp").forward(request, response);
    }
}
