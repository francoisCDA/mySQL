package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddEtudiant {

    public static boolean add(String first, String last, int num, String date) {

        int nbRows = 0 ;

        try {
            Connection connection = GetConnect.getMySQLConnect();

            if (connection != null) {

                String request =  "INSERT INTO etudiant (first,last,num_classe,graduation) VALUES (?,?,?,?) ";

                PreparedStatement statement = connection.prepareStatement(request);
                statement.setString(1,first);
                statement.setString(2,last);
                statement.setInt(3,num);
                statement.setString(4,date);

                nbRows = statement.executeUpdate();


            } else {
                System.out.println(" !!! erreur de connexion");
            }



        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return nbRows != 0 ;
    }



}
