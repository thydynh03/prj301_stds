package com.example;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        
        if (id != null && !id.isEmpty()) {
            StudentDAO studentDAO = new StudentDAO();
            studentDAO.deleteStudent(id);
            response.sendRedirect("admin.jsp");
        } else {
            // Nếu không có ID được cung cấp, có thể hiển thị thông báo hoặc chuyển hướng người dùng đến trang khác
            response.sendRedirect("error.jsp"); // hoặc có thể hiển thị thông báo lỗi
        }
    }
}
