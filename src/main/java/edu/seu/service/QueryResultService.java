package edu.seu.service;

import edu.seu.base.CodeEnum;
import edu.seu.dao.QueryResultDao;
import edu.seu.exceptions.COIPFDIExceptions;
import edu.seu.model.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QueryResultService {

    @Autowired
    public QueryResultDao queryResultDao;

    //根据用户的输入查询匹配结果
    public List<QueryResult> queryAll(String id_name_type) throws COIPFDIExceptions {
        List<QueryResult> queryByName = queryResultDao.selectByName(id_name_type);
        List<QueryResult> queryByType =  queryResultDao.selectByType(id_name_type);
        List<QueryResult> result = (queryByName.isEmpty()) ? queryByType : queryByName;

        //查询字符串若表示用户id
        boolean flag = true;
        for(int i=0;i<id_name_type.length();i++){
            if(id_name_type.charAt(i)<'0' || id_name_type.charAt(i)>'9')
                flag = false;
        }
        if(flag) {
            List<QueryResult> queryById = queryResultDao.selectById(Integer.parseInt(id_name_type));
            result = (result.isEmpty()) ? queryById : result;
        }

        if(result == null){
            throw new COIPFDIExceptions(CodeEnum.DOCUMENT_ERROR,"未找到相关结果");
        }

        return result;
    }


}
