package jdbc;

import Classe.Student;

import java.sql.*;
import java.util.ArrayList;

public class Select {

    public static ArrayList<Student> like(String search) {

        ArrayList<Student> ret = new ArrayList<>();
        Connection connection = null ;

        try {
            connection = GetConnect.getMySQLConnect();

            if (connection != null) {

                String requete = "SELECT * FROM etudiant WHERE first LIKE ? OR last LIKE ?";

                PreparedStatement statement = connection.prepareStatement(requete);
                statement.setString(1,"%"+search+"%");
                statement.setString(2,"%"+search+"%");

                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    Student newStudent = new Student(resultSet.getInt("id"),
                            resultSet.getString("last"),
                            resultSet.getString("first"),
                            resultSet.getInt("num_classe"),
                            resultSet.getDate("graduation").toLocalDate()
                    );

                    ret.add(newStudent);
                }
                statement.close();

            } else {
                System.out.println("connection null");
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

        return ret;

    }

    // DEPRECATED
    public static ArrayList<String> allString() {
        Connection connection = null;

        ArrayList<String> ret = new ArrayList<>();

        try {
             connection = GetConnect.getMySQLConnect();

             if (connection != null) {
                 Statement statement = connection.createStatement();
                 String requete = "SELECT * FROM etudiant";

                 ResultSet resultSet = statement.executeQuery(requete);

                 while (resultSet.next()) {

                     ret.add(resultSet.getInt("id") + " / "
                             + resultSet.getString("first") + " "
                             + resultSet.getString("last")
                             + ", classe : " + resultSet.getString("num_classe")
                             + ", date du diplôme " + resultSet.getString("graduation")
                             );
                 }
                 statement.close();

             } else {
                 System.out.println("!!! erreur de connexion");
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

        return ret;
    }

    public static ArrayList<Student> all() {
        Connection connection = null;

        ArrayList<Student> ret = new ArrayList<>();

        try {
            connection = GetConnect.getMySQLConnect();

            if (connection != null) {
                Statement statement = connection.createStatement();
                String requete = "SELECT * FROM etudiant";

                ResultSet resultSet = statement.executeQuery(requete);

                while (resultSet.next()) {

                    Student newStudent = new Student(resultSet.getInt("id"),
                            resultSet.getString("last"),
                            resultSet.getString("first"),
                            resultSet.getInt("num_classe"),
                            resultSet.getDate("graduation").toLocalDate()
                    );

                    ret.add(newStudent);

                }
                statement.close();

            } else {
                System.out.println("!!! erreur de connexion");
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

        return ret;
    }


    public static ArrayList<Student> classe(int numClass) {

        ArrayList<Student> classe = new ArrayList<Student>(all().stream().filter(stud -> stud.getNumClasse() == numClass).toList());

        return classe;

    }


}
