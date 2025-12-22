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
    <title>Transaction</title>
</head>
<body>
<h2>Transaction</h2><h2>Sundas Marya</h2>
<form action="transaction" method="post">
    Amount: <input type="number" name="amount" step="0.01" required><br>
    Type:
    <select name="type">
        <option value="deposit">Deposit</option>
        <option value="withdraw">Withdraw</option>
    </select><br>
    <input type="submit" value="Submit">
</form>
<p style="color:red;">
    <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
</p>
<a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
