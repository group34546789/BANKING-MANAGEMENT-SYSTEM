/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bank.dao;



import com.bank.model.Account;
import java.util.HashMap;
import java.util.Map;

public class FakeBankDAO {

    // In-memory account storage
    private static Map<String, Account> accounts = new HashMap<>();

    // Create new account
    public void createAccount(Account acc) {
        accounts.put(acc.getUsername(), acc);
    }

    // Login method
    public Account login(String username, String password) {
        Account acc = accounts.get(username);
        if(acc != null && acc.getPassword().equals(password)) {
            return acc;
        }
        return null;
    }

    // Update account after transaction
    public void updateAccount(Account acc) {
        accounts.put(acc.getUsername(), acc);
    }
}
