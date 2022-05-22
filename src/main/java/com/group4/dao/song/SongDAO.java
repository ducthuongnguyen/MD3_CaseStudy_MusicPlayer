package com.group4.dao.song;
import com.group4.model.Song;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SongDAO implements ISongDao {
    List<Song> songs;

    public SongDAO() {
        songs = new ArrayList<>();
    }

    private static final String SELECT_ALL_SONG = "select * from songs;";
    private static final String INSERT_SONG = "insert into songs(nameSong,description,mp3File,avatar,author,typeId,album) values (?,?,?,?,?,?,?);";
    private static final String SELECT_BY_ID = "select nameSong,singerId,userId,mp3File from songs where id =?;";
    private static final String DELETE_SONG ="delete from songs where id=?;";

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
        Song song = new Song();
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
                   song = new Song(id,nameSong,singerId,userId,mp3File,description);
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
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SONG)){
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
        }
    }

    @Override
    public void update(int id, Song song) {

    }
}
