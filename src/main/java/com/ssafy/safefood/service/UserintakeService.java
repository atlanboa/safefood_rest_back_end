package com.ssafy.safefood.service;

import java.util.List;

import com.ssafy.safefood.vo.UserintakeVO;

public interface UserintakeService {
	List<UserintakeVO> getUserIntake(UserintakeVO vo) throws Exception;
}
