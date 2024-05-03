package com.kh.feed.model.dao;

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
import com.kh.common.model.vo.PageInfo;
import com.kh.feed.model.vo.Feed;



public class FeedDao {
	
	private Properties prop = new Properties();
	
	public FeedDao() {
		
		String filePath = FeedDao.class.getResource("/resources/sql/feed-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<Feed> selectFeedList(Connection conn, PageInfo pi) {
		
		ArrayList<Feed> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectFeedList");
		
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery(sql);
		
			while(rset.next()) {
				list.add(new Feed(rset.getInt("FEED_NO")
								,rset.getString("FEED_TITLE")
								,rset.getString("MEMBER_ID")
								,rset.getInt("COUNT")
								,rset.getDate("CREATE_DATE")));
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public int insertFeed(Connection conn, Feed f) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFeed");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFeedTitle());
			pstmt.setString(2, f.getMemberNo());
			pstmt.setString(3, f.getFeedContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int listCount(Connection conn) {
		ResultSet rset = null;
		Statement stmt = null;
		String sql = prop.getProperty("listCount");
		
		int listCount = 0;
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return listCount;
	}


}
