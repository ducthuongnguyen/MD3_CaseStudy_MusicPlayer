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
                break;
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
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createSong(request, response);
                break;
            default:
                showSongList(request, response);
        }
    }

    private void createSong(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("nameSong");
        String des = request.getParameter("description");
        String linkMp3 = request.getParameter("mp3File");
        String avatar = request.getParameter("avatar");
        String author = request.getParameter("author");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String album = request.getParameter("album");
        Song song = new Song(name, des, linkMp3, avatar, author, typeId, album);
        songDao.save(song);
    }
}
