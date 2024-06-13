package com.example;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class StudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String studentClass = request.getParameter("class");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String action = request.getParameter("action");

    Student student = new Student();
    student.setId(id);
    student.setName(name);
    student.setStudentClass(studentClass);
    student.setPhone(phone);
    student.setAddress(address);

    StudentDAO studentDAO = new StudentDAO();

    if ("Yes".equals(action)) {
        studentDAO.insertStudent(student);
        response.sendRedirect("studentForm.jsp");
    } else if ("No".equals(action)) {
        studentDAO.insertStudent(student);
        List<Student> students = studentDAO.selectAllStudents();
        request.setAttribute("students", students);
        request.getRequestDispatcher("student.jsp").forward(request, response);
    } else {
        request.setAttribute("student", student);
        request.getRequestDispatcher("confirmation.jsp").forward(request, response);
    }
}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentDAO studentDAO = new StudentDAO();
        List<Student> students = studentDAO.selectAllStudents();
        request.setAttribute("students", students);
        request.getRequestDispatcher("student.jsp").forward(request, response);
    }
}
