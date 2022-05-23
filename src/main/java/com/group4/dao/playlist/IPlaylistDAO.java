package com.group4.dao.playlist;

import com.group4.dao.IGeneralDAO;
import com.group4.model.Playlist;
import com.group4.model.Song;

import java.sql.SQLException;
import java.util.List;

public interface IPlaylistDAO extends IGeneralDAO<Playlist> {
    List<Playlist> findPopular() throws SQLException;
    List<Song> findAllSongInPlaylist(int id);

}
