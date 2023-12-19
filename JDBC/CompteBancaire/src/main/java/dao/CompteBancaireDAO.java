package dao;

import models.CompteBancaire;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class CompteBancaireDAO extends AbstrctDAO<CompteBancaire> {
    public CompteBancaireDAO(Connection connection) {
        super(connection);
    }

    @Override
    public boolean add(CompteBancaire compteBancaire) throws SQLException {
        request = "INSERT INTO comptes (id_client) VALUES (?)";
        statement = _connection.prepareStatement(request, Statement.RETURN_GENERATED_KEYS);

        // va t elle servir ???

        return false;
    }

    public int getNewCompteById(int id_client) throws SQLException {

        request = "INSERT INTO comptes (id_client) VALUES (?)";
        statement = _connection.prepareStatement(request, Statement.RETURN_GENERATED_KEYS);
        statement.setInt(1,id_client);

        statement.execute();
        resultSet = statement.getGeneratedKeys();

        if (resultSet.next()) {
            return resultSet.getInt(1);
        }

        return 0 ;
    }


    @Override
    public boolean update(CompteBancaire element) throws SQLException {

        return false;
    }





    @Override
    public CompteBancaire get(int numCompt) throws SQLException {
        CompteBancaire ret = null;
        request = "SELECT * FROM comptes WHERE id = ?";
        statement = _connection.prepareStatement(request);
        statement.setInt(1,numCompt);

        resultSet = statement.executeQuery();

        if (resultSet.next()) {
            ret = new CompteBancaire(resultSet.getInt("num_compt"),
                    resultSet.getDouble("solde")) ;

        }

        return ret;
    }

    @Override
    public List<CompteBancaire> get() throws SQLException {
        return null;
    }
}
