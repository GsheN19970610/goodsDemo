package com.aty.domain;

public class GoodType {

    private Integer typeId;
    private String typeName;
    private String typeInfo;

    public GoodType() {
    }

    public GoodType( Integer typeId, String typeName, String typeInfo) {
        this.typeId = typeId;
        this.typeName = typeName;
        this.typeInfo = typeInfo;
    }


    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getTypeInfo() {
        return typeInfo;
    }

    public void setTypeInfo(String typeInfo) {
        this.typeInfo = typeInfo;
    }

    @Override
    public String toString() {
        return "GoodType{" +
                ", typeId=" + typeId +
                ", typeName='" + typeName + '\'' +
                ", typeInfo='" + typeInfo + '\'' +
                '}';
    }
}