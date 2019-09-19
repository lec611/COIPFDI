package edu.seu.service;

import edu.seu.dao.QueryResultDao;
import edu.seu.dao.UploadApplicationDao;
import edu.seu.model.UploadApplication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UploadApplicationService {
    @Autowired
    public UploadApplicationDao uploadApplicationDao;

    @Autowired
    public QueryResultDao queryResultDao;

    //申请操作持久化
    public void persistApp(UploadApplication upload){
        uploadApplicationDao.persist(upload);
    }

    //将申请表中的数据全部拿出以供管理员审核
    public List<UploadApplication> queryAll(){
        return uploadApplicationDao.selectAll();
    }

    //将管理员的操作落实到数据库(true表approval,false表disapproval)
    public void dealUploadApp(UploadApplication upload,boolean approval,String assessment){
        if(approval == true){
            queryResultDao.insertPassed(upload);
        }else{
            queryResultDao.insertUnpassed(upload,assessment);
        }
        uploadApplicationDao.deletePostproc(upload.getId());   //操作完后将数据从申请表中删除
    }

}
