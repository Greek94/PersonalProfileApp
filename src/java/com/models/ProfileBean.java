package com.models;

import java.io.Serializable;

// Rule 1: Implements Serializable
public class ProfileBean implements Serializable {
    
    // Rule 2: Private properties (attributes)
    private int id;
    private String name;
    private String studentId;
    private String program;
    private String email;
    private String hobbies;
    private String intro;

    // Rule 3: A public no-argument constructor
    public ProfileBean() {
    }

    // Rule 4: Public Getters and Setters for all private properties
    
    // ID (Used for Database handling)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Name
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Student ID
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    // Program
    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }

    // Email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Hobbies
    public String getHobbies() {
        return hobbies;
    }

    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }

    // Introduction
    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }
}