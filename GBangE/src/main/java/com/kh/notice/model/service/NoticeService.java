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
	//조회수 증가
	public int increaseCount(int nno) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().increaseCount(conn, nno);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
		
	}
	//글 상세보기
	public Notice selectNotice(int nno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn,nno);
		
		//조회구문은 트랜잭션 처리 필요없음
		
		JDBCTemplate.close(conn);
		
		
		return n;
	}

	}


