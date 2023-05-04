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
public class UpdateTest {

    @Autowired
    CartService service;

    @Test
    void contextLoads(){
        Cart cart = new Cart(1, 1,"id01", "name", 100);
        try {
            service.modify(cart);
        } catch (Exception e) {
            log.info("에러 ..... ");
           e.printStackTrace();
        }
    }
}
