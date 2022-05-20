package com.group4.model;

public class LikeSong {
    private int id;
    private int idUser;
    private int idSong;
    private int listenTime;
    private int status;

    public LikeSong() {
    }

    public LikeSong(int id, int idUser, int idSong, int listenTime, int status) {
        this.id = id;
        this.idUser = idUser;
        this.idSong = idSong;
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

    public int getIdSong() {
        return idSong;
    }

    public void setIdSong(int idSong) {
        this.idSong = idSong;
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
