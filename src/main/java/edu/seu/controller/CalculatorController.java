package edu.seu.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import edu.seu.base.CodeEnum;
import edu.seu.base.CommonResponse;
import edu.seu.model.Weight;
import edu.seu.service.WeightService;
import edu.seu.util.ImportExcel;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.*;

@RequestMapping("/calculate")
@Controller
public class CalculatorController {

    public static final Logger LOGGER = LoggerFactory.getLogger(CalculatorController.class);

    @Autowired
    WeightService weightService;

    @ResponseBody
    @RequestMapping("/table")
    public String calculateTable(HttpServletRequest request, HttpServletResponse response){
        try{
            String customize = request.getParameter("customize");
            String arr = request.getParameter("array");
            double goal;
            String[] str = arr.substring(1,arr.length()-1).split(",");
            double array[] = new double[str.length-1];
            for(int i=0;i<7;i++){
                array[i] = Double.parseDouble(str[i].substring(1,str[i].length()-1));
            }

            //自定义模式
            if(customize.equals("是")){
                for(int i=7;i<14;i++){
                    if(str[i] != "") {
                        array[i] = Double.parseDouble(str[i].substring(1, str[i].length() - 1));
                    }else{
                        array[i] = 0;
                    }
                }
                goal = goal(Arrays.copyOfRange(array,0,7),Arrays.copyOfRange(array,7,14));
            }
            //非自定义模式
            else{
                String type = request.getParameter("type");
                Weight temp = weightService.queryWeightByType(type);
                double weight[] = new double[array.length];
                weight[0]=temp.getIndustry();
                weight[1]=temp.getMarket();
                weight[2]=temp.getTechnology();
                weight[3]=temp.getHr();
                weight[4]=temp.getPolicy();
                weight[5]=temp.getCapital();
                weight[6]=temp.getCulture();
                goal = goal(Arrays.copyOfRange(array,0,7),weight);
            }
            response.addHeader("goal",String.valueOf(goal));
            return JSON.toJSONString(String.format("{'goal': %s}",String.format("%.4f", goal)));
        } catch (Exception e){
            LOGGER.error("wjx__"+e.getMessage());
            return new CommonResponse(CodeEnum.USER_ERROR.getValue(),e.getMessage()).toJSONString();
        }
    }

    @ResponseBody
    @RequestMapping("/outputTable")
    public void outputTable(HttpServletRequest request, HttpServletResponse response){
        try{
            String customize = request.getParameter("customize");
            String arr = request.getParameter("array");
            double goal;
            String[] str = arr.substring(1,arr.length()-1).split(",");
            double array[] = new double[str.length-1];
            for(int i=0;i<7;i++){
                array[i] = Double.parseDouble(str[i].substring(1,str[i].length()-1));
            }

            String fileName = new Date().getTime() + ".xlsx";
            Workbook wb = new XSSFWorkbook();
            //得到第一个shell
            Sheet sheet = wb.createSheet("融合指数测度表");
            OutputStream os = response.getOutputStream();
            //将结果导出为Excel文件
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            //提供打开/保存对话框，将文件作为附件下载
            response.setHeader("Content-Disposition", "attachment; filename="+ URLEncoder.encode(fileName, "UTF-8"));

            System.out.println("1:"+fileName);

            //自定义模式
            if(customize.equals("是")){
                for(int i=7;i<14;i++){
                    if(str[i] != "") {
                        array[i] = Double.parseDouble(str[i].substring(1, str[i].length() - 1));
                    }else{
                        array[i] = 0;
                    }
                }
                goal = goal(Arrays.copyOfRange(array,0,7),Arrays.copyOfRange(array,7,14));
                tableExcelGenerator(sheet,Arrays.copyOfRange(array,0,7),Arrays.copyOfRange(array,7,14),goal);
            }
            //非自定义模式
            else{
                String type = request.getParameter("type");
                Weight temp = weightService.queryWeightByType(type);
                double weight[] = new double[array.length];
                weight[0]=temp.getIndustry();
                weight[1]=temp.getMarket();
                weight[2]=temp.getTechnology();
                weight[3]=temp.getHr();
                weight[4]=temp.getPolicy();
                weight[5]=temp.getCapital();
                weight[6]=temp.getCulture();
                goal = goal(Arrays.copyOfRange(array,0,7),weight);
                tableExcelGenerator(sheet,Arrays.copyOfRange(array,0,7),weight,goal);
            }

            System.out.println("2:"+fileName);

            wb.write(os);
            os.close();

            System.out.println("3:"+fileName);

//            FileOutputStream fileOutputStream = new FileOutputStream(fileName);
//            wb.write(fileOutputStream);
//            fileOutputStream.close();

        } catch (Exception e){
            LOGGER.error("wjx__"+e.getMessage());
            e.printStackTrace();
        }
    }

    //Excel表数据填充函数
    public void tableExcelGenerator(Sheet sheet, double data[], double weight[], double goal){
        String str1[] = {"指标","数值","权重","融合化发展指数"};
        String str2[] = {"产品融合度","市场融合度","技术融合度","人员融合度","政策依赖度","资本依赖度","社会文化影响度"};

        Row row = sheet.createRow(0);
        for(int c=0;c<4;c++){
            Cell cell = row.createCell(c);
            cell.setCellValue(str1[c]);
        }
        for(int r=1;r<=7;r++){
            //生成最左列提示信息
            Row sheetRow = sheet.createRow(r);
            Cell cell = sheetRow.createCell(0);
            cell.setCellValue(str2[r-1]);
            //生成数据信息
            Cell cellData = sheetRow.createCell(1);
            cellData.setCellValue(data[r-1]);
            //生成权重信息
            Cell cellWeight = sheetRow.createCell(2);
            cellWeight.setCellValue(weight[r-1]);
        }
        //生成计算结果
        row = sheet.getRow(1);
        Cell cellGoal = row.createCell(3);
        cellGoal.setCellValue(goal);
    }

    @ResponseBody
    @RequestMapping("/file")
    public String calculateFile(HttpServletRequest request, HttpServletResponse response,
                              @RequestParam(value="file") MultipartFile file, @RequestParam(value="numCount") String numCount,
                              @RequestParam(value="timeCount") String timeCount,@RequestParam(value="typeCount") String typeCount,@RequestParam(value="type") String type) {
        int num = Integer.parseInt(numCount);         //几个园区
        int year = Integer.parseInt(timeCount);       //共几年
        int typeNum = Integer.parseInt(typeCount);    //园区类型数

        /**
         * 读取上传文件
         */
        ImportExcel importExcel = new ImportExcel();
        List<Weight> dataList = importExcel.read(file.getOriginalFilename(),file);

        //错误判断
        if(dataList == null){
            return new CommonResponse(CodeEnum.USER_ERROR.getValue(),"您输入的文件为空！").toJSONString();
        }
        if((typeNum == 1) && (dataList.size() < year*num)){
            return new CommonResponse(CodeEnum.USER_ERROR.getValue(),"文件中的数据条目不达标！请重新输入！").toJSONString();
        }
        if((typeNum > 1) && (dataList.size() != (year+2)*num)){
            return new CommonResponse(CodeEnum.USER_ERROR.getValue(),"文件中的数据条目不达标！请重新输入！").toJSONString();
        }
        double goal;
        JSONArray array = new JSONArray();
        //如果为单个园区类型并省略权重信息时，则去数据库取出相应权重计算
        if((typeNum == 1) && (dataList.size() == year*num)){
            Weight weight = weightService.queryWeightByType(type);
            for(int i=0;i<dataList.size();i++) {
                goal = goal(dataList.get(i), weight);
                JSONObject object = new JSONObject();
                object.put("num",num);//增加园区个数，方便作图
                object.put("year",year);//增加年数，便于作柱状图
                object.put("zoneNum","园区"+(i/year+1));
                object.put("yearNum",(i%year+1));
                object.put("goal", new DecimalFormat("#.0000").format(goal));
                array.add(object);
            }
        }
        //多园区类型(后面2*num个数据表示权重和标准)或单个园区类型且并未省略权重信息
        else{
            for(int i=0;i<dataList.size()-2*num;i++){
                goal = goal(dataList.get(i),dataList.get(year*num+i/year));
                JSONObject object = new JSONObject();
                object.put("num",num);//增加园区个数，方便作图
                object.put("year",year);//增加年数，便于作柱状图
                object.put("zoneNum","园区"+(i/year+1));
                object.put("yearNum",(i%year+1));
                object.put("goal", new DecimalFormat("#.0000").format(goal));
                array.add(object);
            }
        }
        return JSON.toJSONString(array.toString());
    }

    //按公式进行通用计算并返回得分
    public double goal(double point[],double weight[]){
        double sum = 0;
        for(int i = 0;i < 7;i++){
            sum+=point[i]*weight[i];
        }
        return sum;
    }
    //对于传入的是两个weight类型的数据结构(由于数值类型和权重类型的数据结构相差不大，因此混用)
    public double goal(Weight data,Weight weight){
        return data.getIndustry()*weight.getIndustry()
                +data.getMarket()*weight.getMarket()
                +data.getTechnology()*weight.getTechnology()
                +data.getHr()*weight.getHr()
                +data.getPolicy()*weight.getPolicy()
                +data.getCapital()*weight.getCapital()
                +data.getCulture()*weight.getCulture();
    }

    //Json数据格式生成
//    public String toJsonString(int zoneNum,int yearNum,double goal){
//        return String.format("{'zoneNum':\"园区\"+%d, 'yearNum':\"第\"+%d+\"年\", 'goal':%.4f}",zoneNum,yearNum,goal);
//    }

}
