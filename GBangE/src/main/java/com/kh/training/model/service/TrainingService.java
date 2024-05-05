package com.kh.training.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.training.model.dao.TrainingDao;
import com.kh.training.model.vo.Attachment;
import com.kh.training.model.vo.Training;
import com.kh.training.model.vo.TrainingCategory;

public class TrainingService {

	public ArrayList<TrainingCategory> selectCategoryList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<TrainingCategory> tCList = new TrainingDao().selectCategoryList(conn);

		JDBCTemplate.close(conn);
		return tCList;
	}

	public int insertTraining(Training t, Attachment at) {
		Connection conn = JDBCTemplate.getConnection();

		int trainingNo = new TrainingDao().selectTrainingNo(conn);

		if (trainingNo != 0) {
			t.setTrainingNo(trainingNo);

			int resultTr = new TrainingDao().insertTraining(conn, t);
			int resultAt = 1;

			if (resultTr > 0 && at != null) {
				at.setRefBno(trainingNo);
				resultAt = new TrainingDao().insertAttachment(conn, at);
			}
			if (resultTr * resultAt > 0) {
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			return resultTr * resultAt;
		}else {
			JDBCTemplate.close(conn);
			return trainingNo;
		}
	}

	public int increaseCount(int tno) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new TrainingDao().increaseCount(conn, tno);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public int listCount() {
		Connection conn = JDBCTemplate.getConnection();

		int listCount = new TrainingDao().listCount(conn);

		JDBCTemplate.close(conn);

		return listCount;
	}

	public ArrayList<Training> selectList(PageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Training> list = new TrainingDao().selectList(conn, pi);

		JDBCTemplate.close(conn);

		return list;
	}

}
