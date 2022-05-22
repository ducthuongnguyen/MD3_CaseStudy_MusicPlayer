package com.group4.dao.singer;

import com.group4.config.DatabaseConnection;
import com.group4.model.Singer;
import com.group4.model.User;

import javax.servlet.RequestDispatcher;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SingerDAO<preparedStatement> implements ISingerDAO {
    //    public static void main(String[] args) throws SQLException {
//        List<Singer>singers=new SingerDAO().findAll();
//        System.out.println("size"+singers.size());
//        for (int i = 0; i <singers.size(); i++) {
//            System.out.println(singers.get(i).getSingerName());
//            System.out.println();
//        }
//    }
    Connection connection = DatabaseConnection.getConnection();
    public static final String SELECT_ALL_SINGER = "select*from singers";
    public static final String INSERT_NEW_SINGER = "insert into singers(singerName,sex,dateOfBirth,typeId,story,userId,avatar) VALUES(?,?,?,?,?,?,?)";


    public SingerDAO() throws SQLException {
    }

    @Override
    public List findAll() throws SQLException {
        List<Singer> singers = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_SINGER);
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
        return singers;
    }

    @Override
    public Singer findById(int id) {
        return null;
    }


//    ResultSet  resultSet=preparedStatement.executeUpdate();


    @Override
    public void save(Singer singer) {
        try {
            User user = new User();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_NEW_SINGER);
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

}
