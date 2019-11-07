package com.ssafy.safefood.service;

import java.util.List;

import com.ssafy.safefood.vo.NoticeVO;

public interface NoticeService {
	List<NoticeVO> selectAll() throws Exception;
	NoticeVO selectByNoticeNo(int no) throws Exception;
}
