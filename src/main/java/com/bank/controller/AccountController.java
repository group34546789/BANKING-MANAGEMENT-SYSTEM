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

@WebServlet("/account")
public class AccountController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Account acc = FakeBankDAO.createAccount(
                request.getSession(),
                name,
                username,
                password
        );

        if (acc != null) {
            request.getSession().setAttribute("account", acc);
            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("error", "Username already exists!");
            request.getRequestDispatcher("createAccount.jsp")
                   .forward(request, response);
        }
    }
}
