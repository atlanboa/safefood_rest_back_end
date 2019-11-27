package com.ssafy.safefood.dao;

import java.util.List;

import com.ssafy.safefood.vo.CommentVO;

public interface CommentDao {
	List<CommentVO> selectByNo(int no) throws Exception;
	void insertComment(CommentVO vo) throws Exception;
	void updateComment(CommentVO vo) throws Exception;
	void deleteComment(int cno) throws Exception;
}


