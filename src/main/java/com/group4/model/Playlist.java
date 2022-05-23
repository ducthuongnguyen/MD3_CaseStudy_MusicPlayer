package com.group4.model;

public class Playlist {
    private int id;
    private String namePlaylist;
    private int typeId;
    private String description;
    private int songQuantity;
    private int view;
    private int userId;
    private int songId;

    public Playlist() {
    }

    public Playlist(int id, String namePlaylist, int typeId, String description, int songQuantity, int view, int userId, int songId) {
        this.id = id;
        this.namePlaylist = namePlaylist;
        this.typeId = typeId;
        this.description = description;
        this.songQuantity = songQuantity;
        this.view = view;
        this.userId = userId;
        this.songId = songId;
    }

    public Playlist(int id, String namePlaylist) {
        this.id = id;
        this.namePlaylist = namePlaylist;
    }

    public Playlist(String namePlaylist, int typeId, String description, int songQuantity, int view, int userId, int songId) {
        this.namePlaylist = namePlaylist;
        this.typeId = typeId;
        this.description = description;
        this.songQuantity = songQuantity;
        this.view = view;
        this.userId = userId;
        this.songId = songId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNamePlaylist() {
        return namePlaylist;
    }

    public void setNamePlaylist(String namePlaylist) {
        this.namePlaylist = namePlaylist;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getSongQuantity() {
        return songQuantity;
    }

    public void setSongQuantity(int songQuantity) {
        this.songQuantity = songQuantity;
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

    public int getSongId() {
        return songId;
    }

    public void setSongId(int songId) {
        this.songId = songId;
    }
}
