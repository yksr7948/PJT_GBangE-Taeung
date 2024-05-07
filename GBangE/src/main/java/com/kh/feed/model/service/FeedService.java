package com.kh.feed.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.feed.model.dao.FeedDao;
import com.kh.feed.model.vo.Attachment;
import com.kh.feed.model.vo.Category;
import com.kh.feed.model.vo.Feed;



public class FeedService {

	public ArrayList<Feed> selectFeedList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Feed> list = new FeedDao().selectFeedList(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
		
		
	}

	public int insertFeed(Feed f, Attachment at) {
		Connection conn = JDBCTemplate.getConnection();
		
		int feedNo = new FeedDao().selectFeedNo(conn);
		
		if(feedNo !=0) {
			f.setFeedNo(feedNo);
			
			int result = new FeedDao().insertFeed(conn,f);
			
			int result2 = 1;
			
			if(result>0 && at!=null) {
				
				at.setRefBno(feedNo);
				
				result2 = new FeedDao().insertAttachment(conn,at);
			}
			if(result*result2>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			JDBCTemplate.close(conn);
			return result*result2;
		}else {
			JDBCTemplate.close(conn);
			return feedNo;
		}
		
	}

	public int listCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new FeedDao().listCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}

	public ArrayList<Category> selectCategoryList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Category> cList = new FeedDao().selectCategoryList(conn);
		
		JDBCTemplate.close(conn);
		
		return cList;
	}


}
