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
		
			f.setFeedNo(feedNo);
			
			int result = new FeedDao().insertFeed(conn,f);
			int result2 = new FeedDao().insertAttachment(conn, at,feedNo);

			if(result*result2>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			JDBCTemplate.close(conn);
			
			return result*result2;
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

	public int increaseCount(int fno) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new FeedDao().increaseCount(conn,fno);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	public Feed selectFeed(int fno) {
		Connection conn = JDBCTemplate.getConnection();
		
		Feed f = new FeedDao().selectFeed(conn,fno);
		
		JDBCTemplate.close(conn);
		
		return f;
	}

	public Attachment selectAttachment(int fno) {
		Connection conn = JDBCTemplate.getConnection();
		
		Attachment at = new FeedDao().selectAttachment(conn,fno);
		
		JDBCTemplate.close(conn);
		
		return at;
	}


}
