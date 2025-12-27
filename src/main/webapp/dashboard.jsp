<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.bank.model.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bank.model.Transaction" %>

<%
    Account acc = (Account) session.getAttribute("account");
    if(acc == null){
        response.sendRedirect("login.jsp");
        return;
    }
    List<Transaction> transactions = acc.getTransactions();
%>

<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="app">
    <div class="sidebar">
        <div class="logo">Banking System</div>
        <nav>
            <a href="dashboard.jsp" class="active">Dashboard</a>
            <a href="transaction.jsp">New Transaction</a>
            <a href="transactions">Transaction History</a>
            <a href="logout.jsp">Logout</a>
        </nav>
    </div>

    <div class="main">
        <div class="topbar">
            <h2>Welcome, <%= acc.getName() %></h2>
        </div>

        <div class="cards">
            <div class="balance-card green">
                <h3>Balance</h3>
                <p>$<%= acc.getBalance() %></p>
            </div>
            <div class="balance-card yellow">
                <h3>Total Transactions</h3>
                <p><%= transactions.size() %></p>
            </div>
        </div>

        <div style="text-align:center; margin-bottom:20px;">
            <a href="transaction.jsp" class="button">New Transaction</a>
            <a href="transactions" class="button">Transaction History</a>
        </div>

        <div class="chart">
            <canvas id="transactionChart" width="400" height="200"></canvas>
        </div>
    </div>
</div>

<script>
const ctx = document.getElementById('transactionChart').getContext('2d');

const labels = [
    <% for(int i = 0; i < transactions.size(); i++){ %>
        '<%= transactions.get(i).getDate() %>'<%= i < transactions.size() - 1 ? "," : "" %>
    <% } %>
];

const dataValues = [
    <% for(int i = 0; i < transactions.size(); i++){ %>
        <%= transactions.get(i).getAmount() %><%= i < transactions.size() - 1 ? "," : "" %>
    <% } %>
];

new Chart(ctx, {
    type: 'line',
    data: {
        labels: labels,
        datasets: [{
            label: 'Transaction Amount',
            data: dataValues,
            borderColor: '#FFD700',               // Gold
            backgroundColor: 'rgba(255,215,0,0.08)',
            borderWidth: 3,
            tension: 0.45,                        // Smooth curve
            fill: true,
            pointRadius: 4,
            pointHoverRadius: 6,
            pointBackgroundColor: '#FFD700',
            pointBorderColor: '#ffffff'
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                labels: {
                    color: '#FFD700',
                    font: { size: 14 }
                }
            }
        },
        scales: {
            x: {
                ticks: { color: '#bbb' },
                grid: { display: false }
            },
            y: {
                beginAtZero: true,
                ticks: { color: '#bbb' },
                grid: {
                    color: 'rgba(255,215,0,0.1)'
                }
            }
        }
    }
});
</script>

</body>
</html>
