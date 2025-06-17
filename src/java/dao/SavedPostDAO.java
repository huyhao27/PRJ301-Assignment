package dao;

import java.sql.*;
import java.util.*;
import model.Post;
import util.DBContext;

public class SavedPostDAO extends DBContext {

    public boolean savePost(int userId, int postId) {
        String sql = "INSERT INTO SavedPosts (userId, postId) VALUES (?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, postId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean unsavePost(int userId, int postId) {
        String sql = "DELETE FROM SavedPosts WHERE userId = ? AND postId = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, postId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList<Post> getSavedPostsByUser(int userId) {
        ArrayList<Post> list = new ArrayList<>();
        String sql = "SELECT p.* FROM SavedPosts s JOIN Posts p ON s.postId = p.postId WHERE s.userId = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Post(
                        rs.getInt("postId"),
                        rs.getInt("userId"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getTimestamp("createdAt")
                    ));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
} 
