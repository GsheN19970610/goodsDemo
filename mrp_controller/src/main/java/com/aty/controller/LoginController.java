package com.aty.controller;

import com.aty.domain.User;
import com.aty.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
@RequestMapping("/login")
@SessionAttributes("{users}")
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping("/loginUser")
    @ResponseBody
    public User login(User user, HttpServletRequest request) throws IOException {

        User user1 = userService.queryByNameAndByPassword(user);
        if (user1 == null){
            System.out.println(user);
//            return user.toString();
            user1.setName("null");
            return user1;
        }
        request.getSession().setAttribute("user", user1);
        return user1;
    }

    @RequestMapping("/loginUserOut")
    public ModelAndView loginOut(HttpServletRequest request, ModelAndView mv){
        request.getSession().invalidate();
        mv.setViewName("redirect:/static/index.jsp");
        return mv;
    }

}