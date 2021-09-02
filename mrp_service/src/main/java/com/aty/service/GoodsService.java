package com.aty.service;

import com.aty.domain.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsService {
    /** 查找所有商品 */
    List<Goods> listAll();

    /** 添加商品 */
    Integer insert(Goods goods);

    /** 根据id删除商品 */
    Integer deleteById(Integer id);

    /** 更新商品 */
    Integer update(Goods goods);

    /** 根据id查找商品 */
    Goods getById(Integer id);

    /** 根据Name查找商品 */
    List<Goods> queryByName(@Param("goodName") String name);

    /** 根据价格查找商品类型 */
    List<Goods> queryByPrice(Double priceStart,Double priceEnd);

    /** 根据商品类别ID查找商品 */
    List<Goods> getByTypeId(Integer id);

    /** 更新入库商品 */
    Integer addGoodsNums(Goods goods);

    /** 更新商品 */
    Integer updateGoods(Goods goods);

}