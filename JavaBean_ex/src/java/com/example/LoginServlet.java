package com.example;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Cookie;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean rememberMe = "on".equals(request.getParameter("remember"));

        String role = null;
        if ("admin".equals(username) && "123".equals(password)) {
            role = "admin";
        } else if ("dinhthi03".equals(username) && "030504".equals(password)) {
            role = "user";
        }

        if (role != null) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);

            if (rememberMe) {
                Cookie userCookie = new Cookie("username", username);
                userCookie.setMaxAge(30 * 60); // 30 minutes
                response.addCookie(userCookie);
            }

            if ("admin".equals(role)) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("user.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=Invalid username or password");
        }
    }
}
