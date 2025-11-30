<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Profile</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="profile-card">
    <h2>My Personal Profile</h2>

    <p><b>Name:</b> ${name}</p>
    <p><b>Student ID:</b> ${studentID}</p>
    <p><b>Program:</b> ${program}</p>
    <p><b>Email:</b> ${email}</p>
    <p><b>Hobbies:</b> ${hobbies}</p>

    <div class="intro-section">
        <h3>About Me</h3>
        <p>${intro}</p>
    </div>

    <a href="index.html" class="back-btn">Back to Form</a>
</div>

</body>
</html>
