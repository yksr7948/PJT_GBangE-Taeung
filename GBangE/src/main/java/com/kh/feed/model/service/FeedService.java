package com.kh.feed.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.feed.model.dao.FeedDao;
import com.kh.feed.model.vo.Feed;



public class FeedService {

	public ArrayList<Feed> selectFeedList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Feed> list = new FeedDao().selectFeedList(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
		
		
	}

	public int insertFeed(Feed f) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new FeedDao().insertFeed(conn,f);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int listCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new FeedDao().listCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}


}
