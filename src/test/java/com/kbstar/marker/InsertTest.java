package com.kbstar.marker;

import com.kbstar.dto.Cust;
import com.kbstar.dto.Marker;
import com.kbstar.service.CustService;
import com.kbstar.service.MarkerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
class InsertTest {
    @Autowired
    MarkerService service;

    @Test
    void contextLoads() throws Exception {
        Marker obj = new Marker(1, "a", "m", 37.638446, 127.012702, "kuk.jpg", "S");
        try {
            service.register(obj);
            log.info("등록 정상");
        } catch (Exception e) {
            if (e instanceof DuplicateKeyException) {
                log.info("이미 사용 중인 ID입니다!----------------------------------------");
            } else {
                log.info("등록에러..");
            }
        }
    }
}

