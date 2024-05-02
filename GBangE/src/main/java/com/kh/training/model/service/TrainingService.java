package com.kh.training.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.training.model.dao.TrainingDao;
import com.kh.training.model.vo.TrainingCategory;

public class TrainingService {

	public ArrayList<TrainingCategory> selectCategoryList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<TrainingCategory> tCList = new TrainingDao().selectCategoryList(conn);
		
		JDBCTemplate.close(conn);
		return tCList;
	}

}
