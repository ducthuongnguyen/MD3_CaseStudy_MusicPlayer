package com.group4.controller;

import com.group4.dao.singer.SingerDAO;
import com.group4.model.Singer;
import com.group4.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.JarOutputStream;

@WebServlet(name = "SingerServlet", value = "/singers")
public class SingerServlet extends HttpServlet {
    SingerDAO singerDAO = new SingerDAO();

    public SingerServlet() throws SQLException {
    }

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
                try {
                    showListSinger(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void showListSinger(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("singer/list.jsp");
        List<Singer> singers = singerDAO.findAll();
        request.setAttribute("singers", singers);
        requestDispatcher.forward(request, response);

    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("singer/create.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:

                try {
                    createSinger(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void createSinger(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
//        singers = singerDAO.findAll();
        String nameSinger = request.getParameter("nameSinger");
        String sex = request.getParameter("sex");
        String dateOfBirth = request.getParameter("dateOfBirth");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String story = request.getParameter("story");
//        int userId = Integer.parseInt(request.getParameter("userId"));
        String avatar = request.getParameter("avatar");
        Singer singer = new Singer(nameSinger, sex, dateOfBirth, typeId, story, avatar);
//        for (int i=1;i<=singers.size();i++){
//            String x=singers.get(i).getSingerName();
//            if (singers.get(i).getSingerName().equals(nameSinger)&&
//                    singers.get(i).getSex().equals(sex)&&
//                    singers.get(i).getDateOfBirth().equals(dateOfBirth)&&
//                    singers.get(i).getTypeId()==typeId&&
//                    singers.get(i).getStory().equals(story)&&
////                    singers.get(i).getUserId()==userId&&
//                    singers.get(i).getAvatar().equals(avatar)
//            ){
//                String ms="This singer is already exited";
//                request.setAttribute("ms",ms);
//                RequestDispatcher requestDispatcher=request.getRequestDispatcher("singer/create.jsp");
//                requestDispatcher.forward(request,response);
//                showCreateForm(request,response);
//            }
//        }
        singerDAO.save(singer);
        response.sendRedirect("/index.jsp");
    }
}