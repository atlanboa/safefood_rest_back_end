package com.ssafy.safefood.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.safefood.vo.QnaVO;

@Repository
public class QnaDaoImpl implements QnaDao{

	final String ns = "QnaMapper.";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<QnaVO> selectAll() throws Exception {
		return session.selectList(ns+"selectAll");
	}

	@Override
	public QnaVO selectByQnaNo(int no) throws Exception {

		return session.selectOne(ns+"selectByQnaNo", no);
	}

	@Override
	public List<QnaVO> selectByQnaTitle(String title) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(ns+"selectByQnaTitle", title);
	}

	@Override
	public void insertQna(QnaVO vo) throws Exception {
		session.insert(ns+"insertQna", vo);
		System.out.println("QnaDaoImpl "+vo);
		
	}

	@Override
	public void updateQna(QnaVO vo) throws Exception {
		session.update(ns+"updateQna", vo);
		
	}

	@Override
	public void deleteQna(int no) throws Exception {
		session.delete(ns+"deleteQna", no);
	}

}
