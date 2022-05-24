package com.group4.dao.singer;

import com.group4.model.Singer;
import com.group4.model.User;

import javax.servlet.RequestDispatcher;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SingerDAO implements ISingerDAO {

    public static final String SELECT_ALL_SINGER = "select*from singers";
    public static final String INSERT_NEW_SINGER = "insert into singers(singerName,sex,dateOfBirth,typeId,story,userId,avatar) VALUES(?,?,?,?,?,?,?)";
    public static final String SELECT_BY_ID = "select * from singers where  id=?;";

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

    public SingerDAO() throws SQLException {
    }

    @Override
    public List<Singer> findAll() throws SQLException {
        List<Singer> singers = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SINGER)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String singerName = resultSet.getString("singerName");
                String sex = resultSet.getString("sex");
                String dateOfBirth = resultSet.getString("dateOfBirth");
                int typeId = resultSet.getInt("typeId");
                String story = resultSet.getString("story");
                int userId = resultSet.getInt("userId");
                String avatar = resultSet.getString("avatar");
                singers.add(new Singer(id, singerName, sex, dateOfBirth, typeId, story, userId, avatar));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
            return singers;
        }

    @Override
    public Singer findById(int id) {
        Singer singer = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String singerName = rs.getString("singerName");
                String sex = rs.getString("singerName");
                String dateOfBirth = rs.getString("dateOfBirth");
                int typeId = rs.getInt("typeId");
                String story = rs.getString("story");
                int userId = rs.getInt("userId");
                String avatar = rs.getString("avatar");
                singer = new Singer(id, singerName, sex, dateOfBirth, typeId, story, userId, avatar);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return singer;
    }


//    ResultSet  resultSet=preparedStatement.executeUpdate();


    @Override
    public void save(Singer singer) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_NEW_SINGER)) {
            preparedStatement.setString(1, singer.getSingerName());
            preparedStatement.setString(2, singer.getSex());
            preparedStatement.setString(3, singer.getDateOfBirth());
            preparedStatement.setInt(4, singer.getTypeId());
            preparedStatement.setString(5, singer.getStory());
            preparedStatement.setInt(6, 2);
            preparedStatement.setString(7, singer.getAvatar());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void delete(int id) {

    }

    @Override
    public void update(int id, Singer singer) {

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
