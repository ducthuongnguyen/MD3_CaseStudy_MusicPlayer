package com.group4.model;

import java.time.LocalDate;

public class Singer {
    private int id;
    private String singerName;
    private String sex;
    private String dateOfBirth;
    private int typeId;
    private String story;
    private int userId;
    private String avatar;

    public Singer() {
    }

    public Singer(int id, String singerName, String sex, String dateOfBirth, int typeId, String story, int userId, String avatar) {
        this.id = id;
        this.singerName = singerName;
        this.sex = sex;
        this.dateOfBirth = dateOfBirth;
        this.typeId = typeId;
        this.story = story;
        this.userId = userId;
        this.avatar = avatar;
    }

    public Singer(String singerName, String sex, String dateOfBirth, int typeId, String story, int userId, String avatar) {
        this.singerName = singerName;
        this.sex = sex;
        this.dateOfBirth = dateOfBirth;
        this.typeId = typeId;
        this.story = story;
        this.userId = userId;
        this.avatar = avatar;
    }

    public Singer(String singerName, String sex, String dateOfBirth, int typeId, String story, String avatar) {
        this.singerName = singerName;
        this.sex = sex;
        this.dateOfBirth = dateOfBirth;
        this.typeId = typeId;
        this.story = story;
        this.avatar = avatar;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSingerName() {
        return singerName;
    }

    public void setSingerName(String singerName) {
        this.singerName = singerName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getStory() {
        return story;
    }

    public void setStory(String story) {
        this.story = story;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
