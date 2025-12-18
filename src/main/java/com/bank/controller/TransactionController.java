/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */



package com.bank.controller;

import com.bank.model.Account;
import com.bank.dao.FakeBankDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/transaction")
public class TransactionController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");

        if(acc == null){
            response.sendRedirect("login.jsp");
            return;
        }

        double amount = Double.parseDouble(request.getParameter("amount"));
        String type = request.getParameter("type");
        String error = null;

        if("deposit".equals(type)){
            FakeBankDAO.deposit(acc, amount);
        } else if("withdraw".equals(type)){
            if(!FakeBankDAO.withdraw(acc, amount)){
                error = "Insufficient balance!";
            }
        }

        if(error != null){
            request.setAttribute("error", error);
            request.getRequestDispatcher("transaction.jsp").forward(request, response);
        } else {
            response.sendRedirect("dashboard.jsp");
        }
    }
}
