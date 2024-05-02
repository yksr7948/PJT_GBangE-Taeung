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
	
	
				
				
				

	}

