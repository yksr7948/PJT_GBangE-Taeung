package com.kh.training.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kh.training.model.service.TrainingService;
import com.kh.training.model.vo.Training;
import com.kh.training.model.vo.TrainingCategory;

/**
 * Servlet implementation class InsertTrainingController
 */
@WebServlet("/insert.tr")
public class TrainingInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainingInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//훈련종류 리스트 DB에서 가져오는 메서드
		ArrayList<TrainingCategory> tCList = new TrainingService().selectCategoryList();
		
		request.setAttribute("tCList", tCList);
		
		request.getRequestDispatcher("views/training/trainingInsertView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String trainingTitle = request.getParameter("trainingTitle");
		int trainingKey = Integer.parseInt(request.getParameter("category"));
		String trainingDate = request.getParameter("trainingDate");
		//		String shoes = request.getParameter("shoes"); 러닝화 기능 구현되면 가져올 것
		String trainingPlace = request.getParameter("trainingPlace");
		double trainingDistance = Double.parseDouble(request.getParameter("trainingDistance"));
		double trainingTime = Double.parseDouble(request.getParameter("trainingTime"));
		String trainingGoal = request.getParameter("trainingGoal");
		double weight = Double.parseDouble(request.getParameter("weight"));
		String trainingContent = request.getParameter("trainingContent");
		boolean open = request.getParameter("secret") != null;
		System.out.println(open);
		Training t = new Training();
		t.setTrainingTitle(trainingTitle);
		t.setTrainingKey(trainingKey);
		t.setTrainingDate(trainingDate);
		t.setTrainingPlace(trainingPlace);
		t.setTrainingDistance(trainingDistance);
		t.setTrainingTime(trainingTime);
		t.setTrainingGoal(trainingGoal);
		t.setWeight(weight);
		t.setTrainingContent(trainingContent);
		
		HttpSession session = request.getSession();
		
		int result = new TrainingService().insertTraining(t);
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 작성 성공");
			request.getRequestDispatcher("views/training/trainingDetailView.jsp").forward(request, response);
		}else {
			session.setAttribute("alertMsg", "게시글 작성 실패");
			response.sendRedirect(request.getContextPath());
		}
//		System.out.println(trainingTitle);
//		System.out.println(category);
//		System.out.println(trainingPlace);
//		System.out.println(trainingDistance);
//		System.out.println(trainingTime);
//		System.out.println(trainingGoal);
//		System.out.println(weight);
//		System.out.println(trainingContent); 값 제대로 받아지는지 확인
		if(ServletFileUpload.isMultipartContent(request)) {}
	}

}
