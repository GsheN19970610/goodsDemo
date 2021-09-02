package com.aty.controller;

import com.aty.domain.Goods;
import com.aty.service.GoodsService;
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
@RequestMapping("/static/goods")
public class GoodsController {
    @Autowired
    private GoodsService goodsService;
    
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> listAll(@RequestParam(required = false,defaultValue = "1") int page, @RequestParam(required = false,defaultValue = "5") int limit) {
         PageHelper.startPage(page, limit);
        List<Goods> goods = goodsService.listAll();
        PageInfo<Goods> goodsPageInfo = new PageInfo<Goods>(goods);
        System.out.println("Page为====="+goodsPageInfo);
        System.out.println(goods.size());
        System.out.println(goods);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",goodsPageInfo.getTotal());
        map.put("data", goods);
        return map;
    }
    
    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    private Map<String, Object> add(@RequestBody Goods goods) {
        System.out.println("我拿到的添加数据==="+goods);
        int result = goodsService.insert(goods);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
           map.put("status", 1);
        } else {
           map.put("status", 0);
        }
        return map;
    }

    @RequestMapping(value = "/addGoodsNum", method = RequestMethod.PUT)
    @ResponseBody
    private Map<String, Object> addGoodsNum(@RequestBody Goods goods) {
        System.out.println("我拿到的入库数据==="+goods);
        int result = goodsService.addGoodsNums(goods);
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
        int result = goodsService.deleteById(id);
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
    private Map<String, Object> update(@RequestBody Goods goods) {
        int result = goodsService.update(goods);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
           map.put("status", 1);
        } else {
           map.put("status", 0);
        }
        return map;
    }

    @RequestMapping(value = "/updateGoods", method = RequestMethod.PUT)
    @ResponseBody
    private Map<String, Object> updateGoods(@RequestBody Goods goods) {
        int result = goodsService.updateGoods(goods);
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
        List<Goods> goods = goodsService.queryByName(name);
        System.out.println(goods);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", goods.size());
        map.put("data", goods);
        return map;
    }

    @RequestMapping(value = "/queryTypeId/{id}" ,method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> queryByType(@PathVariable(value = "id",required = false)Integer id) {
        System.out.println("我执行了....");
        System.out.println("我的值为======"+id);
        List<Goods> byTypeId = goodsService.getByTypeId(id);
        System.out.println(byTypeId);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", byTypeId.size());
        map.put("data", byTypeId);
        return map;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> listAlls(@RequestParam(required = false,defaultValue = "1") int page, @RequestParam(required = false,defaultValue = "5") int limit) {
        PageHelper.startPage(page, limit);
        List<Goods> goods = goodsService.listAll();
        PageInfo<Goods> goodsPageInfo = new PageInfo<Goods>(goods);
        System.out.println("Page为====="+goodsPageInfo);
        System.out.println(goods.size());
        System.out.println(goods);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",goodsPageInfo.getTotal());
        map.put("data", goods);
        return map;
    }

    @RequestMapping(value = "/{priceStart}/{priceEnd}" ,method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> queryByPrice(@PathVariable(value = "priceStart",required = false)Double priceStart, @PathVariable(value = "priceEnd",required = false)Double priceEnd) {
        System.out.println("我执行了33....");
        System.out.println(priceStart);
        System.out.println(priceEnd);
//        System.out.println("我的值为======"+name);
        List<Goods> goods = goodsService.queryByPrice(priceStart, priceEnd);
        System.out.println(goods);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", goods.size());
        map.put("data", goods);
        return map;
    }


}
