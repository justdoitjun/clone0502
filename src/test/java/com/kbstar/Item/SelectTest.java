package com.kbstar.Item;

import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectTest {
	@Autowired
	ItemService service;

	@Test
	void contextLoads() {
		try{
			service.get();
			log.info("success");
		}catch(Exception e){
			log.info("Error");
			e.printStackTrace();
		}
	}

}
