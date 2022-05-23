package com.group4.dao.playlist;

import com.group4.model.Playlist;
import com.group4.model.Song;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlaylistDAO implements IPlaylistDAO {
    private static final String SELECT_ALL_PLAYLIST = "select * from playlists;";
    private static final String SELECT_POPULAR_PLAYLIST = "select * from playlists order by view desc limit 6;";
    private static final String INSERT_PLAYLIST = "insert into playlists(namePlaylist,typeId,description,songQuantity,view,userId,songId) values (?,?,?,?,?,?,?);";
    private static final String UPDATE_PLAYLIST = "update playlists set namePlaylist=?,typeId=?,description=?,songQuantity=?,view=?,userId=?,songId=? where playlists.id=?;";
    private static final String DELETE_PLAYLIST = "delete from playlists where playlists.id=?;";
    private static final String FIND_BY_ID = "select *from playlists where id =?;";
    private static final String SELECT_ALL_SONG_IN_PLAYLIST = "select s.nameSong, s.avatar from  songs s join songtypes t on t.id = s.typeId join playlists pl on pl.typeId = s.typeId where pl.id=?;";
    private static final String SELECT_LASTEST_PLAYLIST = "select namePlaylist,id from playlists where id =(SELECT max(id) from playlists);";

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

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicplayer?useSSL=false", "root", "123456");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<Playlist> findAll() {
        List<Playlist> playlistServletList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PLAYLIST)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String namePlaylist = rs.getString("namePlaylist");
                int typeId = Integer.parseInt(rs.getString("typeId"));
                String description = rs.getString("description");
                int songQuantity = rs.getInt("songQuantity");
                int view = rs.getInt("view");
                int userId = rs.getInt("userId");
                int songId = rs.getInt("songId");
                playlistServletList.add(new Playlist(id, namePlaylist, typeId, description, songQuantity, view, userId, songId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return playlistServletList;
    }

    @Override
    public Playlist findById(int id) {
        Playlist playlist = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String namePlaylist = rs.getString("namePlaylist");
                int typeId = rs.getInt("typeId");
                String description = rs.getString("description");
                int songQuantity = rs.getInt("songQuantity");
                int view = rs.getInt("view");
                int userId = rs.getInt("userId");
                int songId = rs.getInt("songId");
                playlist = new Playlist(namePlaylist, typeId, description, songQuantity, view, userId, songId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return playlist;
    }

    @Override
    public List<Playlist> findPopular() throws SQLException {
        List<Playlist> playlistServletList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POPULAR_PLAYLIST)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String namePlaylist = rs.getString("namePlaylist");
                int typeId = Integer.parseInt(rs.getString("typeId"));
                String description = rs.getString("description");
                int songQuantity = rs.getInt("songQuantity");
                int view = rs.getInt("view");
                int userId = rs.getInt("userId");
                int songId = rs.getInt("songId");
                playlistServletList.add(new Playlist(id, namePlaylist, typeId, description, songQuantity, view, userId, songId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return playlistServletList;
    }

    @Override
    public void save(Playlist playlist) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PLAYLIST)) {
            preparedStatement.setString(1, playlist.getNamePlaylist());
            preparedStatement.setInt(2, playlist.getTypeId());
            preparedStatement.setString(3, playlist.getDescription());
            preparedStatement.setInt(4, playlist.getSongQuantity());
            preparedStatement.setInt(5, playlist.getView());
            preparedStatement.setInt(6, playlist.getUserId());
            preparedStatement.setInt(7, playlist.getSongId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public void delete(int id) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PLAYLIST)) {
            preparedStatement.setInt(1, id);
            int a = preparedStatement.executeUpdate();
            System.out.println(a);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(int id, Playlist playlist) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PLAYLIST)) {
            preparedStatement.setString(1, playlist.getNamePlaylist());
            preparedStatement.setInt(2, playlist.getTypeId());
            preparedStatement.setString(3, playlist.getDescription());
            preparedStatement.setInt(4, playlist.getSongQuantity());
            preparedStatement.setInt(5, playlist.getView());
            preparedStatement.setInt(6, playlist.getUserId());
            preparedStatement.setInt(7, playlist.getSongId());
            preparedStatement.setInt(8, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Song> findAllSongInPlaylist(int id) {
        List<Song> songList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SONG_IN_PLAYLIST)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String nameSong = rs.getString("nameSong");
                String avatar = rs.getString("avatar");
                songList.add(new Song(nameSong, avatar));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return songList;
    }

    @Override
    public Playlist findLatestPlaylist(List<Playlist> playlists) {
        Playlist playlist = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LASTEST_PLAYLIST)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String namePlaylist = rs.getString("namePlaylist");
                playlist = new Playlist(id, namePlaylist);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return playlist;
    }
}
