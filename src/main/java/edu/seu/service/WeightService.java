package edu.seu.service;

import edu.seu.dao.WeightDao;
import edu.seu.model.Weight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WeightService {

    @Autowired
    private WeightDao weightDao;

    public Weight queryByType(String type){
        return weightDao.selectByType(type);
    }

    public void update(Weight weight){
        weightDao.update(weight);
    }

}
