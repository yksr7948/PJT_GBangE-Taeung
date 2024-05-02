package com.kh.marathon.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import org.json.simple.JSONObject;

import com.kh.common.JDBCTemplate;

public class MarathonDao{
	private Properties prop = new Properties();
	
	public MarathonDao() {
		String filePath = MarathonDao.class.getResource("/resources/sql/marathon-mapper.xml").getPath();		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int insertMarathon(Connection conn, JSONObject jobj) {
        PreparedStatement pstmt =null;
        String sql = prop.getProperty("insertMarathon");
        int result =0;
        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, (String) jobj.get("marathonName"));
            pstmt.setString(2, (String) jobj.get("location"));
            pstmt.setString(3, (String) jobj.get("region"));
            pstmt.setString(4, (String) jobj.get("marathonDate"));
            pstmt.setString(5, (String) jobj.get("applicationDate"));
            pstmt.setString(6, (String) jobj.get("otherIntroduction"));
            pstmt.setString(7, (String) jobj.get("organizer"));
            pstmt.setString(8, (String) jobj.get("organizerHost"));
            pstmt.setString(9, (String) jobj.get("organizerPhone"));            
            pstmt.setString(10, (String) jobj.get("marathonSite"));            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        return result;
    }
	public int deleteAllMarathon(Connection conn) {
		int result = 0;
		Statement stmt = null;
		String sql=prop.getProperty("deleteAllMarathon");
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return result;
	}

}