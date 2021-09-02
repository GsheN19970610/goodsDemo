package com.aty.controller;

import com.aty.domain.User;
import com.aty.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author
 */
@Controller
@RequestMapping("/static/user")
public class UserController {
    @Autowired
    UserService userService;
    
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> listAll(@RequestParam(required = false,defaultValue = "1") int page, @RequestParam(required = false,defaultValue = "5") int limit) {
         PageHelper.startPage(page, limit);
        List<User> users = userService.listAll();
        PageInfo<User> userPageInfo = new PageInfo<User>(users);
        System.out.println("Page为====="+userPageInfo);
        System.out.println(users.size());
        System.out.println(users);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",userPageInfo.getTotal());
        map.put("data", users);
        return map;
    }
    
    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    private Map<String, Object> add(@RequestBody User user) {
        System.out.println("我拿到的添加数据==="+user);
        int result = userService.insert(user);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
           map.put("status", 1);
        } else {
           map.put("status", 0);
        }
        return map;
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    private Map<String, Object> deleteById(@PathVariable("id") int id) {
        int result = userService.deleteById(id);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
           map.put("status", 1);
        } else {
           map.put("status", 0);
        }
        return map;
    }
    
    @RequestMapping(value = "", method = RequestMethod.PUT)
    @ResponseBody
    private Map<String, Object> update(@RequestBody User user) {
        int result = userService.update(user);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
           map.put("status", 1);
        } else {
           map.put("status", 0);
        }
        return map;
    }


    @RequestMapping(value = "/{name}", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> queryByName(@PathVariable("name") String name) {
        System.out.println("我执行了....");
        List<User> users = userService.queryByName(name);
        System.out.println(users);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", users.size());
        map.put("data", users);
        return map;
    }
}
