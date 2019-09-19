package edu.seu.dao;

import edu.seu.model.UploadApplication;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Delete;

import java.util.List;

@Mapper
public interface UploadApplicationDao {
    String TABLE_NAME = "upload";
    String SELECT_FIELDS = "id,userID,userName,type,quota,standard,criterion,weight,goal";

    Integer persist(UploadApplication upload);

    @Select({"select ",SELECT_FIELDS," from ",TABLE_NAME})
    List<UploadApplication> selectAll();

    @Delete({"delete from ",TABLE_NAME," where id=#{id}"})
    Integer deletePostproc(Integer id);

}
