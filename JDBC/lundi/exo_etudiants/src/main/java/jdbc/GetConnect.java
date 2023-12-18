package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConnect {

    public static Connection getMySQLConnect() throws SQLException {

        String url = "jdbc:mysql://localhost:3306/db_etudiant";
        String id = "root";
        String passwrd = "admin";

        Connection connection = DriverManager.getConnection(url,id,passwrd);

        return connection;

    }

}
