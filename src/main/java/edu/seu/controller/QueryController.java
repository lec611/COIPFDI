package edu.seu.controller;

import com.alibaba.fastjson.JSON;
import edu.seu.base.CodeEnum;
import edu.seu.base.CommonResponse;
import edu.seu.exceptions.COIPFDIExceptions;
import edu.seu.model.QueryResult;
import edu.seu.service.QueryResultService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class QueryController {

    public static final Logger LOGGER = LoggerFactory.getLogger(QueryController.class);

    @Autowired
    QueryResultService queryResultService;

    //执行相应的查询并展示(request中给定id_name_type,response中返回查找结果)
    @RequestMapping("/query")
    @ResponseBody
    public String queryAll (HttpServletRequest request, HttpServletResponse response) {
        try{
            //从request请求中取得查询关键字
            String id_name_type = request.getParameter("id_name_type");
            //查询数据结果
            List<QueryResult> queryResults = queryResultService.queryAll(id_name_type);
            JSONArray array = new JSONArray();
            for(int i = 0;i < queryResults.size();i++){
                JSONObject object = new JSONObject();
                object.put("id", queryResults.get(i).getId());
                object.put("userID", queryResults.get(i).getUserID());
                object.put("userName", queryResults.get(i).getUserName());
                object.put("type", queryResults.get(i).getType());
                object.put("goal", queryResults.get(i).getGoal());
                array.add(object);
            }
            return JSON.toJSONString(array.toString());
        } catch (COIPFDIExceptions e){
            LOGGER.info(e.getMessage());
            return new CommonResponse(e.getCodeEnum().getValue(),e.getMessage()).toJSONString();
        } catch (Exception e){
            LOGGER.error(e.getMessage());
            return new CommonResponse(CodeEnum.USER_ERROR.getValue(),e.getMessage()).toJSONString();
        }
    }
}
