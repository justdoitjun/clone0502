package com.kbstar.cart;

import com.kbstar.service.AdmService;
import com.kbstar.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class SelectTest {

    @Autowired
    CartService service;

    @Test
    void contextLoads(){
//        List<Cust> list = null;
        try {
//            list = service.get();
            service.get();
//            for (Cust obj : list){
//                log.info(obj.toString());
//            }
        } catch (Exception e) {
            log.info("에러 ..... ");
           e.printStackTrace();
        }
    }
}
