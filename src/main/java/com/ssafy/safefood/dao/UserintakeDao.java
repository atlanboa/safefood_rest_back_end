package com.ssafy.safefood.dao;

import java.util.List;

import com.ssafy.safefood.vo.UserintakeVO;

public interface UserintakeDao {
	
	List<UserintakeVO> getUserIntake(UserintakeVO vo) throws Exception;
}
