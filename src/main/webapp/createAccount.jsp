<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Account</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h2>Create Account</h2>

<div class="form-container">
    <form action="account" method="post">
        Name: <input type="text" name="name" required>
        Username: <input type="text" name="username" required>
        Password: <input type="password" name="password" required>
        <input type="submit" value="Create Account">
    </form>
</div>

<p style="color:red;">
    <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
</p>

<a href="login.jsp">Already have an account? Login</a>
</body>
</html>
