package edu.seu.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import edu.seu.base.CodeEnum;
import edu.seu.base.CommonResponse;
import edu.seu.model.Weight;
import edu.seu.service.WeightService;
import edu.seu.util.ImportExcel;
import org.apache.commons.io.FileUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.*;

/**
 * @author wjx
 * @date 2019/10/11
 */
@RequestMapping("/calculate")
@Controller
public class CalculatorController {

    private static final Logger LOGGER = LoggerFactory.getLogger(CalculatorController.class);

    @Autowired
    WeightService weightService;

    @ResponseBody
    @RequestMapping("/table")
    public String calculateTable(HttpServletRequest request, HttpServletResponse response) {
        try {
            String customize = request.getParameter("customize");
            String arr = request.getParameter("array");
            double goal;
            String[] str = arr.substring(1, arr.length() - 1).split(",");
            double[] array = new double[str.length - 1];
            for (int i = 0; i < 7; i++) {
                array[i] = Double.parseDouble(str[i].substring(1, str[i].length() - 1));
            }

            //自定义模式
            if ("是".equals(customize)) {
                for (int i = 7; i < 14; i++) {
                    if (str[i].equals("")) {
                        array[i] = 0;
                    } else {
                        array[i] = Double.parseDouble(str[i].substring(1, str[i].length() - 1));
                    }
                }
                goal = goal(Arrays.copyOfRange(array, 0, 7), Arrays.copyOfRange(array, 7, 14));
            }
            //非自定义模式
            else {
                String type = request.getParameter("type");
                Weight temp = weightService.queryWeightByType(type);
                double[] weight = new double[array.length];
                weight[0] = temp.getIndustry();
                weight[1] = temp.getMarket();
                weight[2] = temp.getTechnology();
                weight[3] = temp.getHr();
                weight[4] = temp.getPolicy();
                weight[5] = temp.getCapital();
                weight[6] = temp.getCulture();
                goal = goal(Arrays.copyOfRange(array, 0, 7), weight);
            }
            response.addHeader("goal", String.valueOf(goal));
            return JSON.toJSONString(String.format("{'goal': %s}", String.format("%.4f", goal)));
        } catch (Exception e) {
            LOGGER.error("wjx__" + e.getMessage());
            return new CommonResponse(CodeEnum.USER_ERROR.getValue(), e.getMessage()).toJSONString();
        }
    }

    @ResponseBody
    @RequestMapping("/outputTable")
    public void outputTable(HttpServletRequest request) {
        try {
            String customize = request.getParameter("customize");
            String arr = request.getParameter("array");
            double goal;

            String[] str = arr.substring(1, arr.length() - 1).split(",");
            double[] array = new double[str.length - 1];
            for (int i = 0; i < 7; i++) {
                array[i] = Double.parseDouble(str[i].substring(1, str[i].length() - 1));
            }

            ServletContext context = request.getSession().getServletContext();
            String realPath = context.getRealPath("/file");
            //若文件路径不存在，则创建
            File mkdir = new File(realPath);
            if (!mkdir.exists()) {
                mkdir.mkdirs();
            }

            Workbook wb = new XSSFWorkbook();
            //得到第一个shell
            Sheet sheet = wb.createSheet("融合指数测度表");

            //自定义模式
            if ("是".equals(customize)) {
                for (int i = 7; i < 14; i++) {
                    if (str[i].equals("")) {
                        array[i] = 0;
                    } else {
                        array[i] = Double.parseDouble(str[i].substring(1, str[i].length() - 1));
                    }
                }
                goal = goal(Arrays.copyOfRange(array, 0, 7), Arrays.copyOfRange(array, 7, 14));
                tableExcelGenerator(sheet, Arrays.copyOfRange(array, 0, 7), Arrays.copyOfRange(array, 7, 14), goal);
            }
            //非自定义模式
            else {
                String type = request.getParameter("type");
                Weight temp = weightService.queryWeightByType(type);
                double[] weight = new double[array.length];
                weight[0] = temp.getIndustry();
                weight[1] = temp.getMarket();
                weight[2] = temp.getTechnology();
                weight[3] = temp.getHr();
                weight[4] = temp.getPolicy();
                weight[5] = temp.getCapital();
                weight[6] = temp.getCulture();
                goal = goal(Arrays.copyOfRange(array, 0, 7), weight);
                tableExcelGenerator(sheet, Arrays.copyOfRange(array, 0, 7), weight, goal);
            }

            //将文件输出到本地特定位置，供outputExcel返回给前端下载
            String fileName = "融合指数测度表.xlsx";
            FileOutputStream fileOutputStream = new FileOutputStream(realPath + "/" + fileName);
            wb.write(fileOutputStream);
            fileOutputStream.close();

        } catch (Exception e) {
            LOGGER.error("wjx__" + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Excel表数据填充函数
     */
    public void tableExcelGenerator(Sheet sheet, double[] data, double[] weight, double goal) {
        String[] str1 = {"指标", "数值", "权重", "融合化发展指数"};
        String[] str2 = {"产品融合度", "市场融合度", "技术融合度", "人员融合度", "政策依赖度", "资本依赖度", "社会文化影响度"};

        Row row = sheet.createRow(0);
        for (int c = 0; c < 4; c++) {
            Cell cell = row.createCell(c);
            cell.setCellValue(str1[c]);
        }
        for (int r = 1; r <= 7; r++) {
            //生成最左列提示信息
            Row sheetRow = sheet.createRow(r);
            Cell cell = sheetRow.createCell(0);
            cell.setCellValue(str2[r - 1]);
            //生成数据信息
            Cell cellData = sheetRow.createCell(1);
            cellData.setCellValue(data[r - 1]);
            //生成权重信息
            Cell cellWeight = sheetRow.createCell(2);
            cellWeight.setCellValue(weight[r - 1]);
        }
        //生成计算结果
        row = sheet.getRow(1);
        Cell cellGoal = row.createCell(3);
        cellGoal.setCellValue(goal);
    }

    /**
     * 计算文件传输的结果，并且同时将用户可能要求输出的文件保存到本地
     */
    @ResponseBody
    @RequestMapping("/file")
    public String calculateFile(HttpServletRequest request, HttpServletResponse response,
                                @RequestParam(value = "file") MultipartFile file, @RequestParam(value = "numCount") String numCount,
                                @RequestParam(value = "timeCount") String timeCount, @RequestParam(value = "typeCount") String typeCount, @RequestParam(value = "type") String type) throws IOException {
        //几个园区
        int num = Integer.parseInt(numCount);
        //共几年
        int year = Integer.parseInt(timeCount);
        //园区类型数
        int typeNum = Integer.parseInt(typeCount);

        /**
         * 读取上传文件
         */
        ImportExcel importExcel = new ImportExcel();
        List<Weight> dataList = importExcel.read(file.getOriginalFilename(), file);
        List<Double> goalArray = new ArrayList<>();

        //错误判断
        if (dataList == null) {
            return new CommonResponse(CodeEnum.USER_ERROR.getValue(), "您输入的文件为空！").toJSONString();
        }
        if ((typeNum == 1) && (dataList.size() < year * num)) {
            return new CommonResponse(CodeEnum.USER_ERROR.getValue(), "文件中的数据条目不达标！请重新输入！").toJSONString();
        }
        if ((typeNum > 1) && (dataList.size() != (year + 2) * num)) {
            return new CommonResponse(CodeEnum.USER_ERROR.getValue(), "文件中的数据条目不达标！请重新输入！").toJSONString();
        }
        double goal;
        JSONArray array = new JSONArray();
        //如果为单个园区类型并省略权重信息时，则去数据库取出相应权重计算
        if ((typeNum == 1) && (dataList.size() == year * num)) {
            Weight weight = weightService.queryWeightByType(type);
            for (int i = 0; i < dataList.size(); i++) {
                goal = goal(dataList.get(i), weight);
                JSONObject object = new JSONObject();
                object.put("year", year);
                object.put("zoneNum", "园区" + (i / year + 1));
                object.put("yearNum", (i % year + 1));
                object.put("goal", new DecimalFormat("#.0000").format(goal));
                array.add(object);
                goalArray.add(goal);
            }
        }
        //多园区类型(后面2*num个数据表示权重和标准)或单个园区类型且并未省略权重信息
        else {
            for (int i = 0; i < dataList.size() - 2 * num; i++) {
                goal = goal(dataList.get(i), dataList.get(year * num + i / year));
                JSONObject object = new JSONObject();
                object.put("year", year);
                object.put("zoneNum", "园区" + (i / year + 1));
                object.put("yearNum", (i % year + 1));
                object.put("goal", new DecimalFormat("#.0000").format(goal));
                array.add(object);
                goalArray.add(goal);
            }
        }

        //生成文件到本地
        ServletContext context = request.getSession().getServletContext();
        String realPath = context.getRealPath("/file");
        //若文件路径不存在，则创建
        File mkdir = new File(realPath);
        if (!mkdir.exists()) {
            mkdir.mkdirs();
        }

        Workbook wb = new XSSFWorkbook();
        //得到第一个shell
        Sheet sheet = wb.createSheet("融合指数测度表");
        fileExcelGenerator(sheet, dataList, goalArray);

        //将文件输出到本地特定位置，供outputExcel返回给前端下载
        String fileName = "融合指数测度表.xlsx";
        FileOutputStream fileOutputStream = new FileOutputStream(realPath + "/" + fileName);
        wb.write(fileOutputStream);
        fileOutputStream.close();

        return JSON.toJSONString(array.toString());
    }

    /**
     * Excel文件数据填充函数
     */
    public void fileExcelGenerator(Sheet sheet, List<Weight> dataList, List<Double> goalArray) {
        String[] str = {"产品融合度", "市场融合度", "技术融合度", "人员融合度", "政策依赖度", "资本依赖度", "社会文化影响度", "融合化发展指数"};

        for (int r = 0; r < str.length; r++) {
            //生成最左列提示信息
            Row row = sheet.createRow(r);
            Cell cell = row.createCell(0);
            cell.setCellValue(str[r]);

            for (int i = 1; i <= dataList.size(); i++) {
                Weight weight = dataList.get(i-1);
                if (r == 0) {
                    cell = row.createCell(i);
                    cell.setCellValue(weight.getIndustry());
                }else if (r == 1) {
                    cell = row.createCell(i);
                    cell.setCellValue(weight.getMarket());
                }else if (r == 2) {
                    cell = row.createCell(i);
                    cell.setCellValue(weight.getTechnology());
                }else if (r == 3) {
                    cell = row.createCell(i);
                    cell.setCellValue(weight.getHr());
                }else if (r == 4) {
                    cell = row.createCell(i);
                    cell.setCellValue(weight.getPolicy());
                }else if (r == 5) {
                    cell = row.createCell(i);
                    cell.setCellValue(weight.getCapital());
                }else if (r == 6) {
                    cell = row.createCell(i);
                    cell.setCellValue(weight.getCulture());
                }else if (r == 7) {
                    if(i > goalArray.size()){
                        break;
                    }
                    cell = row.createCell(i);
                    cell.setCellValue(goalArray.get(i-1));
                }
            }
        }
    }

    /**
     * 返回给a标签以供用户下载
     */
    @ResponseBody
    @RequestMapping("/outputExcel")
    public ResponseEntity<byte[]> outputTableExcel(HttpServletRequest request) throws IOException {
        ServletContext context = request.getSession().getServletContext();
        String realPath = context.getRealPath("/file");

        String fileName = "融合指数测度表.xlsx";
        File file = new File(realPath + "/" + fileName);
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        httpHeaders.setContentDispositionFormData("attachment", URLEncoder.encode(file.getName(), "UTF-8"));
        return new ResponseEntity<>(FileUtils.readFileToByteArray(file), httpHeaders, HttpStatus.OK);

    }

    /**
     * 按公式进行通用计算并返回得分
     */
    public double goal(double[] point, double[] weight) {
        double sum = 0;
        for (int i = 0; i < 7; i++) {
            sum += point[i] * weight[i];
        }
        return sum;
    }

    /**
     * 对于传入的是两个weight类型的数据结构(由于数值类型和权重类型的数据结构相差不大，因此混用)
     */
    public double goal(Weight data, Weight weight) {
        return data.getIndustry() * weight.getIndustry()
                + data.getMarket() * weight.getMarket()
                + data.getTechnology() * weight.getTechnology()
                + data.getHr() * weight.getHr()
                + data.getPolicy() * weight.getPolicy()
                + data.getCapital() * weight.getCapital()
                + data.getCulture() * weight.getCulture();
    }

//    //Json数据格式生成
//    public String toJsonString(int zoneNum,int yearNum,double goal){
//        return String.format("{'zoneNum':\"园区\"+%d, 'yearNum':\"第\"+%d+\"年\", 'goal':%.4f}",zoneNum,yearNum,goal);
//    }

}
