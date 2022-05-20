package com.group4.dao.user;

import com.group4.model.User;

public interface IUserDAO {
    void login(String username, String password);

    void register(User user);

    void logout();
}
