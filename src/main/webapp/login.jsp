<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="form-container">
    <h2>Login</h2>
    <form action="login" method="post">
        <label for="username">Username</label>
        <input type="text" name="username" id="username" placeholder="Enter username" required>

        <label for="password">Password</label>
        <input type="password" name="password" id="password" placeholder="Enter password" required>

        <input type="submit" value="Login">
    </form>

    <% if(request.getAttribute("error") != null){ %>
        <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>

    <div style="margin-top:15px;">
        <a href="register.jsp" class="button">Create new account</a>
    </div>
</div>
</body>
</html>

