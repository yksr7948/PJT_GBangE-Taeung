package com.kh.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;



/**
 * Servlet implementation class InsertNoticeController
 */
@WebServlet("/insert.no")
public class InsertNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.getRequestDispatcher("views/notice/noticeInsertView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		 
		String content = request.getParameter("content");
		
		
		HttpSession session = request.getSession();
		int memberNo = (int) session.getAttribute("memberNo");
		Notice n = new Notice();
		n.setNoticeTitle(title);
		
		n.setNoticeContent(content);
		
		 n.setMemberNo(memberNo);
		
		int result = new NoticeService().insertNotice(n);
		
		
		if(result>0) { 
			session.setAttribute("alertMsg", "공지 작성 완료");
			response.sendRedirect(request.getContextPath()+"/list.no");
		}else {
			
			request.setAttribute("errorMsg", "공지 작성 실패");
		
	
	}

}

}