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
        List<QueryResult> qr1 = queryResultDao.selectById(Integer.parseInt(id_name_type));
        List<QueryResult> qr2 = queryResultDao.selectByName(id_name_type);
        List<QueryResult> qr3 = queryResultDao.selectByType(id_name_type);
        List<QueryResult> qr = (qr1 != null) ? qr1 :qr2;
        qr = (qr != null) ? qr : qr3;

        if(qr == null){
            throw new COIPFDIExceptions(CodeEnum.DOCUMENT_ERROR,"未找到相关结果");
        }

        return qr;
    }


}
