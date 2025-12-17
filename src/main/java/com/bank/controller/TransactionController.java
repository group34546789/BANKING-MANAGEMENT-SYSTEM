/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */



package com.bank.controller;

import com.bank.dao.FakeBankDAO;
import com.bank.model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class TransactionController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        Account acc = (Account) session.getAttribute("account");

        if(acc == null){
            res.sendRedirect("login.jsp");
            return;
        }

        double amount = Double.parseDouble(req.getParameter("amount"));
        String type = req.getParameter("type");

        if(type.equals("deposit")){
            acc.setBalance(acc.getBalance() + amount);
        } else if(type.equals("withdraw")){
            if(acc.getBalance() >= amount){
                acc.setBalance(acc.getBalance() - amount);
            } else {
                req.setAttribute("error", "Insufficient balance!");
                req.getRequestDispatcher("transaction.jsp").forward(req, res);
                return;
            }
        }

        new FakeBankDAO().updateAccount(acc);
        session.setAttribute("account", acc);

        res.sendRedirect("dashboard.jsp");
    }
}
