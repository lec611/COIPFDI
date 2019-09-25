package edu.seu.service;

import edu.seu.dao.WeightDao;
import edu.seu.model.Weight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WeightService {

    @Autowired
    private WeightDao weightDao;

    public Weight queryWeightByType(String type){
        return weightDao.selectWeight(type);
    }

    public Weight queryStandardByType(String type){
        return weightDao.selectStandard(type);
    }

    public void updateWeight(Weight weight){
        weightDao.updateWeight(weight);
    }

    public void updateStandard(Weight weight){
        weightDao.updateStandard(weight);
    }

}
