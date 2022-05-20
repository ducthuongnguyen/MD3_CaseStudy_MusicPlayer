package com.group4.model;

public class LikePlaylist {
    private int id;
    private int idUser;
    private int idPlaylist;
    private int listenTime;
    private int status;

    public LikePlaylist() {
    }

    public LikePlaylist(int id, int idUser, int idPlaylist, int listenTime, int status) {
        this.id = id;
        this.idUser = idUser;
        this.idPlaylist = idPlaylist;
        this.listenTime = listenTime;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdPlaylist() {
        return idPlaylist;
    }

    public void setIdPlaylist(int idPlaylist) {
        this.idPlaylist = idPlaylist;
    }

    public int getListenTime() {
        return listenTime;
    }

    public void setListenTime(int listenTime) {
        this.listenTime = listenTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
