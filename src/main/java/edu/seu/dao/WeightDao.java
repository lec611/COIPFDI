package edu.seu.dao;

import edu.seu.model.Weight;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface WeightDao {

    String SELECT_FIELDS = "industry,market,technology,hr,policy,capital,culture";

    void updateWeight(Weight weight);
    void updateStandard(Weight weight);

    @Select({"select",SELECT_FIELDS,"from weight where type=#{type}"})
    Weight selectWeight(String type);

    @Select({"select",SELECT_FIELDS,"from standard where type=#{type}"})
    Weight selectStandard(String type);

}
