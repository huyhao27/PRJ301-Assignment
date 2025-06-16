
package util;

import java.sql.*;
import java.util.*;
import java.util.logging.*;

public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            String usernameDB = "sa";
            String passwordDB = "123";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=SecondUniDB";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, usernameDB, passwordDB);
            System.out.println("Connected successfully!");
        } catch (Exception e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    } 
}
