package com.bank.dao;

import com.bank.model.Account;
import java.util.HashMap;
import java.util.Map;

public class FakeBankDAO {

    // Store accounts in a HashMap
    private static Map<String, Account> accounts = new HashMap<>();

    // Create a new account
    public static Account createAccount(String name, String username, String password) {
        // Check if username already exists
        if(accounts.containsKey(username)){
            return null; // account creation failed
        }
        Account acc = new Account(name, username, password, 0.0);
        accounts.put(username, acc);
        return acc;
    }

    // Login
    public static Account login(String username, String password) {
        Account acc = accounts.get(username);
        if(acc != null && acc.getPassword().equals(password)) {
            return acc;
        }
        return null;
    }

    // Deposit money
    public static void deposit(Account acc, double amount) {
        acc.setBalance(acc.getBalance() + amount);
        accounts.put(acc.getUsername(), acc); // update the map
    }

    // Withdraw money
    public static boolean withdraw(Account acc, double amount) {
        if(acc.getBalance() >= amount) {
            acc.setBalance(acc.getBalance() - amount);
            accounts.put(acc.getUsername(), acc); // update the map
            return true;
        }
        return false; // insufficient balance
    }

    // Optional: get account by username
    public static Account getAccount(String username) {
        return accounts.get(username);
    }
}
