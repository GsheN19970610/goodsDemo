package com.aty.dao;


import com.aty.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author
 */
@Repository
public interface UserDao {
    /** 查找所有用户 */
    List<User> listAll();
    
    /** 添加用户 */
    Integer insert(User user);
    
    /** 根据id删除用户 */
    Integer deleteById(Integer id);
    
    /** 更新用户 */
    Integer update(User user);
    
    /** 根据id查找用户 */
    User getById(Integer id);

    /** 根据Name查找用户 */
    List<User> queryByName(String name);

    /** 根据条件查询用户 */
    User queryByNameAndByPassword(User user);

    /** 注册用户 */
    Integer register(User user);
}
