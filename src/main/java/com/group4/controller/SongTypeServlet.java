package com.group4.controller;

import com.group4.dao.songtype.ISongTypeDAO;
import com.group4.dao.songtype.SongTypeDAO;
import com.group4.model.Song;
import com.group4.model.SongType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SongTypeServlet", value = "/songtypes")
public class SongTypeServlet extends HttpServlet {
    ISongTypeDAO songTypeDAO = new SongTypeDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("songs/create.jsp");
        List<SongType> types = null;
        try {
            types = songTypeDAO.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("types", types);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
