package com.aty.service.impl;

import com.aty.dao.MenuDao;
import com.aty.domain.Menu;
import com.aty.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuDao menuDao;
    @Override
    public List<Menu> showMenu(Integer adminId) {
        List<Menu> menus = menuDao.showMenu(adminId);
        System.out.println(menus);
        return menus;
    }
}