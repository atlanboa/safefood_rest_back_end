package com.ssafy.safefood.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.safefood.service.FoodService;
import com.ssafy.safefood.service.NoticeService;
import com.ssafy.safefood.service.UserService;
import com.ssafy.safefood.vo.FoodVO;
import com.ssafy.safefood.vo.NoticeVO;
import com.ssafy.safefood.vo.UserVO;

@RestController
public class RestAPIController {

	@Autowired
	private FoodService foodService;

	@Autowired
	private UserService userService;
<<<<<<< src/main/java/com/ssafy/safefood/controller/RestAPIController.java
	
	@Autowired
	private NoticeService noticeService;
=======
	@GetMapping("search/{category}")
	public ResponseEntity<List<FoodVO>> search(@PathVariable String category)throws Exception{
		List<FoodVO> list = null;
		list = foodService.selectAll();
>>>>>>> src/main/java/com/ssafy/safefood/controller/RestAPIController.java

		if(list.isEmpty()) return new ResponseEntity(HttpStatus.NO_CONTENT);
		else return new ResponseEntity(list, HttpStatus.OK);
	}
	@GetMapping("search/{category}/{keyword}")
	public ResponseEntity<List<FoodVO>> search(@PathVariable String category, @PathVariable String keyword) throws Exception {
		System.out.println("category : "+category+", keyword : "+keyword);
		List<FoodVO> list = null;
		switch (category) {
		case "maker":
			list = foodService.selectByFoodMaker(keyword);
			System.out.println("maker:"+list);
			if(list.isEmpty()) return new ResponseEntity(HttpStatus.NO_CONTENT);
			else return new ResponseEntity(list, HttpStatus.OK);
		case "name":
			list = foodService.selectByFoodName(keyword);
			System.out.println("name:"+list);
			if(list.isEmpty()) return new ResponseEntity(HttpStatus.NO_CONTENT);
			else return new ResponseEntity(list, HttpStatus.OK);
		case "material":
			list = foodService.selectByFoodMaterial(keyword);
			System.out.println("material:"+list);
			if(list.isEmpty()) return new ResponseEntity(HttpStatus.NO_CONTENT);
			else return new ResponseEntity(list, HttpStatus.OK);
<<<<<<< src/main/java/com/ssafy/safefood/controller/RestAPIController.java
		} else {

			
			if(category.equalsIgnoreCase("maker")) {
				list = foodService.selectByFoodMaker(keyword);
				if(list == null) return new ResponseEntity(HttpStatus.NO_CONTENT);
				else return new ResponseEntity(list, HttpStatus.OK);
			}else if(category.equalsIgnoreCase("name")) {
				list = foodService.selectByFoodName(keyword);
				if(list == null) return new ResponseEntity(HttpStatus.NO_CONTENT);
				else return new ResponseEntity(list, HttpStatus.OK);
			}else if(category.equalsIgnoreCase("material")) {
				list = foodService.selectByFoodMaterial(keyword);
				if(list==null) return new ResponseEntity(HttpStatus.NO_CONTENT);
				else return new ResponseEntity(list, HttpStatus.OK);
			}
			


=======
>>>>>>> src/main/java/com/ssafy/safefood/controller/RestAPIController.java
		}

		return new ResponseEntity(HttpStatus.NO_CONTENT);

	}

	@GetMapping("selectByFoodCode/{code}")
	public ResponseEntity<FoodVO> selectByFoodCode(@PathVariable String code) throws Exception{
		System.out.println(code);
		FoodVO rvo = foodService.selectByFoodCode(code);
		if(rvo == null) return new ResponseEntity(HttpStatus.NO_CONTENT);
		else return new ResponseEntity(rvo, HttpStatus.OK);
	}

	@PostMapping("/insertUser")
	public ResponseEntity insertUser(@RequestBody UserVO user) throws Exception{
		System.out.println(user);
		userService.insertUser(user);
		return new ResponseEntity(HttpStatus.OK);

	}
	@PostMapping("/updateUser")
	public ResponseEntity updateUser(@RequestBody UserVO user) throws Exception{
		System.out.println(user);
		userService.updateUser(user);
		return new ResponseEntity(HttpStatus.OK);

	}
	@PostMapping("/deleteUser")
	public ResponseEntity deleteUser(@RequestBody UserVO user) throws Exception{
		System.out.println(user);
		userService.deleteUser(user);
		return new ResponseEntity(HttpStatus.OK);

	}

	@PostMapping("/login")
	public ResponseEntity<UserVO> login(@RequestBody UserVO user, HttpSession session) throws Exception{
		UserVO rvo = userService.login(user);
		session.setAttribute("user", rvo);
		if(rvo == null) return new ResponseEntity(HttpStatus.NO_CONTENT);
		else return new ResponseEntity(rvo, HttpStatus.OK);
	}

	@GetMapping("/logout")
	public ResponseEntity logout(HttpSession session) throws Exception{
		session.invalidate();
		return new ResponseEntity(HttpStatus.OK); 
	}
<<<<<<< src/main/java/com/ssafy/safefood/controller/RestAPIController.java
	
	
	@GetMapping("/notice")
	public ResponseEntity<List<NoticeVO>> selectAll() throws Exception{
		List<NoticeVO> list = noticeService.selectAll();
		if(list == null) return new ResponseEntity(HttpStatus.NO_CONTENT);
		else return new ResponseEntity(list, HttpStatus.OK);
	}
	
	@GetMapping("/notice/{no}")
	public ResponseEntity<NoticeVO> selectAll(@PathVariable int no) throws Exception{
		NoticeVO rvo = noticeService.selectByNoticeNo(no);
		if(rvo == null) return new ResponseEntity(HttpStatus.NO_CONTENT);
		else return new ResponseEntity(rvo, HttpStatus.OK);
	}
=======

>>>>>>> src/main/java/com/ssafy/safefood/controller/RestAPIController.java

}
