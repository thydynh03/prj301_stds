package com.example;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String studentClass = request.getParameter("class");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        Student student = new Student();
        student.setId(id);
        student.setName(name);
        student.setStudentClass(studentClass);
        student.setPhone(phone);
        student.setAddress(address);

        StudentDAO studentDAO = new StudentDAO();
        boolean updated = studentDAO.updateStudent(student); // Cập nhật sinh viên và nhận kết quả

        if (updated) {
            // Nếu cập nhật thành công, chuyển hướng đến trang admin.jsp
            response.sendRedirect("admin.jsp");
        } else {
            // Nếu không thành công, hiển thị thông báo lỗi
            response.getWriter().println("Failed to update student. Please try again.");
        }
    }
}
