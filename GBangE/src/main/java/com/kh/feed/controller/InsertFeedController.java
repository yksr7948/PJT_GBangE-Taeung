package com.kh.feed.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.feed.model.service.FeedService;
import com.kh.feed.model.vo.Feed;

/**
 * Servlet implementation class InsertFeedController
 */
@WebServlet("/insert.fe")
public class InsertFeedController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFeedController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("views/feed/feedInsertView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String memberId = request.getParameter("memberId");
		HttpSession session = request.getSession();
		Feed f = new Feed();
		f.setFeedTitle(title);
		f.setMemberNo(memberId);
		f.setFeedContent(content);
		
		int result = new FeedService().insertFeed(f);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 작성 완료");
			response.sendRedirect(request.getContextPath()+"list.fe");
		}else {
			request.setAttribute("errorMsg", "게시글 작성 실패");
		}
	}

}
