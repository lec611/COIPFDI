package edu.seu.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import edu.seu.model.Weight;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * excel读取 工具类
 *
 * @jar包
 *      该类使用到了以下jar：
 *      1、poi-ooxml-3.9.jar
 *      2、poi-3.9.jar
 *      3、poi-ooxml-schemas-3.9.jar
 */
public class ImportExcel {

    //总行数
    private int totalRows = 0;

    //总列数
    private int totalCells = 0;

    //错误信息
    private String errorInfo;

    //构造方法
    public ImportExcel() {
    }

    /**
     * 得到总行数
     */
    public int getTotalRows() {
        return totalRows;
    }

    /**
     * 得到总列数
     */
    public int getTotalCells() {
        return totalCells;
    }

    /**
     * 得到错误信息
     */
    public String getErrorInfo() {
        return errorInfo;
    }

    /**
     * 验证excel文件
     */
    public boolean validateExcel(String filePath) {
        /** 检查文件名是否为空或者是否是Excel格式的文件 */
        if (filePath == null || !(CheckExcelUtil.isExcel2003(filePath) || CheckExcelUtil.isExcel2007(filePath))) {
            errorInfo = "文件名不是excel格式";
            return false;
        }

        /** 检查文件是否存在 */
        File file = new File(filePath);
        if (file == null) {
            errorInfo = "文件为空";
            return false;
        }
        else if(!file.exists()) {
            errorInfo = "文件不存在";
            return false;
        }
        return true;
    }

    /**
     * 根据文件路径读取excel文件
     */
    public List<Weight> read(String fileName, MultipartFile Mfile) {

        //把spring文件上传的MultipartFile转换成CommonsMultipartFile类型
        CommonsMultipartFile cf = (CommonsMultipartFile) Mfile; //获取本地存储路径
        File file = new File("F:\\fileupload");
        //创建一个目录 （它的路径名由当前 File对象指定，包括任一必须的父路径。）
        if (!file.exists()) file.mkdirs();
        //新建一个文件
        File file1 = new File("F:\\fileupload\\" + new Date().getTime() + ".xlsx");
        //将上传的文件写入新建的文件中
        try {
            cf.getFileItem().write(file1);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //初始化客户信息的集合
        List<Weight> dataList = new ArrayList<>();
        //初始化输入流
        InputStream is = null;
        try {
            /** 验证文件是否合法 */
            if (!validateExcel(file1.getPath())) {
                System.out.println(errorInfo);
                return null;
            }

            /** 判断文件的类型，是2003还是2007 */
            boolean isExcel2003 = true;
            if (CheckExcelUtil.isExcel2007(file1.getName())) {
                isExcel2003 = false;
            }

            /** 调用本类提供的根据流读取的方法 */
            is = new FileInputStream(file1);
            //根据excel里面的内容读取客户信息
            dataList = read(is, isExcel2003);
            is.close();
            is = null;
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    is = null;
                    e.printStackTrace();
                }
            }
        }
        return dataList;
    }

    /**
     * 根据流读取Excel文件
     *
     * @param inputStream 文件输入流
     * @param isExcel2003 标识是否2003的excel。
     *                        true：是2003的excel，false：是2007的excel
     * @return
     *
     * @扩展说明
     *          如果使用springmvc的MultipartFile接收前端上传的excel文件的话，可以使用MultipartFile的对象，获取上传的文件名称，
     *          然后，可以通过 CheckExcelUtil 类的方法，接收文件名称参数，来判断excel所属的版本。最后再调用此方法来读取excel数据。
     *
     */
    public List<Weight> read(InputStream inputStream, boolean isExcel2003) {
        List<Weight> dataList = new ArrayList<>();
        try {
            /** 根据版本选择创建Workbook的方式 */
            Workbook wb = null;
            if (isExcel2003) {
                wb = new HSSFWorkbook(inputStream);
            } else {
                wb = new XSSFWorkbook(inputStream);
            }
            dataList = read(wb);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return dataList;
    }

    /**
     * 读取数据
     */
    private List<Weight> read(Workbook wb) {
        List<Weight> dataList = new ArrayList<>();
        Weight weight;
        //得到第一个shell
        Sheet sheet = wb.getSheetAt(0);
        //得到Excel的行数
        this.totalRows = sheet.getPhysicalNumberOfRows();
        //得到Excel的列数
        if (this.totalRows >= 1 && sheet.getRow(0) != null) {
            this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
        }

        //循环Excel的列
        for (int c = 0; c < this.getTotalCells(); c++) {
            weight = new Weight();
            //循环Excel的行
            for (int r = 0; r < this.getTotalRows();r++) {
                Row row = sheet.getRow(r);
                if(row == null) continue;

                Cell cell = row.getCell(c);
                if (null != cell) {
                    if (r == 0) {
                        weight.setIndustry(cell.getNumericCellValue());
                    } else if (r == 1) {
                        weight.setMarket(cell.getNumericCellValue());
                    } else if (r == 2) {
                        weight.setTechnology(cell.getNumericCellValue());
                    } else if (r == 3) {
                        weight.setHr(cell.getNumericCellValue());
                    } else if (r == 4) {
                        weight.setPolicy(cell.getNumericCellValue());
                    } else if (r == 5) {
                        weight.setCapital(cell.getNumericCellValue());
                    } else if (r == 6) {
                        weight.setCulture(cell.getNumericCellValue());
                    }
                }
            }
            //添加数据
            dataList.add(weight);
        }
        return dataList;
    }

}

class CheckExcelUtil {
    /**
     * 检查是否是2003的excel，若是，则返回true
     */
    public static boolean isExcel2003(String filePath) {
        return filePath.matches("^.+\\.(?i)(xls)$");
    }

    /**
     * 检查是否是2007的excel，若是，则返回true
     */
    public static boolean isExcel2007(String filePath) {
        return filePath.matches("^.+\\.(?i)(xlsx)$");
    }
}
