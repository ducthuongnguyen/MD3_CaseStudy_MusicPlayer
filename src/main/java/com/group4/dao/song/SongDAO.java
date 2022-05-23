package com.group4.dao.song;

import com.group4.model.Song;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SongDAO implements ISongDao {


    public SongDAO() {
    }

    private static final String SELECT_ALL_SONG = "select * from songs;";
    private static final String INSERT_SONG = "insert into songs(nameSong,description,mp3File,avatar,author,typeId,album) values (?,?,?,?,?,?,?);";
    private static final String SELECT_BY_ID = "select nameSong,singerId,userId,mp3File,description,avatar,author,album from songs where id =?;";
    private static final String DELETE_SONG = "delete from songs where id=?;";
    private static final String UPDATE_SONG_BY_ID = "update songs set nameSong=?,avatar =?,author =?,typeId=?,album=?,description =? where id = ?;";
    private static final String SELECT_LASTEST_SONG = "select nameSong,id from songs where id =(SELECT max(id) from songs);";

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

    @Override
    public List<Song> findAll() {
        List<Song> songs = new ArrayList<>();
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
            printSQLException(e);
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
                String description = rs.getString("description");
                String avatar = rs.getString("avatar");
                String author = rs.getString("author");
                String album = rs.getString("album");
                song = new Song(id, nameSong, singerId, userId, mp3File, description, avatar, author, album);
            }
        } catch (SQLException e) {
            printSQLException(e);
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
            printSQLException(e);
        }
    }

    @Override
    public void delete(int id) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SONG)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public void update(int id, Song song) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SONG_BY_ID)) {
            preparedStatement.setString(1, song.getNameSong());
            preparedStatement.setString(2, song.getAvatar());
            preparedStatement.setString(3, song.getAuthor());
            preparedStatement.setInt(4, song.getTypeId());
            preparedStatement.setString(5, song.getAlbum());
            preparedStatement.setString(6, song.getDescription());
            preparedStatement.setInt(7, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public Song findLastedSong(List<Song> songs) {
        Song song = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LASTEST_SONG)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nameSong = rs.getString("nameSong");
                song = new Song(id, nameSong);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return song;
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
