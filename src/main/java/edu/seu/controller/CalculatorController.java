package edu.seu.controller;

import com.alibaba.fastjson.JSON;
import edu.seu.base.CodeEnum;
import edu.seu.base.CommonResponse;
import edu.seu.model.Weight;
import edu.seu.service.WeightService;
import edu.seu.util.ImportExcel;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
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
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

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
    @RequestMapping("/file")
    public void calculateFile(HttpServletRequest request, HttpServletResponse response,
                              @RequestParam(value="file") MultipartFile file, @RequestParam(value="numCount") String numCount,
                              @RequestParam(value="timeCount") String timeCount,@RequestParam(value="typeCount") String typeCount,@RequestParam(value="type") String type) throws IOException {
        int year = Integer.parseInt(timeCount);
        int num = Integer.parseInt(numCount);
        int typeNum = Integer.parseInt(typeCount);
        if(typeNum > 1) {
            //String type = request.getParameter("type");
        }
        //获取Excel文件输入
//        FileItemFactory factory = new DiskFileItemFactory();
//        ServletFileUpload upload = new ServletFileUpload(factory);

//        DtdCheckEntBasicInfo entity = new DtdCheckEntBasicInfo();
//        List<DtdCheckEntBasicInfo> listInfo = new ArrayList<>();
//        DtdCheckEntBasicInfoDetail bean = new DtdCheckEntBasicInfoDetail();
//        List<DtdCheckEntBasicInfoDetail> listBean = new ArrayList<>();
        /**
         * 读取上传文件
         */
        try {
            ImportExcel poi = new ImportExcel();
            InputStream inputStream = file.getInputStream();
            List<List<String>> list = poi.read(inputStream, file.getOriginalFilename().matches("(?i)(xls)$"));
            /**
             * POI遍历Excel文件，然后读取文件封装成List数据
             */


            if (list != null) {
                for (int i = 1; i < list.size(); i++) {
                    List<String> cellList = list.get(i);
//                    String ID = dtdUtil.getUUID().toUpperCase();
//                    entity.setId(ID);
//                    entity.setEntid(ID);
//                    entity.setEntname(cellList.get(0));
//                    entity.setAreaid(cellList.get(1));
//                    entity.setAreaname(cellList.get(2));
//                    entity.setRegisteraddress(cellList.get(3));
//                    entity.setAddress(cellList.get(4));
//                    entity.setSocietycreditcode(cellList.get(5));
//                    entity.setLerepname(cellList.get(6));
//                    entity.setLerepmobile(cellList.get(7));
//                    entity.setLereptelephonenum(cellList.get(8));
//                    entity.setIssueDate(cellList.get(9));
//                    entity.setValidDate(cellList.get(10));
//                    entity.setDataStatus("10");
//                    entity.setCreateTime(new Date());
//                    listInfo.add(entity);//处理生成List数组
//                    System.out.println();
//                    bean.setId(ID);
//                    bean.setEntid(ID);
//                    bean.setEntname(cellList.get(0));
//                    bean.setRecordInfo(cellList.get(11));
//                    bean.setFund(cellList.get(12));
//                    bean.setAssets(cellList.get(13));
//                    bean.setQualification(cellList.get(14));
//                    bean.setRegulators(cellList.get(15));
//                    bean.setBusinessScope(cellList.get(16));
//                    bean.setRegisteredCapital(cellList.get(17));
//                    bean.setBusinessStartDate(cellList.get(9));
//                    bean.setBusinessEndDate(cellList.get(10));
//                    bean.setRegistrationAuthority(cellList.get(18));
//                    bean.setApprovalDate(cellList.get(19));
//                    if("已登记".equals(cellList.get(20))){
//                        bean.setRegistrationStatus("1");
//                    }else{
//                        bean.setRegistrationStatus("0");
//                    }
//                    listBean.add(bean);
//                }
//                //遍历Excel文件，然后读取文件封装成List数据,然后插入到数据中
//                dao.batchInsert(listInfo);
//                dao_detail.batchInsert(listBean);
                }
            }else{
                throw new RuntimeException("请填写Excel内容");
            }
//            List items = upload.parseRequest(request);
//            Iterator iter = items.iterator();
//            while (iter.hasNext()) {
//                FileItem item = (FileItem) iter.next();
//                if (!item.isFormField()) {
//                    inputStream = item.getInputStream();
//                }
//            }
        } catch (/*FileUploadException | */IOException e) {
            e.printStackTrace();
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
