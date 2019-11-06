package com.ssafy.safefood.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.safefood.service.FoodService;
import com.ssafy.safefood.service.UserService;
import com.ssafy.safefood.vo.FoodVO;

@RestController
public class RestAPIController {

	@Autowired
	private FoodService foodService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("{maker}/{keword}")
	public String selectByFoodMaker(@PathVariable String maker,@PathVariable String keword) throws Exception {
		System.out.println("maker : "+maker+" keword : "+keword);
//		List<FoodVO> list = foodService.selectByFoodMaker(keword);
		return maker+" "+keword;
	}
}
