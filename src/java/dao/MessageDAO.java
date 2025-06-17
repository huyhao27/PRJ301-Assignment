import util.DBContext; // Import DBContext của bạn
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger; // Import Logger
import model.Message;

public class MessageDAO {
    // Sử dụng instance của DBContext để lấy kết nối
    private DBContext dbContext;

    public MessageDAO() {
        this.dbContext = new DBContext();
    }

    /**
     * Lấy tất cả tin nhắn giữa hai người dùng (senderId và receiverId) theo cả hai chiều.
     *
     * @param senderId   ID của người gửi.
     * @param receiverId ID của người nhận.
     * @return ArrayList chứa các đối tượng Message, hoặc một ArrayList rỗng nếu không có tin nhắn nào.
     */
    public ArrayList<Message> getMessagesBetweenUsers(int senderId, int receiverId) {
        ArrayList<Message> messages = new ArrayList<>();
        // Truy vấn SQL để lấy tin nhắn giữa hai người dùng (A gửi B hoặc B gửi A), sắp xếp theo thời gian gửi
        String sql = "SELECT messageId, senderId, receiverId, content, sentAt FROM Messages " +
                     "WHERE (senderId = ? AND receiverId = ?) OR (senderId = ? AND receiverId = ?) " +
                     "ORDER BY sentAt ASC";

        try (Connection conn = dbContext.getConnection(); // Lấy kết nối từ DBContext
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, senderId);
            pstmt.setInt(2, receiverId);
            pstmt.setInt(3, receiverId); // Đảo ngược để lấy tin nhắn từ người nhận gửi lại người gửi
            pstmt.setInt(4, senderId);   // Đảo ngược

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int messageId = rs.getInt("messageId");
                int msgSenderId = rs.getInt("senderId");
                int msgReceiverId = rs.getInt("receiverId");
                String content = rs.getString("content");
                // Chuyển đổi Timestamp từ SQL sang LocalDateTime của Java 8+
                LocalDateTime sentAt = rs.getTimestamp("sentAt").toLocalDateTime();

                Message msg = new Message(messageId, msgSenderId, msgReceiverId, content, sentAt);
                messages.add(msg);
            }
        } catch (SQLException e) {
            Logger.getLogger(MessageDAO.class.getName()).log(Level.SEVERE, "Lỗi khi lấy tin nhắn giữa các người dùng", e);
        }
        return messages;
    }

    /**
     * Gửi một tin nhắn mới vào cơ sở dữ liệu.
     *
     * @param msg Đối tượng Message chứa thông tin tin nhắn (senderId, receiverId, content).
     * @return true nếu tin nhắn được gửi thành công, false nếu có lỗi.
     */
    public boolean sendMessage(Message msg) {
        // Truy vấn SQL để thêm tin nhắn mới.
        // sentAt được đặt mặc định là GETDATE() trong DB, nên không cần truyền vào đây.
        String sql = "INSERT INTO Messages (senderId, receiverId, content) VALUES (?, ?, ?)";

        try (Connection conn = dbContext.getConnection(); // Lấy kết nối từ DBContext
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, msg.getSenderId());
            pstmt.setInt(2, msg.getReceiverId());
            pstmt.setString(3, msg.getContent());

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0; // Trả về true nếu có ít nhất một hàng bị ảnh hưởng (đã chèn thành công)

        } catch (SQLException e) {
            Logger.getLogger(MessageDAO.class.getName()).log(Level.SEVERE, "Lỗi khi gửi tin nhắn", e);
            return false;
        }
    }

    /**
     * Lấy tất cả tin nhắn liên quan đến một người dùng cụ thể (người đó là người gửi hoặc người nhận).
     * Điều này có thể được dùng để hiển thị hộp thư đến hoặc tất cả các cuộc hội thoại của người dùng.
     *
     * @param userId ID của người dùng.
     * @return ArrayList chứa các đối tượng Message, hoặc một ArrayList rỗng nếu không có tin nhắn nào.
     */
    public ArrayList<Message> getInboxByUser(int userId) {
        ArrayList<Message> messages = new ArrayList<>();
        // Truy vấn SQL để lấy tin nhắn mà người dùng là sender hoặc receiver, sắp xếp theo thời gian
        String sql = "SELECT messageId, senderId, receiverId, content, sentAt FROM Messages " +
                     "WHERE senderId = ? OR receiverId = ? " +
                     "ORDER BY sentAt DESC"; // Sắp xếp giảm dần để tin nhắn mới nhất lên đầu

        try (Connection conn = dbContext.getConnection(); // Lấy kết nối từ DBContext
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
            Logger.getLogger(MessageDAO.class.getName()).log(Level.SEVERE, "Lỗi khi lấy hộp thư đến của người dùng", e);
        }
        return messages;
    }
}
