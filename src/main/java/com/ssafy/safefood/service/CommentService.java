package com.ssafy.safefood.service;

import java.util.List;

import com.ssafy.safefood.vo.CommentVO;

public interface CommentService {
	List<CommentVO> selectByNo(int no) throws Exception;
	void insertComment(CommentVO vo) throws Exception;
	void updateComment(CommentVO vo) throws Exception;
	void deleteComment(int no) throws Exception;
}
