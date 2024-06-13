package com.example;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && "user".equals(session.getAttribute("role"))) {
            // Trang user.jsp chỉ hiển thị cho người dùng có quyền user
            request.getRequestDispatcher("user.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
