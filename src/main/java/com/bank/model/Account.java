/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bank.model;


import java.util.ArrayList;
import java.util.List;
import com.bank.model.Transaction;

public class Account {
    private String name;
    private String username;
    private String password;
    private double balance;

    // NEW: List to store transactions
    private List<Transaction> transactions = new ArrayList<>();

    public Account(String name, String username, String password, double balance){
        this.name = name;
        this.username = username;
        this.password = password;
        this.balance = balance;
    }

    // Getters and setters
    public String getName() { return name; }
    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public double getBalance() { return balance; }

    public void setBalance(double balance) { this.balance = balance; }

    // NEW: transaction methods
    public List<Transaction> getTransactions() {
        return transactions;
    }

    public void addTransaction(Transaction transaction) {
        transactions.add(transaction);
    }
}
