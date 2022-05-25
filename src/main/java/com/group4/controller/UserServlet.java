package com.group4.controller;

import com.group4.dao.playlist.IPlaylistDAO;
import com.group4.dao.playlist.PlaylistDAO;
import com.group4.dao.song.ISongDao;
import com.group4.dao.song.SongDAO;
import com.group4.dao.user.UserDAO;
import com.group4.model.Playlist;
import com.group4.model.Song;
import com.group4.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {
    ISongDao songDao = new SongDAO();
    IPlaylistDAO playlistDAO = new PlaylistDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "register":
                showRegisterForm(request, response);
                break;
            case "login":
                showLoginForm(request, response);
                break;
            case "logout":
                try {
                    logOut(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void logOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        session.removeAttribute("acc");
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        Song song = songDao.findLastedSong(songDao.findAll());
        Playlist playlist = playlistDAO.findLatestPlaylist(playlistDAO.findAll());
        request.setAttribute("latestSong", song);
        request.setAttribute("latestPlaylist", playlist);
        dispatcher.forward(request, response);

    }

    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/register.jsp");
        dispatcher.forward(request, response);
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("user/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "register":
                    registerUser(request, response);
                    break;
                case "login":
                    loginAccount(request, response);
                    break;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repass = request.getParameter("repass");
        String telephoneNo = request.getParameter("telephoneNo");
        User newUser = new User(username, password, telephoneNo);
        if (password.length() > 10 || password.length() < 0) {
            String mess = "Wrong password syntax.";
            request.setAttribute("mess5", mess);
            request.getRequestDispatcher("user/register.jsp").forward(request, response);
        }

        if (!password.equals(repass)) {
            String mess = "Wrong password.";
            request.setAttribute("mess2", mess);
            request.getRequestDispatcher("user/register.jsp").forward(request, response);
        } else {
            if (telephoneNo.length() > 10 || telephoneNo.length() == 0) {
                String mess1 = "Wrong telephone number format!!!! Max number are 10.";
                request.setAttribute("mess4", mess1);
                request.getRequestDispatcher("user/register.jsp").forward(request, response);
            } else if (username.length() == 0) {
                String mess = "Please input username";
                request.setAttribute("mess6", mess);
                request.getRequestDispatcher("user/register.jsp").forward(request, response);
            } else {
                UserDAO userDAO = new UserDAO();
                User user = userDAO.checkUserExist(username);
                if (user == null) {
                    userDAO.register(newUser);
                    request.getRequestDispatcher("user/login.jsp").forward(request, response);
                } else {
                    String mess = "This username has been exist. Please try again!";
                    request.setAttribute("mess3", mess);
                    request.getRequestDispatcher("user/register.jsp").forward(request, response);
                }
            }
        }
    }

    private void loginAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDAO userDAO = new UserDAO();
        User user = userDAO.login(username, password);
        if (user == null) {
            String mess = "Sign in failed. Please sign in again!!!";
            request.setAttribute("mess", mess);
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/login.jsp");
            dispatcher.forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("acc", user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            Song song = songDao.findLastedSong(songDao.findAll());
            Playlist playlist = playlistDAO.findLatestPlaylist(playlistDAO.findAll());
            request.setAttribute("latestSong", song);
            request.setAttribute("latestPlaylist", playlist);
            dispatcher.forward(request, response);
        }
    }
}
