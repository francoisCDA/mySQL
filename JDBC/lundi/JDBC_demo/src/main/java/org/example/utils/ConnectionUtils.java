package org.example.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtils {

    public static Connection getMySQLConnection(String url, String id, String passwrd ) throws SQLException {

        Connection connection = DriverManager.getConnection(url,id,passwrd);

        if (connection != null) {
            System.out.println("connexion ok");
        } else {
            System.out.println("connexion fail");
        }

        return connection;

    }

    public static Connection getMySQLConnectJdbcExemple() throws SQLException {

        String url = "jdbc:mysql://localhost:3306/jdbc_exemple";
        String id = "root";
        String passwrd = "admin";

        Connection connection = DriverManager.getConnection(url,id,passwrd);

        return connection;

    }



}
