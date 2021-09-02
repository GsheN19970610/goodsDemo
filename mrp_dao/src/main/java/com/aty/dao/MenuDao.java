package com.aty.dao;

import com.aty.domain.Menu;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuDao {

    List<Menu> showMenu(@Param("isAdmin") Integer id);
}
