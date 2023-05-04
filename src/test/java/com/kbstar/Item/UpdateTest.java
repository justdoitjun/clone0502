package com.kbstar.Item;

import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;

@Slf4j
@SpringBootTest
class UpdateTest {
	@Autowired
	ItemService service;

	@Test
	void contextLoads() {
		try{
			service.modify(new Item(104, "newname", 77,"newimg", null));
			service.get();
		}catch(Exception e){
			log.info("Error");
		}
	}

}
