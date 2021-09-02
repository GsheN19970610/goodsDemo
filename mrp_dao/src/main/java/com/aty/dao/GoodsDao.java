package com.aty.dao;

import com.aty.domain.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsDao {
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
    List<Goods> queryByPrice(@Param("priceStart")Double priceStart,@Param("priceEnd")Double priceEnd);

    /** 根据商品类别ID查找商品 */
    List<Goods> getByTypeId(@Param("id")Integer id);

    /** 更新入库商品 */
    Integer addGoodsNums(Goods goods);

    /** 更新商品 */
    Integer updateGoods(Goods goods);

}