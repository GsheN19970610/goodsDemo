package com.aty.controller;

import com.aty.domain.GoodType;
import com.aty.domain.Goods;
import com.aty.service.GoodTypeService;
import com.aty.service.GoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author
 */
@Controller
@RequestMapping("/static/goodType")
public class GoodTypeController {
    @Autowired
    private GoodTypeService goodTypeService;

    @Autowired
    private GoodsService goodsService;

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> listAll(@RequestParam(required = false,defaultValue = "1") int page, @RequestParam(required = false,defaultValue = "5") int limit) {
         PageHelper.startPage(page, limit);
        List<GoodType> goodTypes = goodTypeService.listAll();
        PageInfo<GoodType> goodsTypePageInfo = new PageInfo<GoodType>(goodTypes);
        System.out.println("Page为====="+goodsTypePageInfo);
        System.out.println(goodTypes.size());
        System.out.println(goodTypes);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",goodsTypePageInfo.getTotal());
        map.put("data", goodTypes);
        return map;
    }
    
    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    private Map<String, Object> add(@RequestBody GoodType goodType) {
        System.out.println("我拿到的添加数据==="+goodType);
        int result = goodTypeService.insert(goodType);
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
        int result = 0;
        List<Goods> byTypeId = goodsService.getByTypeId(id);
        if (byTypeId == null){
             result = goodTypeService.deleteById(id);
        }
//        int result = goodTypeService.deleteById(id);
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
    private Map<String, Object> update(@RequestBody GoodType goodType) {
        int result = goodTypeService.update(goodType);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
           map.put("status", 1);
        } else {
           map.put("status", 0);
        }
        return map;
    }


    @RequestMapping(value = "/{name}" ,method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> queryByName(@PathVariable(value = "name",required = false)String name) {
        System.out.println("我执行了....");
//        System.out.println("我的值为======"+name);
        List<GoodType> goodTypes = goodTypeService.queryByName(name);
        System.out.println(goodTypes);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", goodTypes.size());
        map.put("data", goodTypes);
        return map;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> listAlls(@RequestParam(required = false,defaultValue = "1") int page, @RequestParam(required = false,defaultValue = "5") int limit) {
        PageHelper.startPage(page, limit);
        List<GoodType> goodTypes = goodTypeService.listAll();
        PageInfo<GoodType> goodsTypePageInfo = new PageInfo<GoodType>(goodTypes);
        System.out.println("Page为====="+goodsTypePageInfo);
        System.out.println(goodTypes.size());
        System.out.println(goodTypes);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",goodsTypePageInfo.getTotal());
        map.put("data", goodTypes);
        return map;
    }

    @RequestMapping("/sessionList")
    @ResponseBody
    private String shows(HttpServletRequest req) {
        List<GoodType> goodTypes = goodTypeService.listAll();
        req.getSession().setAttribute("goodtypes",goodTypes);
        return "1";
    }

}
