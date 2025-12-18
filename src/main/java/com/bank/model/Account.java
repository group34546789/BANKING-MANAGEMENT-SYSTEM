/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bank.model;

public class Account {
    private String name;
    private String username;
    private String password;
    private double balance;

    public Account(String name, String username, String password, double balance){
        this.name = name;
        this.username = username;
        this.password = password;
        this.balance = balance;
    }

    public String getName() { return name; }
    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public double getBalance() { return balance; }

    public void setBalance(double balance) { this.balance = balance; }
}
