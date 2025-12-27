<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
<h2>Login</h2>
<div class="form-container">
    <form action="login" method="post">
        Username: <input type="text" name="username" required>
        Password: <input type="password" name="password" 
       pattern=".{6,12}" 
       title="Password must be between 6 and 12 characters" 
       required>

        <input type="submit" value="Login">
    </form>
</div>

<p style="color:red;">
    <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
</p>
<a href="createAccount.jsp">Create new account</a>
</body>
</html>
