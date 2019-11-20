package com.ssafy.safefood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.safefood.dao.QnaDao;
import com.ssafy.safefood.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDao dao;
	
	@Override
	public List<QnaVO> selectAll() throws Exception {

		return dao.selectAll();
	}

	@Override
	public QnaVO selectByQnaNo(int no) throws Exception {
		return dao.selectByQnaNo(no);
	}

	@Override
	public List<QnaVO> selectByQnaTitle(String title) throws Exception {
		return dao.selectByQnaTitle(title);
	}

	@Override
	public void insertQna(QnaVO vo) throws Exception {
		System.out.println("QnaDaoImpl "+vo);
		dao.insertQna(vo);
	}

	@Override
	public void updateQna(QnaVO vo) throws Exception {
		dao.updateQna(vo);
	}

	@Override
	public void deleteQna(int no) throws Exception {
		dao.deleteQna(no);
	}

}
