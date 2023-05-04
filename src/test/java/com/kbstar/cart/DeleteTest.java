package com.kbstar.cart;

import com.kbstar.dto.Cart;
import com.kbstar.service.AdmService;
import com.kbstar.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class DeleteTest {

    @Autowired
    CartService service;

    @Test
    void contextLoads(){
        Integer id = 103;
        try {
            service.remove(id);
        } catch (Exception e) {
            log.info("에러 ..... ");
           e.printStackTrace();
        }
    }
}
