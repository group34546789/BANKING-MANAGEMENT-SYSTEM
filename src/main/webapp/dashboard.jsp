<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.bank.model.Account" %>
<%
Account acc = (Account) session.getAttribute("account");
if (acc == null) {
response.sendRedirect("login.jsp");
return;
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Bank Dashboard</title>
<link rel="stylesheet" href="css/dashboard.css">
</head>
<body>


<div class="app">


<!-- Sidebar -->
<aside class="sidebar">
<h2 class="logo">VoloBank</h2>
<nav>
<a class="active">Dashboard</a>
<a href="transaction.jsp">Transfer</a>
<a href="transactions">Transactions</a>
<a href="logout">Logout</a>
</nav>
</aside>


<!-- Main Content -->
<main class="main">
<header class="topbar">
<h3>Welcome, <%= acc.getName() %></h3>
</header>


<!-- Cards -->
<section class="cards">
<div class="balance-card yellow">
<p>Current Balance</p>
<h1>$<%= acc.getBalance() %></h1>
</div>


<div class="balance-card green">
<p>Username</p>
<h2><%= acc.getUsername() %></h2>
</div>
</section>


<!-- Analytics Placeholder -->
<section class="chart">
<h4>Account Activity</h4>
<p>(Chart integration later – Chart.js recommended)</p>
</section>
</main>


</div>
</body>
</html>
