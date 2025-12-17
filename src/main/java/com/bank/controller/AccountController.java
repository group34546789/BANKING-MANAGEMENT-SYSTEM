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
import java.io.IOException;

public class AccountController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        Account acc = new Account();
        acc.setName(req.getParameter("name"));
        acc.setUsername(req.getParameter("username"));
        acc.setPassword(req.getParameter("password"));
        acc.setBalance(0);

        new FakeBankDAO().createAccount(acc);
        res.sendRedirect("login.jsp"); // after creating account go to login
    }
}
