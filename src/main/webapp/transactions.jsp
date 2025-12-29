<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.bank.model.Account" %>
<%@ page import="com.bank.model.Transaction" %>
<%@ page import="java.util.List" %>

<%
    Account acc = (Account) session.getAttribute("account");
    if(acc == null){
        response.sendRedirect("login.jsp");
        return;
    }
    List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
%>

<html>
<head>
    <title>Transaction History</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="form-container">
    <h2>Transaction Historey</h2>
    <table>
        <tr>
            <th>Type</th>
            <th>Amount</th>
            <th>Date</th>
        </tr>
        <% if(transactions != null && !transactions.isEmpty()){ 
            for(Transaction t : transactions){ %>
        <tr>
            <td><%= t.getType() %></td>
            <td>$<%= t.getAmount() %></td>
            <td><%= t.getDate() %></td>
        </tr>
        <% }} else { %>
        <tr>
            <td colspan="3">No transactions found</td>
        </tr>
        <% } %>
    </table>

    <div style="margin-top:15px;">
        <a href="dashboard.jsp" class="button">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
