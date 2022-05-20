package com.group4.dao;

import java.util.List;

public interface IGeneralDAO<T> {
    List<T> findAll();

    List<T> findById(int id);

    void save(T t);

    void delete(int id);

    void update(int id, T t);

}
