package dao; 

import util.DBContext; 
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger; 
import model.Message;

public class MessageDAO {
    private DBContext dbContext;

    public MessageDAO() {
        this.dbContext = new DBContext();
    }

    /**
     * Retrieves all messages between two specific users (senderId and receiverId) in both directions.
     *
     * @param senderId   The ID of the sender.
     * @param receiverId The ID of the receiver.
     * @return An ArrayList containing Message objects, or an empty ArrayList if no messages are found.
     */
    public ArrayList<Message> getMessagesBetweenUsers(int senderId, int receiverId) {
        ArrayList<Message> messages = new ArrayList<>();
        // SQL query to retrieve messages between two users (A sent to B or B sent to A), ordered by sent time
        String sql = "SELECT messageId, senderId, receiverId, content, sentAt FROM Messages " +
                     "WHERE (senderId = ? AND receiverId = ?) OR (senderId = ? AND receiverId = ?) " +
                     "ORDER BY sentAt ASC";

        try (Connection conn = dbContext.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, senderId);
            pstmt.setInt(2, receiverId);
            pstmt.setInt(3, receiverId); 
            pstmt.setInt(4, senderId);  

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int messageId = rs.getInt("messageId");
                int msgSenderId = rs.getInt("senderId");
                int msgReceiverId = rs.getInt("receiverId");
                String content = rs.getString("content");
                // Convert Timestamp from SQL to Java 8+ LocalDateTime
                LocalDateTime sentAt = rs.getTimestamp("sentAt").toLocalDateTime();

                Message msg = new Message(messageId, msgSenderId, msgReceiverId, content, sentAt);
                messages.add(msg);
            }
        } catch (SQLException e) {
            Logger.getLogger(MessageDAO.class.getName()).log(Level.SEVERE, "Error retrieving messages between users", e);
        }
        return messages;
    }

    /**
     * Sends a new message into the database.
     *
     * @param msg The Message object containing message information (senderId, receiverId, content).
     * @return true if the message was sent successfully, false if an error occurred.
     */
    public boolean sendMessage(Message msg) {
        String sql = "INSERT INTO Messages (senderId, receiverId, content) VALUES (?, ?, ?)";

        try (Connection conn = dbContext.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, msg.getSenderId());
            pstmt.setInt(2, msg.getReceiverId());
            pstmt.setString(3, msg.getContent());

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0; 

        } catch (SQLException e) {
            Logger.getLogger(MessageDAO.class.getName()).log(Level.SEVERE, "Error sending message", e);
            return false;
        }
    }

    /**
     * Retrieves all messages related to a specific user (where the user is either the sender or the receiver).
     * This can be used to display a user's inbox or all their conversations.
     *
     * @param userId The ID of the user.
     * @return An ArrayList containing Message objects, or an empty ArrayList if no messages are found.
     */
    public ArrayList<Message> getInboxByUser(int userId) {
        ArrayList<Message> messages = new ArrayList<>();
        // SQL query to retrieve messages where the user is either the sender or receiver, ordered by time
        String sql = "SELECT messageId, senderId, receiverId, content, sentAt FROM Messages " +
                     "WHERE senderId = ? OR receiverId = ? " +
                     "ORDER BY sentAt DESC"; // Order in descending order for most recent messages first

        try (Connection conn = dbContext.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            pstmt.setInt(2, userId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int messageId = rs.getInt("messageId");
                int msgSenderId = rs.getInt("senderId");
                int msgReceiverId = rs.getInt("receiverId");
                String content = rs.getString("content");
                LocalDateTime sentAt = rs.getTimestamp("sentAt").toLocalDateTime();

                Message msg = new Message(messageId, msgSenderId, msgReceiverId, content, sentAt);
                messages.add(msg);
            }
        } catch (SQLException e) {
            Logger.getLogger(MessageDAO.class.getName()).log(Level.SEVERE, "Error retrieving user inbox", e);
        }
        return messages;
    }
}