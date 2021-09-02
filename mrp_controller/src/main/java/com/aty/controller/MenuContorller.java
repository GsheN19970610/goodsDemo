package com.aty.controller;

import com.aty.domain.Menu;
import com.aty.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuContorller {
    @Autowired
    private MenuService menuService;
//    @ResponseBody
//    @RequestMapping("/all")
//    public Map<String, Object> showMenu(Integer adminId){
//        List<String> list = new ArrayList<>();
//        List<Menu> menus = menuService.showMenu(adminId);
//        for (Menu menu : menus) {
//            String menuUrl = menu.getMenuUrl();
//            list.add(menuUrl);
//
//        }
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("urlLists",list);
//        System.out.println(list);
//        return  map;
//    }
    @RequestMapping("/all")
    @ResponseBody
    public String showMenu(Integer adminId, HttpServletRequest req){
//        ArrayList<String> list01 = new ArrayList<>();
//        ArrayList<String> list02 = new ArrayList<>();
        List<Menu> menus = menuService.showMenu(adminId);
//        for (Menu menu : menus) {
//            list01.add(menu.getMenuName());
//            list02.add(menu.getMenuUrl());
//        }
//        System.out.println("url 菜单列表为==="+list02);
        req.getSession().setAttribute("ss", menus);
//        mv.addObject("listUrl",list02);
        return  "OK";
    }
}