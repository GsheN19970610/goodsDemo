package com.aty.service.impl;

import com.aty.dao.UserDao;
import com.aty.domain.User;
import com.aty.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public List<User> listAll() {
        return userDao.listAll();
    }

    @Override
    public Integer insert(User user) {
        user.setIsAdmin(1);
        return userDao.insert(user);
    }

    @Override
    public Integer deleteById(Integer id) {
        return userDao.deleteById(id);
    }

    @Override
    public Integer update(User user) {
        return userDao.update(user);
    }

    @Override
    public User getById(Integer id) {
        return userDao.getById(id);
    }

    @Override
    public List<User> queryByName(String name) {
        List<User> users = userDao.queryByName(name);
        return users;
    }

    @Override
    public User queryByNameAndByPassword(User user) {
        if (user != null){
           return userDao.queryByNameAndByPassword(user);
        }

        return null;
    }

    @Override
    public Integer register(User user) {
        user.setIsAdmin(0);
        Integer register = userDao.register(user);
        return register;
    }
}
