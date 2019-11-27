package com.ssafy.safefood.service;

import java.util.List;

import com.ssafy.safefood.vo.UserVO;

public interface UserService {
	List<UserVO> getAllUser() throws Exception;
	void insertUser(UserVO user) throws Exception;
	void updateUser(UserVO user) throws Exception;
	void deleteUser(UserVO user) throws Exception;
	UserVO login(UserVO user) throws Exception;
}
