package com.kh.member.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMember(conn,userId,userPwd);
		
		JDBCTemplate.close(conn);
		
		return m;
	}

	public int insertMember(Member m) {

		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return result;
	}

	public boolean checkId(String inputId) {

		Connection conn = JDBCTemplate.getConnection();
		
		boolean flag = new MemberDao().checkId(conn,inputId);
		
		JDBCTemplate.close(conn);
		
		return flag;
	}

	
}
