package com.kh.training.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.training.model.service.TrainingService;
import com.kh.training.model.vo.Attachment;
import com.kh.training.model.vo.Training;
import com.kh.training.model.vo.TrainingCategory;

/**
 * Servlet implementation class TrainingUpdateController
 */
@WebServlet("/update.tr")
public class TrainingUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainingUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tno = Integer.parseInt(request.getParameter("tno"));
		
		TrainingService ts = new TrainingService();
		
		Training t = ts.selectTraining(tno);
		
		ArrayList<TrainingCategory> tCList = ts.selectCategoryList();
		
		Attachment at = ts.selectAttachment(tno);
		
		request.setAttribute("training",t);
		request.setAttribute("tCList",tCList);
		request.setAttribute("attachment",at);
		
		request.getRequestDispatcher("views/training/trainingUpdateView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
