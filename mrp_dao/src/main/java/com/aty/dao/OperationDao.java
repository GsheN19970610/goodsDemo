package com.aty.dao;

import com.aty.domain.Operation;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OperationDao {
    /** 查找所有操作 */
    List<Operation> listAll();

    /** 根据Name查找操作详情 */
    List<Operation> queryByName(@Param("goodName") String name);

    /** 添加操作 */
    Integer insert(Operation operation);


}
