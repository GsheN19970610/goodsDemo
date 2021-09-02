package com.aty.domain;

public class Goods {
    private Integer goodId;
    private String goodName;
    private Double goodPrice;
    private Integer goodNum;
    private Integer goodType;
    private Integer userId;
    private String goodInfo;
    private GoodType goodTypes;
    private User user;

    public Goods() {
    }

    public Goods(Integer goodId, String goodName, Double goodPrice, Integer goodNum, Integer goodType, Integer userId, String goodInfo) {
        this.goodId = goodId;
        this.goodName = goodName;
        this.goodPrice = goodPrice;
        this.goodNum = goodNum;
        this.goodType = goodType;
        this.userId = userId;
        this.goodInfo = goodInfo;
    }


    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    public Double getGoodPrice() {
        return goodPrice;
    }

    public void setGoodPrice(Double goodPrice) {
        this.goodPrice = goodPrice;
    }

    public Integer getGoodNum() {
        return goodNum;
    }

    public void setGoodNum(Integer goodNum) {
        this.goodNum = goodNum;
    }

    public Integer getGoodType() {
        return goodType;
    }

    public void setGoodType(Integer goodType) {
        this.goodType = goodType;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getGoodInfo() {
        return goodInfo;
    }

    public void setGoodInfo(String goodInfo) {
        this.goodInfo = goodInfo;
    }


    public GoodType getGoodTypes() {
        return goodTypes;
    }

    public void setGoodTypes(GoodType goodTypes) {
        this.goodTypes = goodTypes;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodId=" + goodId +
                ", goodName='" + goodName + '\'' +
                ", goodPrice=" + goodPrice +
                ", goodNum=" + goodNum +
                ", goodType=" + goodType +
                ", userId=" + userId +
                ", goodInfo='" + goodInfo + '\'' +
                ", goodTypes=" + goodTypes +
                '}';
    }
}