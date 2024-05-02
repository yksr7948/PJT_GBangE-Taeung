package com.kh.marathon.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import org.json.simple.JSONArray;
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
	public JSONArray selectMarathon(Connection conn) {
		JSONArray MarathonArr = new JSONArray();
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMarathon");
		try {
			stmt=conn.createStatement();
			rset = stmt.executeQuery(sql);
			while(rset.next()) {
				JSONObject jobj = new JSONObject();
				jobj.put("marathonNo",rset.getString("MARATHON_NO"));
				jobj.put("marathonName",rset.getString("MARATHON_NAME"));
				jobj.put("location",rset.getString("LOCATION"));
				jobj.put("region",rset.getString("REGION"));
				jobj.put("marathonDate",rset.getString("MARATHON_DATE").substring(0, rset.getString("MARATHON_DATE").indexOf(" ")));
				jobj.put("marathonSite",rset.getString("MARATHON_SITE"));
				jobj.put("organizer", rset.getString("ORGANIZER"));
				jobj.put("otherIntroduction", rset.getString("OTHER_INTRODUCTION"));
				MarathonArr.add(jobj);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return MarathonArr;
	}

}