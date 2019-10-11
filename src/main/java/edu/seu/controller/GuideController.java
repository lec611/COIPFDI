package edu.seu.controller;

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
    @ResponseBody
    @RequestMapping("/upload")
    public String uploadGuide()
    {
        return "";
    }

    @ResponseBody
    @RequestMapping("/download")
    public String downloadGuide()
    {
       return "";
    }
}
