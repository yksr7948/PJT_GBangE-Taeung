package com.kh.feed.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.feed.model.dao.FeedDao;
import com.kh.feed.model.vo.Feed;


public class FeedService {

	public ArrayList<Feed> selectFeedList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Feed> list = new FeedDao().selectFeedList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

}
