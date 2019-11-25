package com.ssafy.safefood.service;

import java.util.List;

import com.ssafy.safefood.vo.UserintakeVO;

public interface UserintakeService {
	List<UserintakeVO> getAllUserIntake(String id) throws Exception;
	List<UserintakeVO> getUserIntake(UserintakeVO vo) throws Exception;
	void insertUserIntake(List<UserintakeVO> list)  throws Exception;
	void deleteUserIntake(UserintakeVO vo) throws Exception;
	void updateUserIntake(UserintakeVO vo) throws Exception;
}
