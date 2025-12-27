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

<!-- Balance Cards -->
<div class="cards-container">
    <div class="debit-card">
        <span>Debit Card</span>
        <span>$<%= acc.getBalance() %></span>
    </div>
    <div class="debit-card" style="background: linear-gradient(135deg, #00c6ff, #0072ff);">
        <span>Savings Card</span>
        <span>$5,968.00</span>
    </div>
</div>

<!-- Goals -->
<ul class="goals">
    <li>New iPhone <span>$1,099</span></li>
    <li>Health Checkup <span>$2,000</span></li>
</ul>

<!-- Transactions -->
<a href="transaction.jsp">Make a Transaction</a>

<!-- Fast Transfer -->
<div class="fast-transfer">
    <div class="contacts">
        <img src="user1.jpg" alt="User1">
        <img src="user2.jpg" alt="User2">
    </div>
    <input type="text" placeholder="Amount">
    <button>Transfer</button>
</div>

<!-- Investments -->
<ul class="investments">
    <li>Apple <span>$129.89</span></li>
    <li>Tesla <span>$210.93</span></li>
</ul>

<!-- Logout -->
<a href="logout">Logout</a>
</body>
</html>
