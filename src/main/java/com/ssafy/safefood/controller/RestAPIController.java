package com.ssafy.safefood.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.safefood.service.CommentService;
import com.ssafy.safefood.service.FoodService;
import com.ssafy.safefood.service.NoticeService;
import com.ssafy.safefood.service.QnaService;
import com.ssafy.safefood.service.UserService;
import com.ssafy.safefood.service.UserintakeService;
import com.ssafy.safefood.vo.CommentVO;
import com.ssafy.safefood.vo.FoodVO;
import com.ssafy.safefood.vo.NoticeVO;
import com.ssafy.safefood.vo.QnaVO;
import com.ssafy.safefood.vo.UserVO;
import com.ssafy.safefood.vo.UserintakeVO;

@CrossOrigin
@RestController
@RequestMapping("/api")
public class RestAPIController {

	@Autowired
	private FoodService foodService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private UserintakeService userintakeservice;
	
	@GetMapping("search/{category}")
	public ResponseEntity<List<FoodVO>> search(@PathVariable String category)throws Exception{
		List<FoodVO> list = null;
		list = foodService.selectAll();

		if(list.isEmpty()) return new ResponseEntity(HttpStatus.NO_CONTENT);
		else return new ResponseEntity(list, HttpStatus.OK);
	}
	
	@GetMapping("search/{category}/{keyword}")
	public ResponseEntity<List<FoodVO>> search(@PathVariable String category, @PathVariable String keyword) throws Exception {
		List<FoodVO> list = null;
		if(keyword==null)
		{
			System.out.println("category : "+category+", keyword : "+keyword);
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
	public ResponseEntity updateUser(@RequestBody UserVO user, HttpSession session) throws Exception{
		System.out.println(user);
		userService.updateUser(user);
		session.setAttribute("user", user);
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
	
	
	@GetMapping("/notice")
	public ResponseEntity<List<NoticeVO>> selectAll() throws Exception{
		List<NoticeVO> list = noticeService.selectAll();
		System.out.println(list);
		if(list == null) return new ResponseEntity(HttpStatus.NO_CONTENT);
		else return new ResponseEntity(list, HttpStatus.OK);
	}
	
	@GetMapping("/notice/{no}")
	public ResponseEntity<NoticeVO> selectAll(@PathVariable int no) throws Exception{
		NoticeVO rvo = noticeService.selectByNoticeNo(no);
		if(rvo == null) return new ResponseEntity(HttpStatus.NO_CONTENT);
		else return new ResponseEntity(rvo, HttpStatus.OK);
	}
	
	@PostMapping("/noticeUpdate")
	public ResponseEntity noticeUpdate(@RequestBody NoticeVO pvo) throws Exception{
		System.out.println(pvo);
		noticeService.updateNotice(pvo);
		return new ResponseEntity(HttpStatus.OK);
		
	}
	
	
	
	@PostMapping("/noticeInsert")
	public ResponseEntity noticeInsert(@RequestBody NoticeVO pvo) throws Exception{
//		System.out.println(pvo);
		noticeService.insertNotice(pvo);
		return new ResponseEntity(HttpStatus.OK);
	}
	
	@GetMapping("/noticeDelete/{no}")
	public ResponseEntity noticeDelete(@PathVariable int no) throws Exception{
		System.out.println(no);
		noticeService.deleteNotice(no);
		return new ResponseEntity(HttpStatus.OK);
	}
	
	@GetMapping("/qna")
	public ResponseEntity selectAllQna() throws Exception{
		System.out.println("qna");
		List<QnaVO> rvo = qnaService.selectAll();
		if(rvo == null) return new ResponseEntity(false, HttpStatus.NO_CONTENT);
		else return new ResponseEntity(rvo, HttpStatus.OK);
	}
	
	@GetMapping("/qnano/{no}")
	public ResponseEntity selectByQnaNo(@PathVariable int no) throws Exception{
		System.out.println("qna/no");
		QnaVO rvo = qnaService.selectByQnaNo(no);
		if(rvo == null) return new ResponseEntity(false, HttpStatus.NO_CONTENT);
		else return new ResponseEntity(rvo, HttpStatus.OK);
	}
	
	@GetMapping("/qnatitle/{title}")
	public ResponseEntity selectByQnaTitle(@PathVariable String title) throws Exception{
		System.out.println("qna/title");
		List<QnaVO> rvo = qnaService.selectByQnaTitle(title);
		if(rvo == null) return new ResponseEntity(false, HttpStatus.NO_CONTENT);
		else return new ResponseEntity(rvo, HttpStatus.OK);
	}
	
	@PostMapping("/insertqna")
	public ResponseEntity insertQna(@RequestBody QnaVO vo) throws Exception{
		System.out.println("insertqna");
		qnaService.insertQna(vo);
		return new ResponseEntity(true, HttpStatus.OK);
	}
	
	@PutMapping("/updateqna")
	public ResponseEntity updateQna(@RequestBody QnaVO vo) throws Exception{
		System.out.println("updateQna");
		if(vo==null)return new ResponseEntity(HttpStatus.NO_CONTENT);
		System.out.println(vo);
		qnaService.updateQna(vo);
		return new ResponseEntity(true, HttpStatus.OK);
	}
	
	@GetMapping("/deleteqna/{no}")
	public ResponseEntity selectByQnaTitle(@PathVariable int no) throws Exception{
		System.out.println("deleteqna");
		qnaService.deleteQna(no);
		return new ResponseEntity(HttpStatus.OK);
	}
	
	
	@GetMapping("/comment/{no}")
	public ResponseEntity selectByNo(@PathVariable int no) throws Exception{
		System.out.println("selectByNo");
		List<CommentVO> rvo = commentService.selectByNo(no);
		if(rvo == null) new ResponseEntity(HttpStatus.NO_CONTENT);
		return new ResponseEntity(rvo, HttpStatus.OK);
	}
	
	@PostMapping("/insertcomment")
	public ResponseEntity insertComment(@RequestBody CommentVO vo) throws Exception{
		System.out.println("insertqna"+ vo);
		if(vo == null) return new ResponseEntity(HttpStatus.NO_CONTENT);
		commentService.insertComment(vo);
		return new ResponseEntity(true,HttpStatus.OK);
	}
	
	@PutMapping("/updatecomment")
	public ResponseEntity updateComment(@RequestBody CommentVO vo) throws Exception{
		System.out.println("updateComment");
		commentService.updateComment(vo);
		return new ResponseEntity(HttpStatus.OK);
	}
	
	@GetMapping("/deletecomment/{cno}")
	public ResponseEntity deleteComment(@PathVariable int cno) throws Exception{
		System.out.println("deleteComment");
		commentService.deleteComment(cno);
		return new ResponseEntity(true, HttpStatus.OK);
	}
	
	@PostMapping("/daydetail")
	public ResponseEntity getUserIntake(@RequestBody UserintakeVO vo) throws Exception{
		System.out.println("daydetail"+ vo);
		
		List<UserintakeVO> list = userintakeservice.getUserIntake(vo);
		
		if(list == null) return new ResponseEntity(false, HttpStatus.NO_CONTENT);
		return new ResponseEntity(list ,HttpStatus.OK);
	}
	
	@PostMapping("/daydetail/insert")
	public ResponseEntity insertUserIntake(@RequestBody List<UserintakeVO> list) throws Exception{
		System.out.println("insertUserIntake");
		userintakeservice.insertUserIntake(list);
		if(list == null) return new ResponseEntity(false, HttpStatus.NO_CONTENT);
		return new ResponseEntity(true ,HttpStatus.OK);
	}
	
	@PostMapping("/daydetail/delete")
	public ResponseEntity deleteUserIntake(@RequestBody UserintakeVO vo) throws Exception{
		System.out.println("deleteUserIntake");
		userintakeservice.deleteUserIntake(vo);
		if(vo == null) return new ResponseEntity(false, HttpStatus.NO_CONTENT);
		return new ResponseEntity(true ,HttpStatus.OK);
	}
	
	@PostMapping("/daydetail/update")
	public ResponseEntity updateUserIntake(@RequestBody UserintakeVO vo) throws Exception{
		System.out.println("updateUserIntake");
		userintakeservice.updateUserIntake(vo);
		if(vo == null) return new ResponseEntity(false, HttpStatus.NO_CONTENT);
		return new ResponseEntity(true ,HttpStatus.OK);
	}
	
	

	
	@GetMapping("/cart/{id}")
	public ResponseEntity getAllUserIntake(@PathVariable String id) throws Exception{
		System.out.println("getAllUserIntake : "+ id);
		List<UserintakeVO> list = userintakeservice.getAllUserIntake(id);
		
		int[] time = new int[24];
		
		for(UserintakeVO v : list) {
			
			int index = Integer.parseInt(v.getTime());
			
			time[(index-2)<0?(24+(index-2)):(index-2)]++;
			time[(index-1)<0?(24+(index-1)):(index-1)]++;
			time[index]++;
			time[((index+1)%24)]++;
			time[((index+2)%24)]++;
		}
		
		int maxIdx = 0;
		for(int i=0; i<24; i++) {
			if(time[maxIdx] < time[i]) {
				maxIdx = i;
			}
		}
		
		
		if(list == null) return new ResponseEntity(false, HttpStatus.NO_CONTENT);
		return new ResponseEntity(maxIdx ,HttpStatus.OK);
	}
	
	

}
