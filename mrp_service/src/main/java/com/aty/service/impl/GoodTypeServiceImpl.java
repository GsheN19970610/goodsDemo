package com.aty.service.impl;

import com.aty.dao.GoodDao;
import com.aty.domain.GoodType;
import com.aty.service.GoodTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodTypeServiceImpl implements GoodTypeService {
    @Autowired
    private GoodDao goodDao;

    @Override
    public List<GoodType> listAll() {
        List<GoodType> goodTypes = goodDao.listAll();
        return goodTypes;
    }

    @Override
    public Integer insert(GoodType goodType) {
        Integer insert = goodDao.insert(goodType);
        return insert;
    }

    @Override
    public Integer deleteById(Integer id) {
        Integer integer = goodDao.deleteById(id);
        return integer;
    }

    @Override
    public Integer update(GoodType goodType) {
        Integer update = goodDao.update(goodType);
        return update;
    }

    @Override
    public GoodType getById(Integer id) {
        GoodType goods = goodDao.getById(id);
        return goods;
    }

    @Override
    public List<GoodType> queryByName(String name) {
        if (name == null || name == ""){
            name = null;
        }
        List<GoodType> goodTypes = goodDao.queryByName(name);
        return goodTypes;
    }
}