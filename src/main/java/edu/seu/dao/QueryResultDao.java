package edu.seu.dao;

import edu.seu.model.QueryResult;
import edu.seu.model.UploadApplication;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Delete;

import java.util.List;

@Mapper
public interface QueryResultDao {

    String TABLE_NAME = "query";
    String SELECT_FIELDS = "id,userName,type,goal";

    Integer insertPassed(UploadApplication upload);
    Integer insertUnpassed(@Param("app")UploadApplication application,@Param("assessment")String assessment);

    @Select({"select",SELECT_FIELDS,"from",TABLE_NAME,"where userID=#{userID} and isPassed=true"})
    List<QueryResult> selectById(Integer userID);

    @Select({"select",SELECT_FIELDS,"from",TABLE_NAME,"where userName=#{userName} and isPassed=true"})
    List<QueryResult> selectByName(String userName);

    @Select({"select",SELECT_FIELDS,"from",TABLE_NAME,"where type=#{type} and isPassed=true"})
    List<QueryResult> selectByType(String type);

    @Delete({"delete from ",TABLE_NAME," where id=#{id}"})
    Integer deleteUnpassed(Integer id);
}
