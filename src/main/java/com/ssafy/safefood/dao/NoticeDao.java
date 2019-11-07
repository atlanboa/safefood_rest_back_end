package com.ssafy.safefood.dao;

import java.util.List;

import com.ssafy.safefood.vo.NoticeVO;

public interface NoticeDao {
	List<NoticeVO> selectAll() throws Exception;
	NoticeVO selectByNoticeNo(int no) throws Exception;
}
