package com.kh.feed.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
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
	
	public ArrayList<Feed> selectFeedList(Connection conn) {
		
		ArrayList<Feed> list = new ArrayList<>();
		ResultSet rset = null;
		Statement stmt = null;
		String sql = prop.getProperty("selectFeedList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
		
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
			JDBCTemplate.close(stmt);
		}
		
		return list;
	}

}
