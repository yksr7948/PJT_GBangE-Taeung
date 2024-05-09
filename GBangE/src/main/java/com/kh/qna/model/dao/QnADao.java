package com.kh.qna.model.dao;

import java.beans.Statement;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.common.JDBCTemplate;
import com.kh.qna.model.vo.Question;

public class QnADao {
	Properties prop = new Properties();
	public QnADao() {
		String filePath = QnADao.class.getResource("/resources/sql/qna-mapper.xml").getPath();		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int insertQuestion(Connection conn, Question q) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQuestion");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, q.getMemberNo());
			pstmt.setString(2, q.getQuestionTitle());
			pstmt.setString(3, q.getQuestionContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public JSONArray selectQuestion(Connection conn) {
		JSONArray questionArr = new JSONArray();
		java.sql.Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQuestion");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while(rset.next()) {
				JSONObject jobj = new JSONObject();
				jobj.put("questionId",rset.getInt("QUESTION_ID"));
				jobj.put("memberName",rset.getString("MEMBER_NAME"));
				jobj.put("questionTitle",rset.getString("QUESTION_TITLE"));
				jobj.put("questionContent",rset.getString("QUESTION_CONTENT"));
				jobj.put("createDate",rset.getDate("CREATE_DATE"));
				questionArr.add(jobj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return questionArr;
	}

}
