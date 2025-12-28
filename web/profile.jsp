<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Profile Saved</title>
        <style>
            body { font-family: 'Segoe UI', sans-serif; background-color: #f4f4f9; text-align: center; padding-top: 50px; }
            .card { 
                background: white; width: 400px; margin: 0 auto; padding: 30px; 
                border-radius: 10px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); 
                border-top: 5px solid #753895; /* UiTM Purple Accent */
            }
            h2 { color: #012E6F; }
            .info { text-align: left; margin-top: 20px; line-height: 1.6; color: #444; }
            
            .btn-container { margin-top: 25px; display: flex; justify-content: space-between; }
            .btn { text-decoration: none; padding: 10px 15px; color: white; border-radius: 5px; font-size: 14px; font-weight: bold; }
            
            /* View All -> UiTM Purple */
            .btn-view { background-color: #753895; } 
            .btn-view:hover { background-color: #52247f; }
            
            /* Back -> UiTM Gold */
            .btn-back { background-color: #D6C147; color: #333; }
            .btn-back:hover { background-color: #c4b03a; }
        </style>
    </head>
    <body>
        <div class="card">
            <h2>Success!</h2>
            <p>Profile saved to database.</p>
            
            <div class="info">
                <strong>Name:</strong> ${profile.name} <br>
                <strong>ID:</strong> ${profile.studentId} <br>
                <strong>Program:</strong> ${profile.program} <br>
                <strong>Email:</strong> ${profile.email} <br>
                <strong>Hobbies:</strong> ${profile.hobbies} <br>
                <strong>Introduction:</strong> ${profile.intro} <br>
            </div>
            
            <div class="btn-container">
                <a href="index.html" class="btn btn-back">&laquo; Back to Form</a>
                <a href="ProfileServlet" class="btn btn-view">View Directory &raquo;</a>
            </div>
        </div>
    </body>
</html>