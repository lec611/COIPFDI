package edu.seu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: lec
 * @Date: 2019-08-21 16:22
 */
@Controller
public class PageController {

    @RequestMapping(path={"/","/index"})
    public String index(){ return "index";}

    @RequestMapping("/login")
    public String login(String next, Model model)
    {
        model.addAttribute("next",next);
        return "login";
    }
    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("/findPassword")
    public String findPassword() {
        return "findPassword";
    }

    @RequestMapping("/updatePassword")
    public String updatePassword(){
        return "updatePassword";
    }

    @RequestMapping("/userInfo")
    public String userInfo(){
        return "userInfo";
    }
}
