package com.aty.service.impl;

import com.aty.dao.GoodsDao;
import com.aty.domain.Goods;
import com.aty.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsDao goodsDao;

    @Override
    public List<Goods> listAll() {
        List<Goods> goods = goodsDao.listAll();
        return goods;
    }

    @Override
    public Integer insert(Goods goods) {
        Integer insert = goodsDao.insert(goods);
        return insert;
    }

    @Override
    public Integer deleteById(Integer id) {
        Integer integer = goodsDao.deleteById(id);
        return integer;
    }

    @Override
    public Integer update(Goods goods) {
        Integer update = goodsDao.update(goods);
        return update;
    }

    @Override
    public Goods getById(Integer id) {
        Goods byId = goodsDao.getById(id);
        return byId;
    }

    @Override
    public List<Goods> queryByName(String name) {
        List<Goods> goods = goodsDao.queryByName(name);
        return goods;
    }

    @Override
    public List<Goods> queryByPrice(Double priceStart, Double priceEnd) {
        List<Goods> goods = goodsDao.queryByPrice(priceStart, priceEnd);
        return goods;
    }

    @Override
    public List<Goods> getByTypeId(Integer id) {
        List<Goods> byTypeId = goodsDao.getByTypeId(id);
        return byTypeId;
    }

    @Override
    public Integer addGoodsNums(Goods goods) {
        Integer integer = goodsDao.addGoodsNums(goods);
        return integer;
    }

    @Override
    public Integer updateGoods(Goods goods) {
        Integer integer = goodsDao.updateGoods(goods);
        return integer;
    }
}