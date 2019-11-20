package com.ssafy.safefood.service;

import java.util.List;

import com.ssafy.safefood.vo.NoticeVO;
import com.ssafy.safefood.vo.QnaVO;

public interface QnaService {
	List<QnaVO> selectAll() throws Exception;
	QnaVO selectByQnaNo(int no) throws Exception;
	List<QnaVO> selectByQnaTitle(String title) throws Exception;
	void insertQna(QnaVO vo) throws Exception;
	void updateQna(QnaVO vo) throws Exception;
	void deleteQna(int no) throws Exception;
}
	