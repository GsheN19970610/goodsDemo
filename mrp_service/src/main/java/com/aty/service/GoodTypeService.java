package com.aty.service;

import com.aty.domain.GoodType;

import java.util.List;

public interface GoodTypeService {
    /** 查找所有商品类型 */
    List<GoodType> listAll();

    /** 添加商品类型 */
    Integer insert(GoodType goodType);

    /** 根据id删除商品类型 */
    Integer deleteById(Integer id);

    /** 更新商品类型 */
    Integer update(GoodType goodType);

    /** 根据id查找商品类型 */
    GoodType getById(Integer id);

    /** 根据Name查找商品类型 */
    List<GoodType> queryByName(String name);

}
