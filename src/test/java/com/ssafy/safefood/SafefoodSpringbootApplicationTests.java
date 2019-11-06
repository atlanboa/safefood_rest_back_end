package com.ssafy.safefood;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.ssafy.safefood.service.FoodService;
import com.ssafy.safefood.service.FoodServiceImpl;

@SpringBootTest
class SafefoodSpringbootApplicationTests {

	@Test
	void contextLoads() throws Exception{
		FoodService service = new FoodServiceImpl();
		System.out.println(service.selectAll());
	}

}
