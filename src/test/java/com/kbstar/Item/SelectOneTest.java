package com.kbstar.Item;

import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.util.Date;

@Slf4j
@SpringBootTest
class SelectOneTest {
	@Autowired
	ItemService service;

	@Test
	void contextLoads() {

		try{
			service.get(104);
			log.info("Success");
		}catch(Exception e){
			log.info("Error");
			e.printStackTrace();
		}

	}

}
