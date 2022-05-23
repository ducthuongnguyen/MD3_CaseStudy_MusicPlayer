package com.group4.dao.user;

import com.group4.model.User;

import java.sql.SQLException;

public interface IUserDAO {
    User login(String username, String password) throws SQLException;

    void register(User user) throws SQLException;

    void logout();
}
