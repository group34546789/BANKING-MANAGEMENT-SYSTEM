package com.bank.dao;

import com.bank.model.Account;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

public class FakeBankDAO {

    private static final String ACCOUNTS_KEY = "accounts";

    // Get account map from session
    private static Map<String, Account> getAccounts(HttpSession session) {
        Map<String, Account> accounts =
                (Map<String, Account>) session.getAttribute(ACCOUNTS_KEY);

        if (accounts == null) {
            accounts = new HashMap<>();
            session.setAttribute(ACCOUNTS_KEY, accounts);
        }
        return accounts;
    }

    // Create account
    public static Account createAccount(
            HttpSession session,
            String name,
            String username,
            String password) {

        Map<String, Account> accounts = getAccounts(session);

        if (accounts.containsKey(username)) {
            return null;
        }

        Account acc = new Account(name, username, password, 0.0);
        accounts.put(username, acc);
        return acc;
    }

    // Login
    public static Account login(
            HttpSession session,
            String username,
            String password) {

        Map<String, Account> accounts = getAccounts(session);
        Account acc = accounts.get(username);

        if (acc != null && acc.getPassword().equals(password)) {
            return acc;
        }
        return null;
    }

    // Deposit
    public static void deposit(HttpSession session, Account acc, double amount) {
        acc.setBalance(acc.getBalance() + amount);
        getAccounts(session).put(acc.getUsername(), acc);
    }

    // Withdraw
    public static boolean withdraw(HttpSession session, Account acc, double amount) {
        if (acc.getBalance() >= amount) {
            acc.setBalance(acc.getBalance() - amount);
            getAccounts(session).put(acc.getUsername(), acc);
            return true;
        }
        return false;
    }
}
