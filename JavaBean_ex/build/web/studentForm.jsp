<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Form</title>
        <style>
            form {
                width: 50%;
                border-collapse: collapse;
                margin: 20px 0;
                width:100%;
            }
            #form{
                text-align: center;
            }
            .id{
                margin-right: 42px;
            }
            .name{
                margin-right: 20px;

            }
            .class{
                margin-right: 24px;

            }
            .phone{
                margin-right: 19px;

            }
            .address{
                margin-right: 7px;

            }
            .content{
                align-items: center;
                text-align: center;

                border:1px solid #ffffff;
            }
            .button{
                background-color: orange;
                color: white;
                border-radius: 20px;
                width:80px;
                height: 50px;
                text-align: center;
            }
            th {
                background-color: #ffcc99;
            }
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
        <h2 class="content" >Student Form</h2>
        <form id="form" action="StudentServlet" method="post">
            <label class="id" for="id">ID:</label>
            <input type="text" id="id" name="id" required><br><br>
            <label class="name" for="name">Name:</label>
            <input type="text" id="name" name="name" required><br><br>
            <label class="class" for="class">Class:</label>
            <input type="text" id="class" name="class" required><br><br>
            <label class="phone" for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" required><br><br>
            <label class="address" for="address">Address:</label>
            <input type="text" id="address" name="address" required><br><br>
            <input class="button" type="submit" value="Submit">
        </form>
        <!-- Add Back Button -->
        <button onclick="goBack()">Back</button>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>

        <form action="LogoutServlet" method="post">
            <button type="submit" class="button">Logout</button>
        </form>
    </body>
</html>
