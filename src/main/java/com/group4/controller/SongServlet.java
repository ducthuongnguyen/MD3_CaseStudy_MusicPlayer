package com.group4.controller;

import com.group4.dao.song.ISongDao;
import com.group4.dao.song.SongDAO;
import com.group4.model.Song;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SongServlet", value = "/songs")
public class SongServlet extends HttpServlet {
    ISongDao songDao = new SongDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            default:
                showSongList(request, response);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("songs/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showSongList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("songs/list.jsp");
        List<Song> songs = songDao.findAll();
        request.setAttribute("songList", songs);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
