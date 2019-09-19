package edu.seu.base;

public enum AuthorityEnum {

    USER(0),

    ADMIN(1);

    int value;

    AuthorityEnum(int value){ this.value = value; }

    public int getValue(){ return value; }
}
