package edu.seu.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import edu.seu.model.Weight;
import edu.seu.service.WeightService;
import edu.seu.util.ImportExcel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author wjx
 * @date 2019/10/10
 */
@RequestMapping("/admin")
@Controller
public class AdminController {

    private static final Logger LOGGER = LoggerFactory.getLogger(AdminController.class);
    private String[] str = {"经贸合作区","工业园","科技园","资源园","物流园/商贸园","农业园","其他园区"};

    @Autowired
    WeightService weightService;

    /**
     * 展示数据库中现存的权重和标准信息
     */
    @ResponseBody
    @RequestMapping("/showWS")
    public String showWS(){
        JSONArray array = new JSONArray();
        for(int i = 0;i < 14;i++){
            Weight weight;
            if(i%2 == 0){
                //查询权重信息
                weight = weightService.queryWeightByType(str[i/2]);
            }
            else{
                //查询标准信息
                weight = weightService.queryStandardByType(str[i/2]);
            }
            JSONObject object = new JSONObject();
            object.put("industry",weight.getIndustry());
            object.put("market",weight.getMarket());
            object.put("technology",weight.getTechnology());
            object.put("hr",weight.getHr());
            object.put("policy",weight.getPolicy());
            object.put("capital",weight.getCapital());
            object.put("culture",weight.getCulture());
            array.add(object);
        }
        return JSON.toJSONString(array.toString());
    }


    /**
     * 更新数据库中的权重和标准信息(Excel文件输入)
     */
    @ResponseBody
    @RequestMapping("/updateWS")
    public String updateWS(MultipartFile file,HttpServletRequest request, HttpServletResponse response){

        try{
            ImportExcel importExcel = new ImportExcel();
            List<Weight> dataList = importExcel.read(file.getOriginalFilename(),file);

            //错误判断
            if (dataList == null) {
                LOGGER.error("管理员输入的文件为空！");
            }
            Weight weight;
            for(int i = 0;i < dataList.size()-1;i += 2){
                //更新权重信息
                weight = dataList.get(i);
                weight.setType(str[i/2]);
                weightService.updateWeight(weight);
                //更新标准信息
                weight = dataList.get(i+1);
                weight.setType(str[i/2]);
                weightService.updateStandard(weight);
            }
            return JSON.toJSONString("");

        }catch(Exception e){
            LOGGER.error(e.getMessage());
            return JSON.toJSONString(e.getMessage());
        }
    }
}
