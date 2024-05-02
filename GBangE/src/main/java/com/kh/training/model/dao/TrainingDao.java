package com.kh.training.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
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

}
