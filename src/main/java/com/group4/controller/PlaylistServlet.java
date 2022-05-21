package com.group4.controller;

import com.group4.dao.playlist.PlaylistDAO;
import com.group4.dao.playlist.IPlaylistDAO;
import com.group4.model.Playlist;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "PlaylistServlet", value = "/PlaylistServlet")
public class PlaylistServlet extends HttpServlet {
    IPlaylistDAO playlistDAO=new PlaylistDAO();

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
            default:
                try {
                    playlist(request, response);
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

    private void deletePlaylist(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        playlistDAO.delete(id);
        response.sendRedirect("/PlaylistServlet");
//        List<Playlist> playlists = playlistDAO.findAll();
//        request.setAttribute("playlist", playlists);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
//        dispatcher.forward(request, response);

    }

    private void showEditPlaylist(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Playlist playlist = playlistDAO.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("playlist/edit.jsp");
        request.setAttribute("playlistEdit", playlist);
        dispatcher.forward(request, response);
    }

    private void showCreatePlaylist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("playlist/create.jsp");
        dispatcher.forward(request, response);

    }

    private void playlist(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Playlist> playlists = playlistDAO.findAll();
        request.setAttribute("playlist", playlists);
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

    private void updatePlaylist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        String namePlaylist = request.getParameter("namePlaylist");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String description = request.getParameter("description");
        int songQuantity = Integer.parseInt(request.getParameter("songQuantity"));
        int view = Integer.parseInt(request.getParameter("view"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        int songId = Integer.parseInt(request.getParameter("songId"));
        Playlist playlist = new Playlist(namePlaylist, typeId, description, songQuantity, view, userId, songId);
        playlistDAO.update(playlist);
        RequestDispatcher dispatcher = request.getRequestDispatcher("playlist/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void addPlaylist(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
//        System.out.println("SAVEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
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
