package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public abstract class AbstrctDAO<T> {
    protected Connection _connection;
    protected PreparedStatement statement;
    protected String request;
    protected ResultSet resultSet;

    public AbstrctDAO(Connection connection){
        _connection = connection;
    }

    public abstract boolean add(T element) throws SQLException;
    public abstract boolean update(T element) throws SQLException;

   // public abstract boolean delete(T element) throws SQLException;
    public abstract T get(int id) throws SQLException;
    public abstract List<T> get() throws SQLException;

}