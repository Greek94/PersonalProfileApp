# UiTM Student Profile Management System

## 📌 Project Overview
A web-based Profile Management System developed for **CSC584**. This application allows users to create, view, search, and delete student profiles securely. It features a UiTM-themed user interface and complies with basic OWASP security standards.

## 🛠️ Technologies Used
* **IDE:** NetBeans 8.2
* **Language:** Java (JSP, Servlets)
* **Database:** MySQL (phpMyAdmin)
* **Server:** Apache Tomcat / GlassFish
* **Frontend:** HTML5, CSS3 (UiTM Official Colors)

## ✨ Key Features (Assignment Requirements)
1.  **MVC Architecture:** Uses Model (JavaBean), View (JSP), and Controller (Servlet).
2.  **Database Integration:** Saves and retrieves student data using JDBC.
3.  **Security (OWASP):** * Input validation (Regex) for Names and IDs.
    * Strict Email Whitelisting (`*.uitm.edu.my` only).
    * Protection against SQL Injection (via PreparedStatement).
4.  **Unique Feature:** * **Multi-Field Search:** Filter profiles by Name, ID, Program, or Email.
    * **Delete Capability:** Remove outdated records securely.

## 🚀 How to Run
1.  Import the project into **NetBeans 8.2**.
2.  Add the **MySQL JDBC Driver** to the project libraries.
3.  Create the database using the SQL script below.
4.  Run the project on GlassFish or Tomcat.

## 📂 Database Setup
Run this SQL command to create the necessary table:
```sql
CREATE DATABASE student_profiles;
USE student_profiles;

CREATE TABLE profiles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    student_id VARCHAR(15),
    program VARCHAR(10),
    email VARCHAR(50),
    hobbies VARCHAR(100),
    intro TEXT
);
