package com.example;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SearchStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchQuery = request.getParameter("searchQuery");
        StudentDAO studentDAO = new StudentDAO();
        Student student = studentDAO.selectStudent(searchQuery);

        request.setAttribute("student", student);
        request.getRequestDispatcher("searchStudent.jsp").forward(request, response);
    }
}
