package com.group4.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static Connection connection;
    public static final String URL = "jdbc:mysql://localhost:3306/musicplayer";
    public static final String USER = "root";
    public static final String PASSWORD = "123456";

    public DatabaseConnection() {
    }

    public static Connection getConnection() {
        if (connection == null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    connection = DriverManager.getConnection(URL, USER, PASSWORD);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        return connection;
    }
}
