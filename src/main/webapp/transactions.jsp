<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bank.model.Transaction" %>
<%@ page import="com.bank.model.Account" %>

<%
    Account acc = (Account) session.getAttribute("account");
    if (acc == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Transaction> transactions =
            (List<Transaction>) request.getAttribute("transactions");
%>

<html>
<head>
    <title>Transaction History</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="form-container" style="max-width:900px;">
    <h2>Transaction History</h2>

    <table>
        <tr>
            <th>Type</th>
            <th>Amount</th>
            <th>Date</th>
        </tr>
        <%
            if (transactions != null && !transactions.isEmpty()) {
                for (Transaction t : transactions) {
        %>
        <tr>
            <td><%= t.getType() %></td>
            <td>$<%= t.getAmount() %></td>
            <td><%= t.getDate() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">No transactions found</td>
        </tr>
        <%
            }
        %>
    </table>

    <br>
    <a href="dashboard.jsp">← Back to Dashboard</a>
</div>
</body>
</html>
