package com.group4.model;

import java.time.LocalDate;

public class Singer {
    private int id;
    private String singerName;
    private String sex;
    private LocalDate dateOfBirth;
    private int typeId;
    private String story;
    private int userId;

    public Singer() {
    }

    public Singer(int id, String singerName, String sex, LocalDate dateOfBirth, int typeId, String story, int userId) {
        this.id = id;
        this.singerName = singerName;
        this.sex = sex;
        this.dateOfBirth = dateOfBirth;
        this.typeId = typeId;
        this.story = story;
        this.userId = userId;
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

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
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
}
