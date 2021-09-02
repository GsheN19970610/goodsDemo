package com.aty;

import com.aty.controller.WeaverOperation;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@MapperScan("com.aty.dao")
@EnableAspectJAutoProxy
public class MrpControllerApplication {

    @Autowired
    private WeaverOperation weaverOperation;

    public static void main(String[] args) {
        SpringApplication.run(MrpControllerApplication.class, args);
    }

    @Bean
    public WeaverOperation getWeaver(){
        return new WeaverOperation();
    }

}
