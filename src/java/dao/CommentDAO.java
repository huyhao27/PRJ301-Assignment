package dao;

import java.sql.*;
import java.util.*;
import model.Comment;
import util.DBContext;

public class CommentDAO extends DBContext {

    public ArrayList<Comment> getCommentsByPost(int postId) {
        ArrayList<Comment> list = new ArrayList<>();
        String sql = "SELECT * FROM Comments WHERE postId = ? ORDER BY createdAt ASC";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, postId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Comment(
                        rs.getInt("commentId"),
                        rs.getInt("postId"),
                        rs.getInt("userId"),
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

    public boolean addComment(Comment comment) {
        String sql = "INSERT INTO Comments (postId, userId, content) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, comment.getPostId());
            ps.setInt(2, comment.getUserId());
            ps.setString(3, comment.getContent());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteComment(int commentId) {
        String sql = "DELETE FROM Comments WHERE commentId = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, commentId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
} 
