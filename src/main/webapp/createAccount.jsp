<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Account</title>
</head>
<body>
<h2>Create Account</h2>
<form action="account" method="post">
    Name: <input type="text" name="name" required><br>
    Username: <input type="text" name="username" required><br>
    Password: <input type="password" name="password" required><br>
    <input type="submit" value="Create Account">
</form>
<p style="color:red;">
    <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
</p>
<a href="login.jsp">Already have an account? Login</a>
</body>
</html>
