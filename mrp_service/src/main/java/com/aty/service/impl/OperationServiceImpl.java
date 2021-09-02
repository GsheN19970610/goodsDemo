package com.aty.service.impl;

import com.aty.dao.OperationDao;
import com.aty.domain.Operation;
import com.aty.service.OperationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class OperationServiceImpl implements OperationService {

    @Autowired
    private OperationDao operationDao;
    @Override
    public List<Operation> listAll() {
        List<Operation> operations = operationDao.listAll();
        return operations;
    }

    @Override
    public List<Operation> queryByName(String name) {
        List<Operation> operations = operationDao.queryByName(name);
        return operations;
    }

    @Override
    public Integer insert(Operation operation) {
        operation.setOperationTime(new Date());
        Integer insert = operationDao.insert(operation);
        return insert;
    }

}