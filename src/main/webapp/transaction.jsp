<%@ page contentType="text/html;charset=UTF-8" %>
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
    <title>New Transaction</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="form-container">
    <h2>New Transaction</h2>
    <form action="transaction" method="post">
        <label for="amount">Amount</label>
        <input type="number" name="amount" id="amount" step="0.01" required>

        <label for="type">Transaction Type</label>
        <select name="type" id="type">
            <option value="deposit">Deposit</option>
            <option value="withdraw">Withdraw</option>
        </select>

        <input type="submit" value="Submit">
    </form>

    <div style="margin-top:15px;">
        <a href="dashboard.jsp" class="button">Back to Dashboard</a>
    </div>
</div>
</body>
</html>

