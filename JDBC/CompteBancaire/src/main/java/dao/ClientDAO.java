package dao;

import models.Client;

import java.lang.ref.Cleaner;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ClientDAO extends AbstrctDAO<Client>{
    public ClientDAO(Connection connection) {
        super(connection);
    }

    @Override
    public boolean add(Client client) throws SQLException {
        request = "INSERT INTO clients (first,last,telephone) VALUES (?,?,?)";
        statement = _connection.prepareStatement(request, Statement.RETURN_GENERATED_KEYS);
        statement.setString(1,client.getPrenom());
        statement.setString(2,client.getNom());
        statement.setString(3,client.getTelephone());

        int rows = statement.executeUpdate();
        resultSet = statement.getGeneratedKeys();

        if (resultSet.next()){
            client.setId(resultSet.getInt(1));
        }

        return rows>0;
    }

    @Override
    public boolean update(Client client) throws SQLException {
        request = "UPDATE clients SET first = ?, last = ?, telephone = ? WHERE id = ?";
        statement = _connection.prepareStatement(request);
        statement.setString(1, client.getPrenom());
        statement.setString(2, client.getNom());
        statement.setString(3, client.getTelephone());
        statement.setInt(4, client.getId());

        int rows = statement.executeUpdate();

        return rows>0;
    }

    @Override
    public Client get(int id) throws SQLException {
        Client ret = null;
        request = "SELECT * FROM clients WHERE id  = ?";
        statement.setInt(1,id);
        resultSet = statement.executeQuery();

        if (resultSet.next()){
            ret = new Client(resultSet.getInt("id"),
                    resultSet.getString("last"),
                    resultSet.getString("first"),
                    resultSet.getString("telephone")
                    );
        }

        return ret;
    }

    @Override
    public List<Client> get() throws SQLException {
        ArrayList<Client> ret = new ArrayList<>();

        request = "SELECT * FROM clients";
        statement = _connection.prepareStatement(request);
        resultSet = statement.executeQuery();

        while (resultSet.next()) {
            Client client = new Client(resultSet.getInt("id"),
                    resultSet.getString("last"),
                    resultSet.getString("first"),
                    resultSet.getString("telephone")
            );
            ret.add(client);
        }


        return ret;
    }
}
