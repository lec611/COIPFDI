package edu.seu.controller;

import edu.seu.base.CodeEnum;
import edu.seu.base.CommonResponse;
import edu.seu.exceptions.COIPFDIExceptions;
import edu.seu.model.QueryResult;
import edu.seu.service.QueryResultService;
import net.sf.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
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
            String id_name_type = (String)request.getSession().getAttribute("id_name_type");
            //查询数据结果
            List<QueryResult> queryResults = queryResultService.queryAll(id_name_type);
            //将list集合转换成json对象
            JSONArray data = JSONArray.fromObject(queryResults);
            //接下来发送数据
            //设置编码，防止出现乱码问题
            response.setCharacterEncoding("utf-8");
            //得到输出流
            PrintWriter responseWritter = response.getWriter();
            //将JSON格式的对象toString后发送
            responseWritter.append(data.toString());
            return new CommonResponse(CodeEnum.SUCCESS.getValue(),"查询成功").toJSONString();
        } catch (COIPFDIExceptions e){
            LOGGER.info(e.getMessage());
            return new CommonResponse(e.getCodeEnum().getValue(),e.getMessage()).toJSONString();
        } catch (Exception e){
            LOGGER.error(e.getMessage());
            return new CommonResponse(CodeEnum.USER_ERROR.getValue(),e.getMessage()).toJSONString();
        }

    }

}
