package dao;

import models.Client;
import models.CompteBancaire;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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

        request = "INSERT INTO comptes (id_client,solde) VALUES (?,?)";
        statement = _connection.prepareStatement(request, Statement.RETURN_GENERATED_KEYS);
        statement.setInt(1,id_client);
        statement.setDouble(2,0.0);

        statement.execute();
        resultSet = statement.getGeneratedKeys();

        if (resultSet.next()) {
            return resultSet.getInt(1);
        }

        return 0 ;
    }


    @Override
    public boolean update(CompteBancaire compteBancaire) throws SQLException {

        return false;
    }


    public boolean updateSolde(CompteBancaire compteBancaire) throws SQLException {
        request = "UPDATE comptes SET solde = ? WHERE num_compte = ?";
        statement = _connection.prepareStatement(request);
        statement.setDouble(1,compteBancaire.getSolde());
        statement.setInt(2,compteBancaire.getNumero());

        int rows = statement.executeUpdate();

        return rows == 1;
    }



    @Override
    public CompteBancaire get(int numCompt) throws SQLException {
        CompteBancaire ret = null;
        request = "SELECT * FROM comptes WHERE num_compte = ?";
        statement = _connection.prepareStatement(request);
        statement.setInt(1,numCompt);

        resultSet = statement.executeQuery();

        if (resultSet.next()) {
            ret = new CompteBancaire(resultSet.getInt("num_compte"),
                    resultSet.getDouble("solde")) ;

        }

        return ret;
    }

    @Override
    public List<CompteBancaire> get() throws SQLException {

        ArrayList<CompteBancaire> ret = new ArrayList<>();

        request = "SELECT * FROM comptes";
        statement = _connection.prepareStatement(request);
        resultSet = statement.executeQuery();

        while (resultSet.next()){
            CompteBancaire compte = new CompteBancaire(
                    resultSet.getInt("num_compte"),
                    resultSet.getDouble("solde")
            );
            ret.add(compte);

        }

        return ret;
    }

    public ArrayList<CompteBancaire> getComptesClient(int idClient) throws SQLException {

        ArrayList<CompteBancaire> ret = new ArrayList<>();

        request = "SELECT * FROM comptes WHERE id_client = ?";
        statement = _connection.prepareStatement(request);
        statement.setInt(1,idClient);
        resultSet = statement.executeQuery();

        while (resultSet.next()){
            CompteBancaire compte = new CompteBancaire(
                    resultSet.getInt("num_compte"),
                    resultSet.getDouble("solde")
            );
            ret.add(compte);

        }


        return ret;

    }


}
