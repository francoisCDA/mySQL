package org.example;


import org.example.utils.ConnectionUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {

        // connection à la base de données
        //String url = "jdbc:mysql://localhost:3306/jdbc_exemple";


/*
        Connection connection = null;

        try {

            connection = ConnectionUtils.getMySQLConnectJdbcExemple();

            if (connection != null) {
                System.out.println("connexion ok");
            } else {
                System.out.println("connexion fail");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
*/
        // meilleur pratique : mettre connection dans une class à part.


     //  AddData.addPerson();
     //  int id = AddData.addPersonSecureGetID();

        Select.getTable();


    }
}