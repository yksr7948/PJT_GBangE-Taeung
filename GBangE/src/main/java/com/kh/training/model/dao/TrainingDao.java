package com.kh.training.model.dao;

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
import com.kh.training.model.vo.Training;
import com.kh.training.model.vo.TrainingCategory;

public class TrainingDao {

	private Properties prop = new Properties();
	
	
	
	public TrainingDao() {
		
		String filePath = TrainingDao.class.getResource("/resources/sql/training-mapper.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



	public ArrayList<TrainingCategory> selectCategoryList(Connection conn) {
		ArrayList<TrainingCategory> tCList = new ArrayList<>();
		ResultSet rset = null;
		Statement stmt = null;
		String sql = prop.getProperty("selectCategoryList");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while(rset.next()) {
				tCList.add(new TrainingCategory(
						rset.getInt("TRAINING_KEY")
						,rset.getString("TRAINING_NAME")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return tCList;
	}



	public int insertTraining(Connection conn, Training t) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertTraining");
		try {
			pstmt = conn.prepareStatement(sql);
//			TRAINING_NO
//			MEMBER_NO
//			TRAINING_TITLE
//			TRAINING_KEY
//			SHOES_NO
//			TRAINING_DATE
//			RECORD_DATE
//			TRAINING_PLACE
//			TRAINING_TIME
//			TRAINING_GOAL
//			TRAINING_DISTANCE
//			WEIGHT
//			TRAINING_CONTENT
//			BOARD_ID
//			OCSTATUS
//			STATUS
			pstmt.setString(1, t.getTrainingTitle());
			pstmt.setInt(2, t.getTrainingKey());
			pstmt.setString(3, t.getTrainingDate());
			pstmt.setString(4, t.getTrainingPlace());
			pstmt.setDouble(5, t.getTrainingTime());
			pstmt.setString(6, t.getTrainingGoal());
			pstmt.setDouble(7, t.getTrainingDistance());
			pstmt.setDouble(8, t.getWeight());
			pstmt.setString(9, t.getTrainingContent());
			pstmt.setString(10, t.getoCStatus());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}



	public int increaseCount(Connection conn, int tno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tno);
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



	public ArrayList<Training> selectList(Connection conn, PageInfo pi) {
		
		ArrayList<Training> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow = pi.getCurrentPage()*pi.getBoardLimit();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Training(
						rset.getInt("TRAINING_NO")
						,rset.getString("TRAINING_TITLE")
						,rset.getString("MEMBER_NAME")
						,rset.getDate("RECORD_DATE")
						,rset.getInt("COUNT")
						));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
