/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import model.*;
/**
 *
 * @author LENOVO
 */
public class AccountDAO {
public List<Account> getAllAccounts() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT userId, username, password, fullName, email, phone, avatar, role, createdAt FROM Accounts";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Account a = new Account();
                a.setUserId(rs.getInt("userId"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setFullName(rs.getString("fullName"));
                a.setEmail(rs.getString("email"));
                a.setPhone(rs.getString("phone"));
                a.setAvatar(rs.getString("avatar"));
                a.setRole(rs.getString("role"));
                a.setCreatedAt(rs.getTimestamp("createdAt"));
                list.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Xóa tài khoản theo userId
     */
    public boolean deleteAccount(int userId) {
        String sql = "DELETE FROM Accounts WHERE userId = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Đăng ký tài khoản mới
     */
    public boolean registerAccount(Account account) {
        String sql = "INSERT INTO Accounts(username, password, fullName, email, phone, avatar, role) VALUES(?,?,?,?,?,?,?)";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getFullName());
            ps.setString(4, account.getEmail());
            ps.setString(5, account.getPhone());
            ps.setString(6, account.getAvatar());
            ps.setString(7, account.getRole());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Lấy tài khoản theo username
     */
    public Account getAccountByUsername(String username) {
        String sql = "SELECT userId, username, password, fullName, email, phone, avatar, role, createdAt FROM Accounts WHERE username = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Account a = new Account();
                    a.setUserId(rs.getInt("userId"));
                    a.setUsername(rs.getString("username"));
                    a.setPassword(rs.getString("password"));
                    a.setFullName(rs.getString("fullName"));
                    a.setEmail(rs.getString("email"));
                    a.setPhone(rs.getString("phone"));
                    a.setAvatar(rs.getString("avatar"));
                    a.setRole(rs.getString("role"));
                    a.setCreatedAt(rs.getTimestamp("createdAt"));
                    return a;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Lấy tài khoản theo userId
     */
    public Account getAccountById(int userId) {
        String sql = "SELECT userId, username, password, fullName, email, phone, avatar, role, createdAt FROM Accounts WHERE userId = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Account a = new Account();
                    a.setUserId(rs.getInt("userId"));
                    a.setUsername(rs.getString("username"));
                    a.setPassword(rs.getString("password"));
                    a.setFullName(rs.getString("fullName"));
                    a.setEmail(rs.getString("email"));
                    a.setPhone(rs.getString("phone"));
                    a.setAvatar(rs.getString("avatar"));
                    a.setRole(rs.getString("role"));
                    a.setCreatedAt(rs.getTimestamp("createdAt"));
                    return a;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Cập nhật thông tin tài khoản
     */
    public boolean updateAccount(Account account) {
        String sql = "UPDATE Accounts SET username=?, password=?, fullName=?, email=?, phone=?, avatar=?, role=? WHERE userId=?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getFullName());
            ps.setString(4, account.getEmail());
            ps.setString(5, account.getPhone());
            ps.setString(6, account.getAvatar());
            ps.setString(7, account.getRole());
            ps.setInt(8, account.getUserId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
