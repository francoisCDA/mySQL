package org.example;

import org.example.utils.ConnectionUtils;

import java.sql.*;

public class Select {

    public static void getTable() {

        Connection connection = null;

        try {
            connection = ConnectionUtils.getMySQLConnectJdbcExemple();

            Statement statement = connection.createStatement();
            String request = "SELECT * FROM person";

            ResultSet resultSet = statement.executeQuery(request);

            while (resultSet.next()) {
                System.out.println(resultSet.getInt("id")+" ) " + resultSet.getString("first_name") + " " + resultSet.getString("last_name") );
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (connection!= null) {
                try {
                    connection.close();
                    System.out.println("connexion fermée");
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }


    }
}
