package com.kh.training.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.training.model.service.TrainingService;
import com.kh.training.model.vo.Reply;

/**
 * Servlet implementation class DeleteReplyController
 */
@WebServlet("/dreply.tr")
public class DeleteReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = request.getParameter("replyWriter");
		String content = request.getParameter("replyContent");
		String date = request.getParameter("replyDate");
		Reply r = new Reply();
		r.setreplyWriter(writer);
		r.setreplyContent(content);
		r.setCreateDate(date);
		int result = new TrainingService().deleteReply(r);
		response.getWriter().print(result);
	}

}
