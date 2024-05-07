package com.kh.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.notice.model.vo.Notice;



public class NoticeDao {
	
	private Properties prop = new Properties();
	
	
	public NoticeDao() {
		
		String filePath = NoticeDao.class.getResource("/resources/sql/notice-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//글목록
	public ArrayList<Notice> selectNoticeList(Connection conn) {
		
		ArrayList<Notice> list = new ArrayList<>();
		ResultSet rset =null;
		Statement stmt =null;
		String sql =prop.getProperty("selectNoticeList");
		
		try {
			stmt =conn.createStatement();
			rset =stmt.executeQuery(sql);
			
			while(rset.next()){
				list.add(new Notice(rset.getInt("NOTICE_ID")
								   ,rset.getString("NOTICE_TITLE")
								   ,rset.getString("MEMBER_NAME")
								   ,rset.getDate("CREATE_DATE")
								   ,rset.getInt("COUNT")));
								   
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return list;
	}
	//글 작성
	public int insertNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,n.getNoticeTitle());
			pstmt.setString(2,n.getMemberName());
			pstmt.setString(3,n.getNoticeContent());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		
		return result;
	}

	//조회수 증가
	public int increaseCount(Connection conn, int nno) {
		 int result = 0;
	     PreparedStatement pstmt = null;
	     String sql = prop.getProperty("increaseCount");
	      
	     try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			
		}
	     return result;    
	        
	}
	//공지글 상세보기
	public Notice selectNotice(Connection conn, int nno) {
		Notice n = null;//공지글 담을 객체변수
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			 
			if(rset.next()) {
				n = new Notice(rset.getInt("NOTICE_ID")
							  ,rset.getString("NOTICE_TITLE")
							  ,rset.getString("MEMBER_NAME")
							  ,rset.getString("NOTICE_CONTENT")
							  ,rset.getTimestamp("CREATE_DATE")
							  ,rset.getInt("COUNT"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return n;
	}
	
	//공지사항 제목 + 내용으로 검색기능
	public ArrayList<Notice> searchTitleContent(Connection conn, String searchType, String keyword) {
		 ArrayList<Notice> list = new ArrayList<>();
		    PreparedStatement pstmt = null;
		    ResultSet rset = null;
		    String sql = prop.getProperty("searchNotice"); 

		    try {
		       

		        pstmt = conn.prepareStatement(sql);
		        if (searchType.equals("titleContent")) {
		            pstmt.setString(1, "%" + keyword + "%");
		            pstmt.setString(2, "%" + keyword + "%");
		        } else {
		            pstmt.setString(1, "%" + keyword + "%");
		        	
		        }

		        rset = pstmt.executeQuery();

		        while (rset.next()) {
		            Notice notice = new Notice();
		            notice.setNoticeId(rset.getInt("NOTICE_ID"));
		            notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
		            notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
		            notice.setMemberName(rset.getString("MEMBER_NAME"));
		            notice.setCreateDate(rset.getTimestamp("CREATE_DATE"));
		            notice.setCount(rset.getInt("COUNT"));
		            list.add(notice);
		        }
		    } catch (SQLException e) {
		    	// TODO Auto-generated catch block
		        e.printStackTrace();
		    } finally {
		        JDBCTemplate.close(rset);
		        JDBCTemplate.close(pstmt);
		    }
		    return list;
	}
	//공지사항 내용으로 검색기능
	public ArrayList<Notice> searchContent(Connection conn, String searchType, String keyword) {
		 ArrayList<Notice> list = new ArrayList<>();
		    PreparedStatement pstmt = null;
		    ResultSet rset = null;
		    String sql = prop.getProperty("searchContent"); 

		    try {
		       

		        pstmt = conn.prepareStatement(sql);
		        if (searchType.equals("content")) {
		            pstmt.setString(1, "%" + keyword + "%");
		            pstmt.setString(2, "%" + keyword + "%");
		        } else {
		            pstmt.setString(1, "%" + keyword + "%");
		        	
		        }

		        rset = pstmt.executeQuery();

		        while (rset.next()) {
		            Notice notice = new Notice();
		            notice.setNoticeId(rset.getInt("NOTICE_ID"));
		            notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
		            notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
		            notice.setMemberName(rset.getString("MEMBER_NAME"));
		            notice.setCreateDate(rset.getTimestamp("CREATE_DATE"));
		            notice.setCount(rset.getInt("COUNT"));
		            list.add(notice);
		        }
		    } catch (SQLException e) {
		    	// TODO Auto-generated catch block
		        e.printStackTrace();
		    } finally {
		        JDBCTemplate.close(rset);
		        JDBCTemplate.close(pstmt);
		    }
		    return list;
	
		
		
		
		
	}
	//공지사항 제목으로 검색가능
	public ArrayList<Notice> searchTitle(Connection conn, String searchType, String keyword) {
		 ArrayList<Notice> list = new ArrayList<>();
		    PreparedStatement pstmt = null;
		    ResultSet rset = null;
		    String sql = prop.getProperty("searchContent"); 

		    try {
		       

		        pstmt = conn.prepareStatement(sql);
		        if (searchType.equals("title")) {
		            pstmt.setString(1, "%" + keyword + "%");
		            pstmt.setString(2, "%" + keyword + "%");
		        } else {
		            pstmt.setString(1, "%" + keyword + "%");
		        	
		        }

		        rset = pstmt.executeQuery();

		        while (rset.next()) {
		            Notice notice = new Notice();
		            notice.setNoticeId(rset.getInt("NOTICE_ID"));
		            notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
		            notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
		            notice.setMemberName(rset.getString("MEMBER_NAME"));
		            notice.setCreateDate(rset.getTimestamp("CREATE_DATE"));
		            notice.setCount(rset.getInt("COUNT"));
		            list.add(notice);
		        }
		    } catch (SQLException e) {
		    	// TODO Auto-generated catch block
		        e.printStackTrace();
		    } finally {
		        JDBCTemplate.close(rset);
		        JDBCTemplate.close(pstmt);
		    }
		    return list;
	
}

}

	
				
				
				

	

