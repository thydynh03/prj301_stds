package com.example;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    private String dbUser = "sa";
    private String dbPassword = "123";
    private String dbURL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=student_database;encrypt=false;trustServerCertificate=false;loginTimeout=30";
    private String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    private static final String INSERT_STUDENTS_SQL = "INSERT INTO students (id, name, class, phone, address) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_STUDENT_BY_ID = "SELECT id, name, class, phone, address FROM students WHERE id = ?";
    private static final String SELECT_ALL_STUDENTS = "SELECT * FROM students";
    private static final String DELETE_STUDENT_SQL = "DELETE FROM students WHERE id = ?";
    private static final String UPDATE_STUDENT_SQL = "UPDATE students SET name = ?, class = ?, phone = ?, address = ? WHERE id = ?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName(driverClass);
            connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            System.err.println("Error in getConnection: " + e.getMessage());
        }
        return connection;
    }

    // Insert Student
    public void insertStudent(Student student) {
        try (Connection connection = getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STUDENTS_SQL)) {
            preparedStatement.setString(1, student.getId());
            preparedStatement.setString(2, student.getName());
            preparedStatement.setString(3, student.getStudentClass());
            preparedStatement.setString(4, student.getPhone());
            preparedStatement.setString(5, student.getAddress());
            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " row(s) affected.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Exception in insertStudent: " + e.getMessage());
        }
    }

    // Select Student by ID
    public Student selectStudent(String id) {
        Student student = null;
        try (Connection connection = getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENT_BY_ID)) {
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String studentClass = rs.getString("class");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                student = new Student(id, name, studentClass, phone, address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Exception in selectStudent: " + e.getMessage());
        }
        return student;
    }

    // Select All Students
    public List<Student> selectAllStudents() {
        List<Student> students = new ArrayList<>();
        try (Connection connection = getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STUDENTS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String studentClass = rs.getString("class");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                students.add(new Student(id, name, studentClass, phone, address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Exception in selectAllStudents: " + e.getMessage());
        }
        return students;
    }

    // Delete Student
    public boolean deleteStudent(String id) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection(); 
             PreparedStatement statement = connection.prepareStatement(DELETE_STUDENT_SQL)) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Exception in deleteStudent: " + e.getMessage());
        }
        return rowDeleted;
    }

    // Update Student
    public boolean updateStudent(Student student) {
        boolean rowUpdated = false;
        try (Connection connection = getConnection(); 
             PreparedStatement statement = connection.prepareStatement(UPDATE_STUDENT_SQL)) {
            statement.setString(1, student.getName());
            statement.setString(2, student.getStudentClass());
            statement.setString(3, student.getPhone());
            statement.setString(4, student.getAddress());
            statement.setString(5, student.getId());
            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Exception in updateStudent: " + e.getMessage());
        }
        return rowUpdated;
    }

    public static void main(String[] args) {
        StudentDAO studentDAO = new StudentDAO();
        try {
            Connection connection = studentDAO.getConnection();
            if (connection != null) {
                System.out.println("Connected to the database.");
                connection.close();
            } else {
                System.out.println("Failed to make connection!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
