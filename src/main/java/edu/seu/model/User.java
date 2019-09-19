package edu.seu.model;

import edu.seu.base.AuthorityEnum;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;

@Getter(value = AccessLevel.PUBLIC)
@Setter(value = AccessLevel.PUBLIC)
public class User {
    private Integer id;
    private String name;
    private String password;
    private String email;
    private String phoneNum;
    private String sex;
    private String company;
    private String address;
    private String domain;      //工作领域

    public User() {

    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", phone=" + phoneNum +
                ", sex=" + sex +
                ", company=" + company +
                ", address=" + address +
                ", domain=" + domain +
                '}';
    }

}