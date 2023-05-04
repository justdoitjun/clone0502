package com.kbstar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@SpringBootApplication
public class Web11Application {

	public static void main(String[] args) {
		SpringApplication.run(Web11Application.class, args);
	}
	@Bean
	public InternalResourceViewResolver setupViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/views/");  //Views폴더에서...
		resolver.setSuffix(".jsp");		//.jsp 확장자를 뒤에 붙여라
		return resolver;
	}

}
