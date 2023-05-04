package com.kbstar.cart;

import com.kbstar.dto.Adm;
import com.kbstar.dto.Cart;
import com.kbstar.service.AdmService;
import com.kbstar.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class SelectOneTest {

    @Autowired
    CartService service;

    @Test
    void contextLoads(){
        int id = 100;
        Cart cart = null;
        try {
            cart = service.get(id);
        } catch (Exception e) {
            log.info("에러 ..... ");
           e.printStackTrace();
        }
    }
}
