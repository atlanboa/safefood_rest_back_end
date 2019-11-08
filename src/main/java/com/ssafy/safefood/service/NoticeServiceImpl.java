package com.ssafy.safefood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.safefood.dao.NoticeDao;
import com.ssafy.safefood.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao dao;
	
	@Override
	public List<NoticeVO> selectAll() throws Exception {
		return dao.selectAll();
	}

	@Override
	public NoticeVO selectByNoticeNo(int no) throws Exception {

		return dao.selectByNoticeNo(no);
	}

}
