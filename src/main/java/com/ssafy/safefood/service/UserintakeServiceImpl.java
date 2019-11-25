package com.ssafy.safefood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.safefood.dao.UserintakeDao;
import com.ssafy.safefood.vo.UserintakeVO;


@Service
public class UserintakeServiceImpl implements UserintakeService{

	@Autowired
	private UserintakeDao dao;
	
	@Override
	public List<UserintakeVO> getUserIntake(UserintakeVO vo) throws Exception {
		
		return dao.getUserIntake(vo);
	}

	@Override
	public void insertUserIntake(List<UserintakeVO> list) throws Exception {
		dao.insertUserIntake(list);
	}

	@Override
	public void deleteUserIntake(UserintakeVO vo) throws Exception {
		dao.deleteUserIntake(vo);
	}

	@Override
	public void updateUserIntake(UserintakeVO vo) throws Exception {
		dao.updateUserIntake(vo);
	}

}
