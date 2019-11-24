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
		return session.selectList(ns+"getUserIntake");
	}

	
	
}
