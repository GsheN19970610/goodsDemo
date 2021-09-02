package com.aty.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author
 */
@Controller
public class PageController {

    /** 跳转至首页 */
    @RequestMapping("/")
    public String toIndex() {
        return "redirect:/static/main.jsp";
    }
    
    /** 跳转至用户页面 */
    @RequestMapping("/static/user")
    public String toUser() {
        return "redirect:/static/userUi.html";
    }

    /** 跳转至商品类型页面 */
    @RequestMapping("/static/goodType")
    public String toItem() {
        return "redirect:/static/goodTypeUi.html";
    }

    /** 跳转至商品页面 */
    @RequestMapping("/static/goods")
    public String toGoods() {
        return "redirect:/static/goods.jsp";
    }

    /** 跳转至操作日志页面 */
    @RequestMapping("/static/operation")
    public String toOperation() {
        return "redirect:/static/operation.jsp";
    }
}
