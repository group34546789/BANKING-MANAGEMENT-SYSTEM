/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


package com.bank.controller;

import com.bank.model.Account;
import com.bank.model.Transaction;
import com.bank.dao.FakeBankDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Date;

@WebServlet("/transaction")
public class TransactionController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");

        if (acc == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String type = request.getParameter("type"); // deposit / withdraw
        double amount = Double.parseDouble(request.getParameter("amount"));

        if ("deposit".equals(type)) {
            FakeBankDAO.deposit(session, acc, amount);
            acc.addTransaction(new Transaction("Deposit", amount, new Date()));
        } else if ("withdraw".equals(type)) {
            boolean success = FakeBankDAO.withdraw(session, acc, amount);
            if (!success) {
                request.setAttribute("error", "Insufficient balance!");
                request.getRequestDispatcher("transaction.jsp").forward(request, response);
                return;
            }
            acc.addTransaction(new Transaction("Withdraw", amount, new Date()));
        }

        session.setAttribute("account", acc);
        response.sendRedirect("dashboard.jsp");
    }
}

