package com.group4.dao.playlist;

import com.group4.dao.IGeneralDAO;
import com.group4.model.Playlist;

import java.sql.SQLException;
import java.util.List;

public interface IPlaylistDAO extends IGeneralDAO<Playlist> {
    void update(Playlist playlist);
    List<Playlist> findPopular() throws SQLException;

}
