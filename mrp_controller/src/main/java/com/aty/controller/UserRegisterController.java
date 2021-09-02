package com.aty.controller;

import com.aty.domain.User;
import com.aty.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserRegisterController {

    @Autowired
    private UserService userService;

    @RequestMapping("/register")
    public ModelAndView registerUser(User user, ModelAndView mv){
        userService.register(user);
        mv.setViewName("redirect:/static/index.jsp");
        return mv;
    }

}