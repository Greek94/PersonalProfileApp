<%@page import="java.util.List"%>
<%@page import="com.models.ProfileBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>All Student Profiles</title>
        <style>
            body { font-family: 'Segoe UI', sans-serif; padding: 20px; background-color: #f4f4f9; }
            h1 { text-align: center; color: #012E6F; } /* UiTM Dark Blue */
            
            .container { 
                width: 95%; margin: 0 auto; background: white; padding: 20px; 
                box-shadow: 0 2px 5px rgba(0,0,0,0.1); border-radius: 8px; 
                border-top: 5px solid #753895; /* UiTM Purple Accent */
            }
            
            /* Navigation Bar */
            .nav-bar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; border-bottom: 2px solid #eee; padding-bottom: 15px; }
            
            /* "Add New" Button -> UiTM Gold (Accent) */
            .btn-add { 
                background-color: #D6C147; color: #333; padding: 8px 15px; 
                text-decoration: none; border-radius: 4px; font-weight: bold; 
            }
            .btn-add:hover { background-color: #c4b03a; }
            
            /* Search Box */
            .search-section { background: #e9ecef; padding: 15px; border-radius: 5px; margin-bottom: 20px; text-align: center; }
            .btn-search { background-color: #753895; color: white; border: none; padding: 6px 12px; cursor: pointer; border-radius: 3px; }
            .btn-search:hover { background-color: #52247f; }
            
            /* Table Header -> UiTM Dark Blue */
            table { width: 100%; border-collapse: collapse; font-size: 14px; }
            th { background-color: #012E6F; color: white; padding: 10px; text-align: left; }
            td { padding: 10px; border-bottom: 1px solid #ddd; }
            tr:hover { background-color: #f9f9fb; }
            
            /* Delete Button -> Red (Kept for safety) */
            .btn-delete { background-color: #dc3545; color: white; padding: 5px 10px; text-decoration: none; border-radius: 4px; font-size: 12px; }
            td.intro-col { max-width: 200px; word-wrap: break-word; }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="nav-bar">
                <h2>Student Directory</h2>
                <a href="index.html" class="btn-add">+ Add New Profile</a>
            </div>

            <div class="search-section">
                <form action="ProfileServlet" method="GET">
                    <input type="hidden" name="action" value="filter">
                    <label style="display:inline;"><strong>Search:</strong></label>
                    <input type="text" name="keyword" placeholder="Name, ID, Program, or Email..." required style="padding: 6px; width: 250px;">
                    <input type="submit" value="Filter" class="btn-search">
                    <a href="ProfileServlet" style="margin-left: 10px; text-decoration: none; color: #555;">[Reset]</a>
                </form>
            </div>
            
            <table>
                <thead>
                    <tr>
                        <th>ID</th> <th>Name</th> <th>Student ID</th> <th>Program</th> <th>Email</th> <th>Hobbies</th> <th>Intro</th> <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<ProfileBean> list = (List<ProfileBean>) request.getAttribute("listProfile");
                        if (list != null && !list.isEmpty()) {
                            for (ProfileBean p : list) {
                    %>
                    <tr>
                        <td><%= p.getId() %></td>
                        <td><%= p.getName() %></td>
                        <td><%= p.getStudentId() %></td>
                        <td><%= p.getProgram() %></td>
                        <td><%= p.getEmail() %></td>
                        <td><%= p.getHobbies() %></td>
                        <td class="intro-col"><%= p.getIntro() %></td>
                        <td>
                            <a href="ProfileServlet?action=delete&id=<%= p.getId() %>" class="btn-delete" onclick="return confirm('Delete this profile?');">Delete</a>
                        </td>
                    </tr>
                    <% 
                            }
                        } else {
                    %>
                    <tr><td colspan="8" style="text-align:center; padding: 20px;">No profiles found.</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>