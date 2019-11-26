package com.ssafy.safefood.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.safefood.vo.UserintakeVO;

@Repository
public class UserintakeDaoImpl implements UserintakeDao{

	final String ns ="UserIntakeMapper.";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<UserintakeVO> getUserIntake(UserintakeVO vo) throws Exception {
		
		List<UserintakeVO> list = session.selectList(ns+"getUserIntake", vo);
//		for(UserintakeVO v : list) {
//			System.out.println("DAO ::::::::::: "+v);
//		}
		return list;
	}

	@Override
	public void insertUserIntake(List<UserintakeVO> list) throws Exception {
		for(UserintakeVO v : list) {
			session.insert(ns+"insertUserIntake", v);
		}
	}

	@Override
	public void deleteUserIntake(UserintakeVO vo) throws Exception {
		session.delete(ns+"deleteUserIntake", vo);
	}

	@Override
	public void updateUserIntake(UserintakeVO vo) throws Exception {
		session.update(ns+"updateUserIntake", vo);
	}

	@Override
	public List<UserintakeVO> getAllUserIntake(String id) throws Exception {
		return session.selectList(ns+"getAllUserIntake", id);
	}

	
	
}
