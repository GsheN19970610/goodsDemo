package com.aty.controller;

import com.aty.domain.Operation;
import com.aty.service.OperationService;
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
@RequestMapping("/static/operation")
public class OperationController {

    @Autowired
    private OperationService operationService;
    
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> listAll(@RequestParam(required = false,defaultValue = "1") int page, @RequestParam(required = false,defaultValue = "5") int limit) {
         PageHelper.startPage(page, limit);
        List<Operation> operations = operationService.listAll();
        PageInfo<Operation> operationPageInfo = new PageInfo<Operation>(operations);
        System.out.println("Page为====="+operationPageInfo);
        System.out.println(operations.size());
        System.out.println(operations);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",operationPageInfo.getTotal());
        map.put("data", operations);
        return map;
    }
    
    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    private Map<String, Object> add(@RequestBody Operation operation) {
        System.out.println("我拿到的添加数据==="+operation);
        int result = operationService.insert(operation);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
           map.put("status", 1);
        } else {
           map.put("status", 0);
        }
        return map;
    }
    
//    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
//    @ResponseBody
//    private Map<String, Object> deleteById(@PathVariable("id") int id) {
//        int result = goodsService.deleteById(id);
//        Map<String, Object> map = new HashMap<String, Object>();
//        if (result > 0) {
//           map.put("status", 1);
//        } else {
//           map.put("status", 0);
//        }
//        return map;
//    }
    
//    @RequestMapping(value = "", method = RequestMethod.PUT)
//    @ResponseBody
//    private Map<String, Object> update(@RequestBody Goods goods) {
//        int result = goodsService.update(goods);
//        Map<String, Object> map = new HashMap<String, Object>();
//        if (result > 0) {
//           map.put("status", 1);
//        } else {
//           map.put("status", 0);
//        }
//        return map;
//    }


    @RequestMapping(value = "/{name}" ,method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> queryByName(@PathVariable(value = "name",required = false)String name) {
        System.out.println("我执行了....");
//        System.out.println("我的值为======"+name);
        List<Operation> operations = operationService.queryByName(name);
        System.out.println(operations);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", operations.size());
        map.put("data", operations);
        return map;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> listAlls(@RequestParam(required = false,defaultValue = "1") int page, @RequestParam(required = false,defaultValue = "5") int limit) {
        PageHelper.startPage(page, limit);
        List<Operation> operations = operationService.listAll();
        PageInfo<Operation> operationsPageInfo = new PageInfo<Operation>(operations);
        System.out.println("Page为====="+operationsPageInfo);
        System.out.println(operations.size());
        System.out.println(operations);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",operationsPageInfo.getTotal());
        map.put("data", operations);
        return map;
    }
}
