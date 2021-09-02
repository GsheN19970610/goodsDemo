package com.aty.domain;

import java.util.Date;

public class Operation {
    private Integer id;
    private Integer userId;
    private String goodName;
    private Integer operationType;
    private Integer operationNum;
    private Date operationTime;
    private User user;

    public Operation() {
    }

    public Operation(Integer id, Integer userId, String goodName, Integer operationType, Integer operationNum, Date operationTime) {
        this.id = id;
        this.userId = userId;
        this.goodName = goodName;
        this.operationType = operationType;
        this.operationNum = operationNum;
        this.operationTime = operationTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    public Integer getOperationType() {
        return operationType;
    }

    public void setOperationType(Integer operationType) {
        this.operationType = operationType;
    }

    public Integer getOperationNum() {
        return operationNum;
    }

    public void setOperationNum(Integer operationNum) {
        this.operationNum = operationNum;
    }

    public Date getOperationTime() {
        return operationTime;
    }

    public void setOperationTime(Date operationTime) {
        this.operationTime = operationTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Operation{" +
                "id=" + id +
                ", userId=" + userId +
                ", goodName='" + goodName + '\'' +
                ", operationType=" + operationType +
                ", operationNum=" + operationNum +
                ", operationTime=" + operationTime +
                ", user=" + user +
                '}';
    }
}