package com.example;

import java.io.Serializable;

public class Student implements Serializable {
    private String id;
    private String name;
    private String studentClass;
    private String phone;
    private String address;

    public Student(String id, String name, String studentClass, String phone, String address) {
        this.id = id;
        this.name = name;
        this.studentClass = studentClass;
        this.phone = phone;
        this.address = address;
    }

    public Student() {
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStudentClass() {
        return studentClass;
    }

    public void setStudentClass(String studentClass) {
        this.studentClass = studentClass;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
