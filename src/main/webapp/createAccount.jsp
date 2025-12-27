<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create Account</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="form-container">
    <h2>Create Account</h2>
    <form action="account" method="post">
        <label for="name">Full Name</label>
        <input type="text" name="name" id="name" placeholder="Enter your name" required>

        <label for="username">Username</label>
        <input type="text" name="username" id="username" placeholder="Enter username" required>

        <label for="password">Password</label>
        <input type="password" name="password" id="password" 
               placeholder="6-12 characters" 
               pattern=".{6,12}" 
               title="Password must be between 6 and 12 characters" 
               required>

        <input type="submit" value="Create Account">
    </form>

    <% if(request.getAttribute("error") != null){ %>
        <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>

    <div style="margin-top:15px;">
        <a href="login.jsp" class="button">Already have an account? Login</a>
    </div>
</div>
</body>
</html>

