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

    public Song(String nameSong, String avatar, int songId) {
        this.nameSong = nameSong;
        this.avatar = avatar;
        this.id = songId;
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

    public Song(String nameSong, String description, String mp3File, String avatar, String author, int typeId, String album) {
        this.nameSong = nameSong;
        this.description = description;
        this.mp3File = mp3File;
        this.avatar = avatar;
        this.author = author;
        this.typeId = typeId;
        this.album = album;
    }

    public Song(int id, String nameSong, int singerId, int userId, String mp3File, String description, String avatar, String author, String album) {
        this.id = id;
        this.nameSong = nameSong;
        this.userId = userId;
        this.singerId = singerId;
        this.mp3File = mp3File;
        this.description = description;
        this.avatar = avatar;
        this.author = author;
        this.album = album;
    }

    public Song(int id, String nameSong) {
        this.id = id;
        this.nameSong = nameSong;
    }

    public Song(int id, String nameSong, String avatar, String author, int typeId, String album, String description) {
        this.id = id;
        this.nameSong = nameSong;
        this.description = description;
        this.avatar = avatar;
        this.author = author;
        this.album = album;
        this.typeId = typeId;
    }

    public Song(String name, String des, String linkMp3, String author, int typeId, String album) {
        this.nameSong = name;
        this.description = des;
        this.mp3File = linkMp3;
        this.author = author;
        this.album = album;
        this.typeId = typeId;
    }

    public Song(int id, String nameSong, String author, int typeId, String album, String description) {
        this.id = id;
        this.nameSong = nameSong;
        this.description = description;
        this.author = author;
        this.album = album;
        this.typeId = typeId;
    }

    public Song(String nameSong, String avatar) {
        this.nameSong = nameSong;
        this.avatar = avatar;
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
