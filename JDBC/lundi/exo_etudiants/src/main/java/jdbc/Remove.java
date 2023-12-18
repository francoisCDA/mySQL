package jdbc;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class Remove {
    public static boolean fromId(int id) {
        Connection connection = null;

        boolean ret = false;

        try {
            connection = GetConnect.getMySQLConnect();

            Statement statement = connection.createStatement();
            String requete = "DELETE FROM etudiant WHERE id =" + id + ";";

            ret = statement.execute(requete);

            statement.close();

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
}
