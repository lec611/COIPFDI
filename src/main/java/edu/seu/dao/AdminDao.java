package edu.seu.dao;

import edu.seu.model.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Delete;

import java.util.List;

@Mapper
public interface AdminDao {
    String TABLE_NAME = "admin";
    String SELECT_FIELDS = "id,name,password,email,phoneNum,sex,company,address,domain,approvalPending";

    Integer persist(Admin admin);
    Integer update(Admin admin);          //修改用户名、密码或邮箱
    Integer completeInfo(Admin admin);    //完善管理员信息

    @Select({"select",SELECT_FIELDS,"from",TABLE_NAME,"where id=#{id}"})
    Admin selectById(Integer id);

    @Select({"select ", SELECT_FIELDS, " from ", TABLE_NAME, " where name=#{name}"})
    Admin selectByName(String name);

    @Select({"select ", SELECT_FIELDS, " from ", TABLE_NAME, " where email=#{email}"})
    Admin selectByEmail(String email);

    @Update({"update ", TABLE_NAME, " set password=#{newPassword} where email=#{email}"})
    Integer updatePassword(@Param("email") String email, @Param("newPassword") String newPassword);

    //将所有未经审查的管理员注册申请查询并展示出来，以供管理员批量审核
    @Select({"select ", SELECT_FIELDS," from", TABLE_NAME, " where approvalPending = 1"})
    List<Admin> selectApprovalPending();

    //由管理员审核通过的修改待审核状态即可
    @Update({"update ", TABLE_NAME, " set approvalPending = 0 where id=#{id}"})
    Integer updateApprovalState(Integer id);

    //审核未通过或管理员人数已满则负责将该申请删除
    @Delete({"delete from ",TABLE_NAME," where id=#{id}"})
    Integer deleteAdminApplication(Integer id);

    @Select({"select ", SELECT_FIELDS, " from ", TABLE_NAME, " where approvalPending = 0 limit #{begin}, #{end}"})
    List<Admin> selectAllAdmin(@Param("begin")Integer begin, @Param("end") Integer end);

    @Select({"select count(id) from ", TABLE_NAME," where approvalPending = 0"})
    Integer countAllAdmin();

    @Select({"select ", SELECT_FIELDS, " from ", TABLE_NAME, " where approvalPending = 1 limit #{begin}, #{end}"})
    List<Admin> selectAllNonAdmin(@Param("begin")Integer begin, @Param("end") Integer end);

    @Select({"select count(id) from ", TABLE_NAME," where approvalPending = 1"})
    Integer countAllNonAdmin();

}
