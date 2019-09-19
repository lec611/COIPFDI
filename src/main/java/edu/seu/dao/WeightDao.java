package edu.seu.dao;

import edu.seu.model.Weight;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface WeightDao {

    String TABLE_NAME = "weight";
    String SELECT_FIELDS = "industry,market,technology,hr,policy,capital,culture";

    Integer update(Weight weight);

    @Select({"select",SELECT_FIELDS,"from",TABLE_NAME,"where type=#{type}"})
    Weight selectByType(String type);

}
