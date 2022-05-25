package com.group4.controller;

import com.group4.dao.playlist.PlaylistDAO;
import com.group4.dao.playlist.IPlaylistDAO;
import com.group4.dao.singer.ISingerDAO;
import com.group4.dao.singer.SingerDAO;
import com.group4.dao.song.ISongDao;
import com.group4.dao.song.SongDAO;
import com.group4.dao.songtype.ISongTypeDAO;
import com.group4.dao.songtype.SongTypeDAO;
import com.group4.model.Playlist;
import com.group4.model.Singer;
import com.group4.model.Song;
import com.group4.model.SongType;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PlaylistServlet", value = "/PlaylistServlet")
public class PlaylistServlet extends HttpServlet {
    IPlaylistDAO playlistDAO = new PlaylistDAO();
    ISongDao songDao = new SongDAO();
    ISongTypeDAO songTypeDAO = new SongTypeDAO();
    ISingerDAO singerDAO = new SingerDAO();

    public PlaylistServlet() throws SQLException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
//        try {
        switch (action) {
            case "create":
                try {
                    showCreatePlaylist(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "edit":
                try {
                    showEditPlaylist(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                try {
                    deletePlaylist(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "popular":
                try {
                    showPopularPlaylist(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "findSongPlaylist":
                showFindSongInPlaylist(request, response);
                break;
            case "search":
                searchByName(request, response);
                break;
            case "detail":
                try {
                    showSongDetail(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            default:
                try {
                    allPlaylist(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void showSongDetail(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Song song = songDao.findById(id);
        request.setAttribute("song", song);
        request.setAttribute("singers", findSinger(song));
        response.sendRedirect("songs/detail.jsp");
//        request.getRequestDispatcher("songs/detail.jsp").forward(request, response);
    }

    protected Singer findSinger(Song song) throws SQLException {
        Singer singer = new Singer();
        List<Singer> singerList = singerDAO.findAll();
        for (int i = 0; i < singerList.size(); i++) {
            if (singerList.get(i).getId() == song.getSingerId())
                return singerList.get(i);
        }
        return singer;
    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Playlist> playlists = playlistDAO.findByName(name);
        request.setAttribute("playlists", playlists);
        RequestDispatcher dispatcher = request.getRequestDispatcher("playlist/search.jsp");
        dispatcher.forward(request, response);

    }

    private void showFindSongInPlaylist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Song> songList = playlistDAO.findAllSongInPlaylist(id);
        request.setAttribute("songList", songList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("playlist/listsonginplaylist.jsp");
        dispatcher.forward(request, response);

    }

    List<Song> findAllSongInPlaylist(List<Playlist> playlists) throws SQLException {
        List<Song> list = new ArrayList<>();
        for (int i = 0; i < playlists.size(); i++) {
            Song song = songDao.findById(playlists.get(i).getSongId());
            list.add(song);
        }
        return list;
    }


    private void showPopularPlaylist(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Playlist> playlists = playlistDAO.findPopular();
        request.setAttribute("playlist", playlists);
        RequestDispatcher dispatcher = request.getRequestDispatcher("playlist/popular.jsp");
        dispatcher.forward(request, response);
    }

    private void deletePlaylist(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        playlistDAO.delete(id);
        response.sendRedirect("/PlaylistServlet");

    }

    private void showEditPlaylist(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Playlist playlist = playlistDAO.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("playlist/edit.jsp");
        List<Song> songs = songDao.findAll();
        request.setAttribute("playlists", songs);
        List<SongType> typeList = songTypeDAO.findAll();
        request.setAttribute("typeList", typeList);
        request.setAttribute("playlist", playlist);
        dispatcher.forward(request, response);
    }

    private void showCreatePlaylist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("playlist/create.jsp");
        List<Song> songs = songDao.findAll();
        request.setAttribute("playlists", songs);
        List<SongType> typeList = songTypeDAO.findAll();
        request.setAttribute("typeList", typeList);
        dispatcher.forward(request, response);

    }

    private void allPlaylist(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        List<Playlist> playlists = new ArrayList<>();
        if (name != null && name != "") {
            playlists = playlistDAO.findByName(name);
        } else {
            playlists = playlistDAO.findAll();
        }
        List<Song> songList = findAllSongInPlaylist(playlists);
        request.setAttribute("playlist", playlists);
        request.setAttribute("songlist", songList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("playlist/myplaylist.jsp");
        dispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    addPlaylist(request, response);
                    break;
                case "edit":
                    updatePlaylist(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void updatePlaylist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String namePlaylist = request.getParameter("namePlaylist");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String description = request.getParameter("description");
        Playlist playlist = new Playlist(namePlaylist, typeId, description);
        playlistDAO.update(id, playlist);
        response.sendRedirect("/PlaylistServlet");
    }

    private void addPlaylist(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String namePlaylist = request.getParameter("namePlaylist");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String description = request.getParameter("description");
        Playlist playlist = new Playlist(namePlaylist, typeId, description);
        playlistDAO.save(playlist);
        response.sendRedirect("/PlaylistServlet");

    }
}
