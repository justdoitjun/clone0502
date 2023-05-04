package com.kbstar.adm;

import com.kbstar.dto.Adm;
import com.kbstar.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
class InsertTest {
	@Autowired
	AdmService service;

	@Test
	void contextLoads() {
		Adm obj = new Adm("jun7", "james", 2);
		try{
			service.register(obj);
			log.info("success");
			service.get();
		}catch(Exception e){
			if(e instanceof DuplicateKeyException){
				log.info("ID가 중복되었습니다.");
			}else{
				log.info("시스템 장애입니다.");
			}
		}

	}

}
