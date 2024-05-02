package com.kh.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;

import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class NoticeService {
	//공지사항 글목록
	public ArrayList<Notice> selectNoticeList() {

			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
			
			JDBCTemplate.close(conn);
			
			return list;
		}
	//공지사항 글작성
	public int insertNotice(Notice n) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().insertNotice(conn,n);
		
	
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	}


