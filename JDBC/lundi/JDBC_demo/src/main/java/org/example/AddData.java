package org.example;

import org.example.utils.ConnectionUtils;

import java.sql.*;
import java.util.Scanner;

public class AddData {

    private static Scanner scan = new Scanner(System.in);


    public static int addPersonSecureGetID() {
        Connection connection = null;
        String first,last ;
        int ret = 0 ;

        try {
            connection = ConnectionUtils.getMySQLConnectJdbcExemple();
            System.out.println("Saisir le prénom : ");
            first = scan.nextLine();
            System.out.println("Saisir le nom : ");
            last = scan.nextLine();

            // version avec PREPAREDSTATEMENT ET récupération de l'ID
            String question = "INSERT INTO person(first_name,last_name) VALUES ( ? , ? );";

            PreparedStatement statement = connection.prepareStatement(question, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1,first);
            statement.setString(2,last);

            int nbRows = statement.executeUpdate(); // retour int
            ResultSet resultSet = statement.getGeneratedKeys() ;

            System.out.println("Nb de ligne: " + nbRows);

            if (resultSet.next()) {
                ret = resultSet.getInt(1);
                System.out.println(ret);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {

            // fermer da connection à la bdd

            if (connection!= null) {
                try {
                    connection.close();
                    System.out.println("connexion fermée");
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }

        }

        return ret;

    }


    public static void addPersonSecure() {
        Connection connection = null;
        String first,last ;

        try {
            connection = ConnectionUtils.getMySQLConnectJdbcExemple();
            System.out.println("Saisir le prénom : ");
            first = scan.nextLine();
            System.out.println("Saisir le nom : ");
            last = scan.nextLine();

          // version avec PREPAREDSTATEMENT
            String question = "INSERT INTO person(first_name,last_name) VALUES ( ? , ? );";
            PreparedStatement statement = connection.prepareStatement(question);
            statement.setString(1,first);
            statement.setString(2,last);
            // statement.execute(); // rtour boolean
            int nbRows = statement.executeUpdate(); // retour int
            System.out.println("Nb de ligne: " + nbRows);


        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {

            // fermer da connection à la bdd

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


    public static void addPerson() {

        Connection connection = null;
        String first,last ;

        try {
            connection = ConnectionUtils.getMySQLConnectJdbcExemple();
            System.out.println("Saisir le prénom : ");
            first = scan.nextLine();
            System.out.println("Saisir le nom : ");
            last = scan.nextLine();

            String request = "INSERT INTO person(first_name,last_name) VALUES ('" + first +"','"+last+"');";

            // executer la requête sans retour

            Statement statement =connection.createStatement(); // le statement est créé à partir de la connection

            boolean re = statement.execute(request);

            System.out.println("Requête executée");
            System.out.println(re);


        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {

            // fermer da connection à la bdd

            if (connection!= null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }

        }


    }




}
