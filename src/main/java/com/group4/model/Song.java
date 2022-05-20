package com.group4.model;

public class Song {
    private int id;
    private String nameSong;
    private String description;
    private String mp3File;
    private String avatar;
    private String author;
    private int typeId;
    private String album;
    private int view;
    private int userId;
    private int singerId;

    public Song() {
    }

    public Song(int id, String nameSong, String description, String mp3File, String avatar, String author, int typeId, String album, int view, int userId, int singerId) {
        this.id = id;
        this.nameSong = nameSong;
        this.description = description;
        this.mp3File = mp3File;
        this.avatar = avatar;
        this.author = author;
        this.typeId = typeId;
        this.album = album;
        this.view = view;
        this.userId = userId;
        this.singerId = singerId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameSong() {
        return nameSong;
    }

    public void setNameSong(String nameSong) {
        this.nameSong = nameSong;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMp3File() {
        return mp3File;
    }

    public void setMp3File(String mp3File) {
        this.mp3File = mp3File;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getAlbum() {
        return album;
    }

    public void setAlbum(String album) {
        this.album = album;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getSingerId() {
        return singerId;
    }

    public void setSingerId(int singerId) {
        this.singerId = singerId;
    }
}
