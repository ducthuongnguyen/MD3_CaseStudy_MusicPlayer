package com.group4.dao.song;

import com.group4.dao.IGeneralDAO;
import com.group4.model.Song;

import java.sql.SQLException;
import java.util.List;

public interface ISongDao extends IGeneralDAO<Song> {
    public List<Song> searchByName(String name) throws SQLException;
}
