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
<head><title>Transaction</title></head>
<body>
<h2>Deposit / Withdraw</h2>

<% if(request.getAttribute("error") != null){ %>
    <p style="color:red"><%= request.getAttribute("error") %></p>
<% } %>

<form action="transaction" method="post">
    Amount: <input name="amount" required><br>
    <select name="type">
        <option value="deposit">Deposit</option>
        <option value="withdraw">Withdraw</option>
    </select>
    <button>Submit</button>
</form>

<a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
