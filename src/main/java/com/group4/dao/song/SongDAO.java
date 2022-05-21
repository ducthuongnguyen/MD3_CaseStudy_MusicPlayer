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

    private static final String SELECT_ALL_SONG = "select * from songs;";
    private static final String INSERT_SONG = "insert into songs(nameSong,description,mp3File,avatar,author,typeId,album) values (?,?,?,?,?,?,?);";
    private static final String SELECT_BY_ID = "select nameSong,singerId,userId,mp3File from songs where id =?;";


    @Override
    public List<Song> findAll() {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SONG)) {
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
    public Song findById(int id) {
        Song song = null;
            try (Connection connection = getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID)) {
                preparedStatement.setInt(1, id);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    String nameSong = rs.getString("nameSong");
                    int singerId = rs.getInt("singerId");
                    int userId = rs.getInt("userId");
                    String mp3File = rs.getString("mp3File");
                    song = new Song(id, nameSong,singerId,userId,mp3File);
                }
            } catch (SQLException e) {
            }
        return song;
    }

    @Override
    public void save(Song song) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SONG)) {
            preparedStatement.setString(1, song.getNameSong());
            preparedStatement.setString(2, song.getDescription());
            preparedStatement.setString(3, song.getMp3File());
            preparedStatement.setString(4, song.getAvatar());
            preparedStatement.setString(5, song.getAuthor());
            preparedStatement.setInt(6, song.getTypeId());
            preparedStatement.setString(7, song.getAlbum());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
        }
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void update(int id, Song song) {

    }
}
