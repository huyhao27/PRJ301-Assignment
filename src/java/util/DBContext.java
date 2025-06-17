package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    // Thay đổi thông tin kết nối để phù hợp với DBContext của bạn
    private static final String USERNAME_DB = "sa"; // User của bạn
    private static final String PASSWORD_DB = "12345"; // Password của bạn
    // Chú ý: databaseName=SecondUniDB như trong DBContext của bạn
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=SecondUniDB;encrypt=true;trustServerCertificate=true;";

    public DBContext() {
        try {
            // Đăng ký driver một lần khi khởi tạo DBContext
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, "SQL Server JDBC Driver not found!", ex);
            // Có thể throw RuntimeException ở đây nếu driver không tìm thấy, vì không thể tiếp tục
            throw new RuntimeException("Failed to load JDBC driver", ex);
        }
    }

    /**
     * Cung cấp một đối tượng Connection mới mỗi khi được gọi.
     * Điều này đảm bảo mỗi thao tác DAO sẽ có kết nối riêng và có thể được đóng an toàn.
     * @return Một đối tượng Connection đã được mở.
     * @throws SQLException Nếu có lỗi trong quá trình kết nối đến cơ sở dữ liệu.
     */
    public Connection getConnection() throws SQLException {
        Connection conn = DriverManager.getConnection(URL, USERNAME_DB, PASSWORD_DB);
        // Có thể bỏ dòng này trong môi trường production để tránh log quá nhiều
        System.out.println("Connected successfully!");
        return conn;
    }
}
