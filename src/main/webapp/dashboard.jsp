<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bank.model.Account" %>
<%
    Account acc = (Account) session.getAttribute("account");
    if(acc == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
<h2>Welcome, <%= acc.getName() %>!</h2>
<p>Username: <%= acc.getUsername() %></p>
<p>Balance: $<%= acc.getBalance() %></p>

<a href="transaction.jsp">Make a Transaction</a> | 
<a href="logout">Logout</a>
</body>
</html>
