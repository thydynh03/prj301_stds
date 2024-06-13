package com.example;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.Student;
import com.example.StudentDAO;

public class EditStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ request
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String studentClass = request.getParameter("class");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Tạo đối tượng sinh viên mới với thông tin cập nhật
        Student student = new Student(id, name, studentClass, phone, address);

        // Cập nhật thông tin sinh viên vào database
        StudentDAO studentDAO = new StudentDAO();
        boolean updated = studentDAO.updateStudent(student);

        if (updated) {
            // Nếu cập nhật thành công, chuyển hướng về trang danh sách sinh viên
            response.sendRedirect("studentList.jsp");
        } else {
            // Nếu cập nhật không thành công, hiển thị thông báo lỗi
            response.getWriter().println("Failed to update student!");
        }
    }
}
