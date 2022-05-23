package com.group4.controller;

import com.group4.dao.playlist.PlaylistDAO;
import com.group4.dao.playlist.IPlaylistDAO;
import com.group4.dao.song.ISongDao;
import com.group4.dao.song.SongDAO;
import com.group4.model.Playlist;
import com.group4.model.Song;

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
    ISongDao songDao=new SongDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
//        try {
        switch (action) {
            case "create":
                showCreatePlaylist(request, response);
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
                showFindSongInPlaylist(request,response);
                break;

            default:
                try {
                  allPlaylist(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
//        }
//        catch (SQLException ex) {
//            throw new ServletException(ex);
//        }
    }

    private void showFindSongInPlaylist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Song> songList = playlistDAO.findAllSongInPlaylist(id);
        request.setAttribute("songList", songList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("playlist/listsonginplaylist.jsp");
        dispatcher.forward(request, response);

    }

    List<Song> findAllSongInPlaylist(List<Playlist> playlists) throws SQLException {
        List<Song> list=new ArrayList<>();
        for (int i=0;i<playlists.size();i++){
            Song song=songDao.findById(playlists.get(i).getSongId());
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
        List<Playlist> playlists = playlistDAO.findAll();
//        request.setAttribute("playlist", playlists);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("playlist/myplaylist.jsp.jsp");
//        dispatcher.forward(request, response);

    }

    private void showEditPlaylist(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Playlist playlist = playlistDAO.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("playlist/edit.jsp");
        request.setAttribute("playlist", playlist);
        dispatcher.forward(request, response);
    }

    private void showCreatePlaylist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("playlist/create.jsp");
        dispatcher.forward(request, response);

    }

    private void allPlaylist(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Playlist> playlists = playlistDAO.findAll();
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
//                case "delete":
//                    deletePlaylist(request, response);
//                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void updatePlaylist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
//
//        Playlist playlist = playlistDAO.findById(id);
        String namePlaylist = request.getParameter("namePlaylist");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String description = request.getParameter("description");
        int songQuantity = Integer.parseInt(request.getParameter("songQuantity"));
        int view = Integer.parseInt(request.getParameter("view"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        int songId = Integer.parseInt(request.getParameter("songId"));
        Playlist playlist = new Playlist(namePlaylist, typeId, description, songQuantity, view, userId, songId);

        playlistDAO.update(id, playlist);
        RequestDispatcher dispatcher = request.getRequestDispatcher("playlist/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void addPlaylist(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String namePlaylist = request.getParameter("namePlaylist");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String description = request.getParameter("description");
        int songQuantity = Integer.parseInt(request.getParameter("songQuantity"));
        int view = Integer.parseInt(request.getParameter("view"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        int songId = Integer.parseInt(request.getParameter("songId"));
        Playlist playlist = new Playlist(namePlaylist, typeId, description, songQuantity, view, userId, songId);
        playlistDAO.save(playlist);
        RequestDispatcher dispatcher = request.getRequestDispatcher("playlist/create.jsp");
        dispatcher.forward(request, response);

    }
}
