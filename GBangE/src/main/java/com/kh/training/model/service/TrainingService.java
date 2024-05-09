package com.kh.training.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import org.apache.jasper.compiler.NewlineReductionServletWriter;

import com.google.gson.annotations.Until;
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

	public int insertTraining(Training t, Attachment at, int memberNo) {
		Connection conn = JDBCTemplate.getConnection();

		int trainingNo = new TrainingDao().selectTrainingNo(conn);

		t.setTrainingNo(trainingNo);
		int resultTr = new TrainingDao().insertTraining(conn, t, memberNo);
		int resultAt = new TrainingDao().insertAttachment(conn, at, trainingNo);
		if (resultTr * resultAt > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return resultTr * resultAt;
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

	public Training selectTraining(int tno) {
		Connection conn = JDBCTemplate.getConnection();
		Training t = new TrainingDao().selectTraining(conn, tno);
		JDBCTemplate.close(conn);
		return t;
	}

	public Attachment selectAttachment(int tno) {
		Connection conn = JDBCTemplate.getConnection();
		Attachment at = new TrainingDao().selectAttachment(conn, tno);
		JDBCTemplate.close(conn);
		return at;
	}

	public int updateTraining(Training t, Attachment at) {
		Connection conn = JDBCTemplate.getConnection();
		int resultTr = new TrainingDao().updateTraining(conn, t);

		int resultAt = 1;

		if (at != null) {
			if (at.getFileNo() != 0) {
				resultAt = new TrainingDao().updateAttachment(conn, at);
			} else {
				resultAt = new TrainingDao().insertAttachment(conn, at, at.getRefBno());
			}
		}

		if (resultTr * resultAt > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return resultTr * resultAt;
	}

	public int deleteTraining(int tno) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new TrainingDao().deleteTraining(conn,tno);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
