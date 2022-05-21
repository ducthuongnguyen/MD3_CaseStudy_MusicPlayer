package com.group4.dao.song;

import com.group4.config.DatabaseConnection;
import com.group4.model.Song;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.group4.config.DatabaseConnection.getConnection;

public class SongDAO implements ISongDao {
    List<Song> songs;

    public SongDAO() {
        songs = new ArrayList<>();
    }

    DatabaseConnection connection = new DatabaseConnection();


    @Override
    public List<Song> findAll() {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from songs;")) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("nameSong");
                String des = rs.getString("description");
                String link = rs.getString("mp3file");
                String avatar = rs.getString("avatar");
                String author = rs.getString("author");
                int typeId = rs.getInt("typeId");
                String album = rs.getString("album");
                int view = rs.getInt("view");
                int userId = rs.getInt("userId");
                int singerId = rs.getInt("singerId");
                songs.add(new Song(id, name, des, link, avatar, author, typeId, album, view, userId, singerId));
            }
        } catch (SQLException e) {
        }
        return songs;
    }

    @Override
    public List<Song> findById(int id) {
        return null;
    }

    @Override
    public void save(Song song) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void update(int id, Song song) {

    }
}
