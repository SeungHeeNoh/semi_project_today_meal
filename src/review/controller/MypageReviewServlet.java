package review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import productInfo.model.service.ProductService;
import productInfo.model.vo.Product;
import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class MypageReviewServlet
 */
@WebServlet("/mypage/review")
public class MypageReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 매개변수로 로그인한 사용자 아이디 보내기
		//List<Review> reviewList = new ReviewService().selectMyReviewList();
		Product product = new ProductService().selectMyProduct();
		
		request.setAttribute("product", product);
		//System.out.println(product);
		request.getRequestDispatcher("/WEB-INF/views/review_management/review_management.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}