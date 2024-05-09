package com.kh.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Attachment;
import com.kh.notice.model.vo.Notice;


public class NoticeService {
	//공지사항 글목록
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {

			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn,pi);
			
			JDBCTemplate.close(conn);
			
			return list;
		}
	//공지사항 글작성
	public int insertNotice(Notice n,Attachment at) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().insertNotice(conn,n,at);
	
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
	//제목 + 내용, 제목, 내용 검색 기능
	public ArrayList<Notice> searchNoticeList(String searchType, String keyword) {
	    Connection conn = JDBCTemplate.getConnection();
	    ArrayList<Notice> list = new ArrayList<>();

	    try {
	        NoticeDao noticeDAO = new NoticeDao(); 
	        switch (searchType) {
	            case "titleContent":
	                list = noticeDAO.searchTitleContent(conn, searchType, keyword);
	                break;
	            case "content":
	                list = noticeDAO.searchContent(conn, searchType, keyword);
	                break;
	            case "title":
	                list = noticeDAO.searchTitle(conn, searchType, keyword);
	                break;
	            default:
	                break;
	        }
	   
	    } catch (Exception e) {
	        e.printStackTrace(); 
	    } finally {
	        JDBCTemplate.close(conn); 
	    }

	    return list;
	}
	
	
	
	public Attachment selectAttachment(int nno) {
		Connection conn = JDBCTemplate.getConnection();
		
		Attachment at = new NoticeDao().selectAttachment(conn,nno);
		JDBCTemplate.close(conn);
		
		return at;
	}
	//게시글 수정
	public int updateNotice(Notice notice, Attachment at) {
		Connection conn = JDBCTemplate.getConnection();
		
		 
		int result = new NoticeDao().updateNotice(conn,notice);
		
		int result2 = 1; 
	
		if(at!=null) {
			
			if(at.getFileNo()!=0) {  
				result2 = new NoticeDao().updateAttachment(conn,at);
			}else { 
				result2 = new NoticeDao().insertAttachment(conn, at);
			}
		}
		if(result*result2>0) { 
			JDBCTemplate.commit(conn);
		}else { 
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result*result2;
	}
	public int deleteNotice(int noticeId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().deleteNotice(conn,noticeId);
		//DML (UPDATE/DELETE) 구문이니 트랜잭션 처리
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
		
		
	}
	
	
	
	
	

	}

	


