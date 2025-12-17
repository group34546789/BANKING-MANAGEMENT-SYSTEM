<html>
<head><title>Login</title></head>
<body>
<h2>Login</h2>
<% if(request.getParameter("error") != null){ %>
    <p style="color:red">Invalid username or password</p>
<% } %>
<form action="login" method="post">
    Username: <input name="username" required><br>
    Password: <input type="password" name="password" required><br>
    <button>Login</button>
</form>
<a href="createAccount.jsp">Create Account</a>
</body>
</html>

