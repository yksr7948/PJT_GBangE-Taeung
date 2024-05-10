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
import com.kh.training.model.vo.Attachment;
import com.kh.training.model.vo.Reply;
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
			while (rset.next()) {
				tCList.add(new TrainingCategory(rset.getInt("TRAINING_KEY"), rset.getString("TRAINING_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return tCList;
	}

	public int insertTraining(Connection conn, Training t, int memberNo) {
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
			pstmt.setInt(1, t.getTrainingNo());
			pstmt.setInt(2, memberNo);
			pstmt.setString(3, t.getTrainingTitle());
			pstmt.setString(4, t.getTrainingKey());
			pstmt.setString(5, t.getTrainingDate());
			pstmt.setString(6, t.getTrainingPlace());
			pstmt.setDouble(7, t.getTrainingTime());
			pstmt.setString(8, t.getTrainingGoal());
			pstmt.setDouble(9, t.getTrainingDistance());
			pstmt.setDouble(10, t.getWeight());
			pstmt.setString(11, t.getTrainingContent());
			pstmt.setString(12, t.getoCStatus());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		} finally {
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
			if (rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Training(rset.getInt("TRAINING_NO"), rset.getString("TRAINING_TITLE"),
						rset.getString("MEMBER_NAME"), rset.getDate("RECORD_DATE"), rset.getInt("COUNT")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public int selectTrainingNo(Connection conn) {
		int trainingNo = 0;
		ResultSet rset = null;
		Statement stmt = null;

		String sql = prop.getProperty("selectTrainingNo");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			if (rset.next()) {
				trainingNo = rset.getInt("TNO");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return trainingNo;
	}

	public int insertAttachment(Connection conn, Attachment at, int trainingNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trainingNo);
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Training selectTraining(Connection conn, int tno) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectTraining");
		Training t = new Training();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tno);
			rset = pstmt.executeQuery();
			if (rset.next()) {
//				TRAINING_NO,
				t.setTrainingNo(rset.getInt("TRAINING_NO"));
//				MEMBER_NAME,
				t.setTrainingWriter(rset.getString("MEMBER_NAME"));
//				TRAINING_TITLE,
				t.setTrainingTitle(rset.getString("TRAINING_TITLE"));
//				COUNT,
				t.setCount(rset.getInt("COUNT"));
//				TRAINING_NAME,
				t.setTrainingKey(rset.getString("TRAINING_NAME"));
//				SHOES_NO,
				t.setShoesNo(rset.getInt("SHOES_NO"));
//				TRAINING_DATE,
				t.setTrainingDate(rset.getString("TRAINING_DATE"));
//				RECORD_DATE,
				t.setRecordDate(rset.getDate("RECORD_DATE"));
//				TRAINING_PLACE,
				t.setTrainingPlace(rset.getString("TRAINING_PLACE"));
//				TRAINING_TIME,
				t.setTrainingTime(rset.getDouble("TRAINING_TIME"));
//				TRAINING_GOAL,
				t.setTrainingGoal(rset.getString("TRAINING_GOAL"));
//				TRAINING_DISTANCE,
				t.setTrainingDistance(rset.getDouble("TRAINING_DISTANCE"));
//				T.WEIGHT WEIGHT,
				t.setWeight(rset.getDouble("WEIGHT"));
//				TRAINING_CONTENT
				t.setTrainingContent(rset.getString("TRAINING_CONTENT"));
//				OCSTATUS
				t.setoCStatus(rset.getString("OCSTATUS"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return t;
	}

	public Attachment selectAttachment(Connection conn, int tno) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachment");
		Attachment at = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tno);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				at = new Attachment(rset.getInt("FILE_NO"), rset.getString("FILE_NAME"), rset.getString("FILE_RENAME"),
						rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return at;
	}

	public int updateTraining(Connection conn, Training t) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateTraining");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTrainingTitle());
			pstmt.setString(2, t.getTrainingKey());
			pstmt.setString(3, t.getTrainingDate());
			pstmt.setString(4, t.getTrainingPlace());
			pstmt.setDouble(5, t.getTrainingTime());
			pstmt.setString(6, t.getTrainingGoal());
			pstmt.setDouble(7, t.getTrainingDistance());
			pstmt.setDouble(8, t.getWeight());
			pstmt.setString(9, t.getTrainingContent());
			pstmt.setString(10, t.getoCStatus());
			pstmt.setInt(11, t.getTrainingNo());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setInt(3, at.getFileNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteTraining(Connection conn, int tno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteTraining");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getreplyContent());
			pstmt.setInt(2, r.getRefTno());
			pstmt.setString(3, r.getreplyWriter());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Reply> selectReplyList(Connection conn, int refTno) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Reply>list = new ArrayList<>();
		String sql = prop.getProperty("selectReplyList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, refTno);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Reply(
						rset.getString("REPLY_CONTENT")
						,rset.getString("MEMBER_NAME")
						,rset.getDate("CREATE_DATE")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


}
