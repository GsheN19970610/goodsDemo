package com.aty.controller;


import com.aty.domain.Goods;
import com.aty.domain.Operation;
import com.aty.service.OperationService;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;

@Aspect
public class WeaverOperation {


    @Autowired
    private OperationService operationService;
    /**
     * 织入点 此处通过织入 进行出入库记录
     */
    @Pointcut("execution(* com.aty.service.GoodsService.update(..))")
    public void performance() {

    }
//    @Pointcut("execution(* com.aty.controller.GoodsController.addGoodsNum(..))")
//    public void performance() {
//
//    }

    //在更新出库方法后执行此方法
    @Before("execution(* com.aty.service.GoodsService.update(..))&&args(goods))")
    public void outOperation(Goods goods) {
        Operation operation = new Operation();
        operation.setGoodName(goods.getGoodName());
        operation.setOperationNum(goods.getGoodNum());
        operation.setOperationType(-1);
        operation.setUserId(goods.getUserId());
        operationService.insert(operation);
        System.out.println("太好了出库了"+goods);
        System.out.println("Silencing cellPhones");
    }

    //在添加方法后执行此方法
    @Before("execution(* com.aty.service.GoodsService.insert(..))&&args(goods))")
    public void intoOperation(Goods goods) {
        Operation operation = new Operation();
        operation.setGoodName(goods.getGoodName());
        operation.setOperationNum(goods.getGoodNum());
        operation.setOperationType(1);
        operation.setUserId(goods.getUserId());
        operationService.insert(operation);
        System.out.println("太好了添加了"+goods);
        System.out.println("Silencing cellPhones");
    }

    //在入库方法后执行此方法
    @Before("execution(* com.aty.service.GoodsService.addGoodsNums(..))&&args(goods))")
    public void addOperation(Goods goods) {
        System.out.println("我拿到的数字===="+goods.toString());
        System.out.println("我拿到的ID===="+goods.getUserId());
        Operation operation = new Operation();
        operation.setGoodName(goods.getGoodName());
        operation.setOperationNum(goods.getGoodNum());
        operation.setOperationType(2);
        operation.setUserId(goods.getUserId());
        operationService.insert(operation);
        System.out.println("太好了入库了"+goods);
        System.out.println("Silencing cellPhones");
    }

    //在更新方法后执行此方法
    @Before("execution(* com.aty.service.GoodsService.updateGoods(..))&&args(goods))")
    public void updateGoodsOperation(Goods goods) {
        Operation operation = new Operation();
        operation.setGoodName(goods.getGoodName());
        operation.setOperationNum(goods.getGoodNum());
        operation.setOperationType(3);
        operation.setUserId(goods.getUserId());
        operationService.insert(operation);
        System.out.println("太好了更新了"+goods);
        System.out.println("Silencing cellPhones");
    }


    //在删除方法后执行此方法
    @Before("execution(* com.aty.service.GoodsService.deleteById(..))&&args(goods))")
    public void deleteByIdOperation(Goods goods) {
        Operation operation = new Operation();
        operation.setGoodName(goods.getGoodName());
        operation.setOperationNum(goods.getGoodNum());
        operation.setOperationType(4);
        operation.setUserId(goods.getUserId());
        operationService.insert(operation);
        System.out.println("太好了删除了"+goods);
        System.out.println("Silencing cellPhones");
    }

    //@After, @AfterReturning, @AfterThrowing 类似


}