package com.ssafy.safefood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.safefood.dao.CommentDao;
import com.ssafy.safefood.vo.CommentVO;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDao dao;
	
	@Override
	public List<CommentVO> selectByNo(int no) throws Exception {
		return dao.selectByNo(no);
	}

	@Override
	public void insertComment(CommentVO vo) throws Exception {
		dao.insertComment(vo);
	}

	@Override
	public void updateComment(CommentVO vo) throws Exception {
		dao.updateComment(vo);
	}

	@Override
	public void deleteComment(int cno) throws Exception {
		dao.deleteComment(cno);
	}

}
