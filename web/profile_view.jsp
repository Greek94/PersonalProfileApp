<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My Profile</title>
        <style>
            body { font-family: sans-serif; background: #e0eafc; display: flex; justify-content: center; padding-top: 50px; }
            .card { background: white; width: 350px; padding: 20px; border-radius: 15px; text-align: center; box-shadow: 0 10px 20px rgba(0,0,0,0.1); }
            .avatar { width: 80px; height: 80px; background: #6c5ce7; border-radius: 50%; display: inline-block; color: white; line-height: 80px; font-size: 30px; margin-bottom: 15px; }
            h1 { margin: 0; color: #333; font-size: 24px; }
            p { color: #666; margin: 5px 0; }
            .badge { background: #ffeaa7; padding: 5px 10px; border-radius: 20px; font-size: 12px; color: #d63031; font-weight: bold; }
            .section { text-align: left; margin-top: 20px; background: #f8f9fa; padding: 10px; border-radius: 5px; }
        </style>
    </head>
    <body>
        <div class="card">
            <div class="avatar">${name.charAt(0)}</div>
            <h1>${name}</h1>
            <p>${studentId} | <span class="badge">${program}</span></p>
            <p>${email}</p>
            
            <div class="section">
                <strong>Hobbies:</strong>
                <p>${hobbies}</p>
            </div>
            
            <div class="section">
                <strong>About Me:</strong>
                <p><em>"${intro}"</em></p>
            </div>
        </div>
    </body>
</html>