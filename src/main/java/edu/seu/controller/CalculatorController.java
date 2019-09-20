package edu.seu.controller;

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
import java.util.Arrays;

@Controller
public class CalculatorController {

    public static final Logger LOGGER = LoggerFactory.getLogger(CalculatorController.class);

    @Autowired
    WeightService weightService;

    @RequestMapping("/calculate")
    @ResponseBody
    public String calculate(HttpServletRequest request, HttpServletResponse response){
        try{
            System.out.println("进入后台！");
            String customize = (String) request.getSession().getAttribute("customize");
            String str[] = request.getParameterValues("array");
            double goal;
            double array[] = new double[str.length];
            for(int i=0;i<str.length;i++){
                array[i] = Double.parseDouble(str[i]);
            }
            //test
            for(int i=0;i<7;i++){
                System.out.println(array[i]);
            }
            //自定义模式
            if(customize.equals("是")){
                goal = goal(Arrays.copyOfRange(array,0,7),Arrays.copyOfRange(array,7,14));
            }
            //非自定义模式
            else{
                String type = (String)request.getSession().getAttribute("type");
                Weight temp = weightService.queryByType(type);
                double weight[] = new double[str.length];
                weight[0]=temp.getIndustry();
                weight[1]=temp.getMarket();
                weight[2]=temp.getTechnology();
                weight[3]=temp.getHr();
                weight[4]=temp.getPolicy();
                weight[5]=temp.getCapital();
                weight[6]=temp.getCulture();
                //test
                for(int i=0;i<7;i++){
                    System.out.println(weight[i]);
                }
                goal = goal(Arrays.copyOfRange(array,0,7),weight);
            }
            response.addHeader("goal",String.valueOf(goal));
            return new CommonResponse(CodeEnum.SUCCESS.getValue(),"计算成功").toJSONString();
        } catch (Exception e){
            LOGGER.error(e.getMessage());
            return new CommonResponse(CodeEnum.USER_ERROR.getValue(),e.getMessage()).toJSONString();
        }
    }

    //按公式进行通用计算并返回得分
    public double goal(double point[],double weight[]){
        double sum = 0;
        for(int i = 0;i < 7;i++){
            sum+=point[i]*weight[i];
        }
        return sum;
    }

}
