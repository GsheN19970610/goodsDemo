package com.aty.dao;

import com.aty.domain.GoodType;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodDao {
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
    List<GoodType> queryByName(@Param("typeName") String name);






}
