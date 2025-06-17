/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import model.*;
/**
 *
 * @author LENOVO
 */
public class PostDAO {
      /**
     * Lấy tất cả bài đăng
     */
    public ArrayList<Post> getAllPosts() {
        ArrayList<Post> list = new ArrayList<>();
        String sql = "SELECT postId, userId, title, content, createdAt FROM Posts";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Post p = new Post();
                p.setPostId(rs.getInt("postId"));
                p.setUserId(rs.getInt("userId"));
                p.setTitle(rs.getString("title"));
                p.setContent(rs.getString("content"));
                p.setCreatedAt(rs.getTimestamp("createdAt"));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Lấy danh sách bài đăng của một người dùng
     */
    public ArrayList<Post> getPostsByUser(int userId) {
        ArrayList<Post> list = new ArrayList<>();
        String sql = "SELECT postId, userId, title, content, createdAt FROM Posts WHERE userId = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Post p = new Post();
                    p.setPostId(rs.getInt("postId"));
                    p.setUserId(rs.getInt("userId"));
                    p.setTitle(rs.getString("title"));
                    p.setContent(rs.getString("content"));
                    p.setCreatedAt(rs.getTimestamp("createdAt"));
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Lấy bài đăng theo postId
     */
    public Post getPostById(int postId) {
        String sql = "SELECT postId, userId, title, content, createdAt FROM Posts WHERE postId = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, postId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Post p = new Post();
                    p.setPostId(rs.getInt("postId"));
                    p.setUserId(rs.getInt("userId"));
                    p.setTitle(rs.getString("title"));
                    p.setContent(rs.getString("content"));
                    p.setCreatedAt(rs.getTimestamp("createdAt"));
                    return p;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Thêm bài đăng mới
     */
    public boolean addPost(Post post) {
        String sql = "INSERT INTO Posts(userId, title, content) VALUES(?,?,?)";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, post.getUserId());
            ps.setString(2, post.getTitle());
            ps.setString(3, post.getContent());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Xóa bài đăng theo postId
     */
    public boolean deletePost(int postId) {
        String sql = "DELETE FROM Posts WHERE postId = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, postId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
