import com.models.ProfileBean;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/ProfileServlet"})
public class ProfileServlet extends HttpServlet {

    // --- DATABASE CONFIGURATION ---
    private final String jdbcURL = "jdbc:mysql://localhost:3306/student_profiles";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = ""; 

    // --- 1. HANDLE GET REQUESTS (View, Delete, or Filter) ---
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            deleteProfile(request, response);
        } else if ("filter".equals(action)) {
            filterProfiles(request, response);
        } else {
            listProfiles(request, response);
        }
    }

    // --- 2. HANDLE POST REQUESTS (Save New Profile) ---
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("intro");

        ProfileBean profile = new ProfileBean();
        profile.setName(name);
        profile.setStudentId(studentId);
        profile.setProgram(program);
        profile.setEmail(email);
        profile.setHobbies(hobbies);
        profile.setIntro(intro);

        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            
            String sql = "INSERT INTO profiles (name, student_id, program, email, hobbies, intro) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, studentId);
            statement.setString(3, program);
            statement.setString(4, email);
            statement.setString(5, hobbies);
            statement.setString(6, intro);
            
            statement.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) {}
        }

        request.setAttribute("profile", profile);
        RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
        dispatcher.forward(request, response);
    }

    // --- HELPER 1: List All Profiles ---
    private void listProfiles(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<ProfileBean> listProfile = new ArrayList<>();
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            
            String sql = "SELECT * FROM profiles";
            Statement statement = conn.createStatement();
            ResultSet result = statement.executeQuery(sql);
            
            while (result.next()) {
                ProfileBean profile = new ProfileBean();
                profile.setId(result.getInt("id"));
                profile.setName(result.getString("name"));
                profile.setStudentId(result.getString("student_id"));
                profile.setProgram(result.getString("program"));
                profile.setEmail(result.getString("email"));
                // NEW: Fetch Hobbies and Intro
                profile.setHobbies(result.getString("hobbies"));
                profile.setIntro(result.getString("intro"));
                
                listProfile.add(profile);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) {}
        }
        
        request.setAttribute("listProfile", listProfile);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewProfiles.jsp");
        dispatcher.forward(request, response);
    }
    
    // --- HELPER 2: Delete a Profile ---
    private void deleteProfile(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        Connection conn = null;
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            String sql = "DELETE FROM profiles WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) {}
        }
        response.sendRedirect("ProfileServlet"); 
    }

    // --- HELPER 3: Multi-Field Search ---
    private void filterProfiles(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String keyword = request.getParameter("keyword");
        List<ProfileBean> listProfile = new ArrayList<>();
        Connection conn = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            
            // Search in Name OR Student ID OR Program OR Email
            String sql = "SELECT * FROM profiles WHERE name LIKE ? OR student_id LIKE ? OR program LIKE ? OR email LIKE ?";
            
            PreparedStatement statement = conn.prepareStatement(sql);
            String searchPattern = "%" + keyword + "%";
            statement.setString(1, searchPattern);
            statement.setString(2, searchPattern);
            statement.setString(3, searchPattern);
            statement.setString(4, searchPattern);
            
            ResultSet result = statement.executeQuery();
            
            while (result.next()) {
                ProfileBean profile = new ProfileBean();
                profile.setId(result.getInt("id"));
                profile.setName(result.getString("name"));
                profile.setStudentId(result.getString("student_id"));
                profile.setProgram(result.getString("program"));
                profile.setEmail(result.getString("email"));
                // NEW: Fetch Hobbies and Intro for search results too
                profile.setHobbies(result.getString("hobbies"));
                profile.setIntro(result.getString("intro"));
                
                listProfile.add(profile);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) {}
        }
        
        request.setAttribute("listProfile", listProfile);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewProfiles.jsp");
        dispatcher.forward(request, response);
    }
}