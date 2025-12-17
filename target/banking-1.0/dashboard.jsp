<%@ page import="com.bank.model.Account" %>
<%@ page session="true" %>
<%
    Account acc = (Account) session.getAttribute("account");
    if(acc == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head><title>Dashboard</title></head>
<body>
<h2>Welcome, <%= acc.getName() %>!</h2>
Balance: <%= acc.getBalance() %><br><br>

<a href="transaction.jsp">Deposit / Withdraw</a><br>
<a href="logout">Logout</a>
</body>
</html>

