package edu.seu.model;

import edu.seu.base.AuthorityEnum;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;

@Getter(value = AccessLevel.PUBLIC)
@Setter(value = AccessLevel.PUBLIC)
public class Admin {
    private Integer id;
    private String name;
    private String password;
    private String email;
    private String phoneNum;
    private String sex;
    private String company;
    private String address;
    private String domain;
    private Boolean approvalPending;    //管理员申请待审核状态,true表待审核，false表已完成审核

    public Admin() {

    }

    @Override
    public String toString() {
        return "Admin{" +
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