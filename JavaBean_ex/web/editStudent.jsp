<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.StudentDAO" %>
<%@ page import="com.example.Student" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Student</title>
        <style>
            .button {
                background-color: #ffcc99;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 5px;
                width: 6%;
                margin-top: 10px; /* Để tạo khoảng cách với phần trên */
            }

            .button:hover {
                background-color: #ff9933; /* Màu nền khi di chuột vào */
            }
        </style>

    </head>
    <body>
        <h2>Edit Student</h2>
        <form action="editStudent.jsp" method="get">
            <label for="studentId">Enter Student ID:</label>
            <input type="text" id="studentId" name="id" required>
            <input type="submit" value="Edit">
        </form>

        <%
            // Lấy ID từ request
            String id = request.getParameter("id");

            // Kiểm tra xem ID có tồn tại không
            if (id != null && !id.isEmpty()) {
                // Khởi tạo đối tượng StudentDAO để thao tác với CSDL
                StudentDAO studentDAO = new StudentDAO();
        
                // Tìm sinh viên dựa trên ID
                Student student = studentDAO.selectStudent(id);

                // Kiểm tra xem sinh viên có tồn tại không
                if (student != null) {
        %>

        <form action="updateStudent" method="post">
            <input type="hidden" name="id" value="<%= student.getId() %>">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= student.getName() %>" required><br><br>
            <label for="class">Class:</label>
            <input type="text" id="class" name="class" value="<%= student.getStudentClass() %>" required><br><br>
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" value="<%= student.getPhone() %>" required><br><br>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="<%= student.getAddress() %>" required><br><br>
            <input type="submit" value="Update">
        </form>

        <%
                } else {
                    // Nếu không tìm thấy sinh viên, hiển thị thông báo
                    out.println("Student not found!");
                }
            } else {
                // Nếu không có ID được cung cấp, không cần thực hiện gì cả hoặc hiển thị thông báo
                // response.sendRedirect("otherPage.jsp");
                // out.println("ID not provided!");
            }
        %>

        <form action="LogoutServlet" method="post">
            <button type="submit" class="button">Logout</button>
        </form>
    </body>
</html>
