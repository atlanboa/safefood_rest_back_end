package com.ssafy.safefood.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.safefood.vo.CommentVO;

@Repository
public class CommentDaoImpl implements CommentDao{

	final String ns = "";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<CommentVO> selectByNo(int no) throws Exception {
		return session.selectList(ns+"selectByNo", no);
	}

	@Override
	public void insertComment(CommentVO vo) throws Exception {
		session.insert(ns+"insertComment", vo);
	}

	@Override
	public void updateComment(CommentVO vo) throws Exception {
		session.update(ns+"updateComment", vo);		
	}

	@Override
	public void deleteComment(int no) throws Exception {
		session.delete(ns+"deleteComment", no);	
	}

}
