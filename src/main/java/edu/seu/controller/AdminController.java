package edu.seu.controller;

import com.alibaba.fastjson.JSON;
import edu.seu.base.CodeEnum;
import edu.seu.base.CommonResponse;
import edu.seu.model.Weight;
import edu.seu.service.WeightService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/admin")
@Controller
public class AdminController {

    public static final Logger LOGGER = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    WeightService weightService;

    //更新数据库中的权重和标准信息
    @ResponseBody
    @RequestMapping("/updateWS")
    public String updateWS(HttpServletRequest request, HttpServletResponse response){
        try{
            String type = request.getParameter("type");
            String updateType = request.getParameter("updateType");
            String arr = request.getParameter("array");
            String[] str = arr.substring(1,arr.length()-1).split(",");
            double array[] = new double[str.length-1];
            for(int i=0;i<7;i++){
                array[i] = Double.parseDouble(str[i].substring(1,str[i].length()-1));
            }
            Weight weight = new Weight();
            weight.setType(type);
            weight.setIndustry(array[0]);
            weight.setMarket(array[1]);
            weight.setTechnology(array[2]);
            weight.setHr(array[3]);
            weight.setPolicy(array[4]);
            weight.setCapital(array[5]);
            weight.setCulture(array[6]);
            if(updateType.equals("weight")){
                weightService.updateWeight(weight);
            }else{
                weightService.updateStandard(weight);
            }
            return JSON.toJSONString("SUCCESS!");
        }catch(Exception e){
            LOGGER.error(e.getMessage());
            return new CommonResponse(CodeEnum.USER_ERROR.getValue(),e.getMessage()).toJSONString();
        }
    }

}
