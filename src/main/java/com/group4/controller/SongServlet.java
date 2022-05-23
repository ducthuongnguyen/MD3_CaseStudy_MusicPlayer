package com.group4.controller;

import com.group4.dao.singer.ISingerDAO;
import com.group4.dao.singer.SingerDAO;
import com.group4.dao.song.ISongDao;
import com.group4.dao.song.SongDAO;
import com.group4.dao.songtype.ISongTypeDAO;
import com.group4.dao.songtype.SongTypeDAO;
import com.group4.model.Singer;
import com.group4.model.Song;
import com.group4.model.SongType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SongServlet", value = "/songs")
public class SongServlet extends HttpServlet {
    ISongDao songDao = new SongDAO();
    ISongTypeDAO songTypeDAO = new SongTypeDAO();
    ISingerDAO singerDAO = new SingerDAO();

    public SongServlet() throws SQLException {
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    showCreateForm(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "detail":
                try {
                    showSongDetail(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "edit":
                try {
                    showEditForm(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            default:
                try {
                    showSongList(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Song song = songDao.findById(id);
        List<SongType> typeList = songTypeDAO.findAll();
        request.setAttribute("types", typeList);
        List<Singer> singerList = singerDAO.findAll();
        request.setAttribute("singers",singerList);
        request.setAttribute("editSong", song);
        request.getRequestDispatcher("songs/edit.jsp").forward(request, response);
    }

    private void showSongDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Song> songs = songDao.findAll();
        Song song = songDao.findById(id);
        List<Singer> singerList = findAllSingers(songs);
        request.setAttribute("song", song);
        request.setAttribute("singers", singerList);
        request.getRequestDispatcher("songs/detail.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("songs/create.jsp");
        List<SongType> typeList = songTypeDAO.findAll();
        request.setAttribute("types", typeList);
        List<Singer> singerList = singerDAO.findAll();
        request.setAttribute("singers",singerList);
        dispatcher.forward(request, response);
    }

    private void showSongList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("songs/list.jsp");
        List<Song> songs = songDao.findAll();
        List<SongType> types = findAllSongTypes(songs);
        request.setAttribute("songList", songs);
        request.setAttribute("typeList", types);
        dispatcher.forward(request, response);
    }

    protected List<SongType> findAllSongTypes(List<Song> songs) throws SQLException {
        List<SongType> typeList = new ArrayList<>();
        for (int i = 0; i < songs.size(); i++) {
            SongType songType = songTypeDAO.findById(songs.get(i).getTypeId());
            typeList.add(songType);
        }
        return typeList;
    }

    protected List<Singer> findAllSingers(List<Song> songs) throws SQLException {
        List<Singer> singerList = new ArrayList<>();
        for (int i = 0; i < singerList.size(); i++) {
            Singer singer = singerDAO.findById(songs.get(i).getSingerId());
            singerList.add(singer);
        }
        return singerList;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    createSong(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "edit":
                editSong(request, response);
                break;
            default:
                try {
                    showSongList(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        }
    }

    //    update songs set nameSong=?,avatar =?,author =?,typeId=?,album=?,description =? where id = ?;
    private void editSong(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nameSong = request.getParameter("nameSong");
        String avatar = request.getParameter("avatar");
        String author = request.getParameter("author");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String album = request.getParameter("album");
        String description = request.getParameter("description");
        Song editSong = new Song(id, nameSong, avatar, author, typeId, album, description);
        songDao.update(id, editSong);
        request.getRequestDispatcher("songs/detail.jsp").forward(request, response);
    }

    private void createSong(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String name = request.getParameter("nameSong");
        String des = request.getParameter("description");
        String linkMp3 = request.getParameter("mp3File");
        String avatar = request.getParameter("avatar");
        String author = request.getParameter("author");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String album = request.getParameter("album");
        Song song = new Song(name, des, linkMp3, avatar, author, typeId, album);
        songDao.save(song);
        response.sendRedirect("/songs");
    }
}
