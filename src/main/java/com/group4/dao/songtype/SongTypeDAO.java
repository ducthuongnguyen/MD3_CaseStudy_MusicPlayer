package com.group4.dao.songtype;

import com.group4.model.Song;
import com.group4.model.SongType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SongTypeDAO implements ISongTypeDAO {
    public SongTypeDAO() {
    }

    private static final String SELECT_BY_ID = "select * from songtypes where id=?;";
    private static final String SELECT_ALL_TYPE = "select * from songtypes;";
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicplayer", "root", "123456");
        } catch (SQLException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<SongType> findAll() throws SQLException {
        List<SongType> types = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TYPE)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                types.add(new SongType(id,name));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return types;
    }

    @Override
    public SongType findById(int id) throws SQLException {
       SongType songType = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String typeName = rs.getString("name");
                songType = new SongType(id, typeName);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return songType;
    }

    @Override
    public void save(SongType songType) throws SQLException {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void update(int id, SongType songType) {

    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
