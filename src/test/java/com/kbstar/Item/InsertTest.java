package com.kbstar.Item;

import com.kbstar.dto.Cust;
import com.kbstar.dto.Item;
import com.kbstar.service.CustService;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.util.Date;

@Slf4j
@SpringBootTest
class InsertTest {
	@Autowired
	ItemService service;

	@Test
	void contextLoads() {
		Item obj = new Item(101, "name", 30, "img1", null);
		try{
			service.register(obj);
			log.info("success");
			service.get();
		}catch(Exception e){
			if(e instanceof DuplicateKeyException){
				log.info("ID가 중복되었습니다.");
			}else{
				log.info("시스템 장애입니다.");
				e.printStackTrace();
			}
		}

	}

}
