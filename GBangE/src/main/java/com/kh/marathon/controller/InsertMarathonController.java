package com.kh.marathon.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.marathon.model.service.MarathonService;

/**
 * Servlet implementation class InsertMarathonController
 */
@WebServlet("/insert.ma")
public class InsertMarathonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMarathonController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청들어오면 테이블내의 데이터를 비우고 insert 관리자만 실행시킬수있게 처리
		int result = 0;
		result = new MarathonService().deleteAllMarathon();
		if(result<0) {
			request.getSession().setAttribute("msg", "초기화 실패");
			response.sendRedirect("views/marathon/marathonMain.jsp");
		}else {
			result = new MarathonService().insertMarthon();
			if(result>0) {
				request.getSession().setAttribute("msg", "초기화 성공");				
			}else {
				request.getSession().setAttribute("msg", "초기화 실패");
			}
			response.sendRedirect("views/marathon/marathonMain.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
