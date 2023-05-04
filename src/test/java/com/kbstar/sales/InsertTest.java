package com.kbstar.sales;


import com.kbstar.dto.Sales;
import com.kbstar.service.SalesService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import java.util.Date;

@Slf4j
@SpringBootTest
class InsertTest {

	@Autowired
	SalesService service;

	@Test
	void contextLoads() {
		Date date = new Date();
		Sales obj = new Sales("2023-04-27", 15000, "F" );
		try {
			service.register(obj);
			log.info("등록 정상..");
			service.get();
		} catch (Exception e) {
				log.info("시스템 장애입니다-----------------------");
				e.printStackTrace();  //에러를 자세히 보려면 요렇게
			}
		}
	}
