package dao;

import models.Operation;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class OperationDAO extends AbstrctDAO<Operation> {
    public OperationDAO(Connection connection) {
        super(connection);
    }

    @Override
    public boolean add(Operation op) throws SQLException {
        request = "INSERT INTO operations (compte,operation,valeur) VALUES (?,?,?)";
        statement = _connection.prepareStatement(request);
        statement.setInt(1,op.getNumero());
        statement.setString(2,op.getStatut().toString());
        statement.setDouble(3,op.getMontant());

        int rows = statement.executeUpdate();

        return rows == 1;
    }

    @Override
    public boolean update(Operation element) throws SQLException {
        return false;
    }

    @Override
    public Operation get(int id) throws SQLException {
        return null;
    }

    @Override
    public List<Operation> get() throws SQLException {
        return null;
    }
}
