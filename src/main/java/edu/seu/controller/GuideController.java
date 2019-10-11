package edu.seu.controller;

import com.alibaba.fastjson.JSON;
import edu.seu.base.CodeEnum;
import edu.seu.exceptions.COIPFDIExceptions;
import edu.seu.model.User;
import edu.seu.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author lec
 * @date 2019/10/11
 */
@RequestMapping("/guideFile")
@Controller
public class GuideController {

    private static final Logger LOGGER = LoggerFactory.getLogger(GuideController.class);

    @Autowired
    private UserService userService;

    /**
     * 是否管理员登录
     */
    public void adminAuth() throws COIPFDIExceptions {
        User user = userService.getCurrentUser();
        if (user == null || user.getIsAdmin() != 1) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "此操作需要管理员权限！");
        }
    }

    @ResponseBody
    @RequestMapping("/upload")
    public String uploadGuide()
    {
        try {
            //判断是否有管理员权限
            adminAuth();

            return JSON.toJSONString("success");
        }catch(Exception e){
            LOGGER.error(e.getMessage());
            return JSON.toJSONString("error");
        }
    }

    @ResponseBody
    @RequestMapping("/download")
    public String downloadGuide()
    {
       return "";
    }
}
