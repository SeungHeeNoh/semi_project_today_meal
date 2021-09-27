package productInfo.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import productInfo.model.dao.ProductDao;
import productInfo.model.vo.Product;

public class ProductService {
	private ProductDao pd = new ProductDao();

	// 상품 상세 조회
	public Product selectProduct() {
		Connection conn = getConnection();
		
		productInfo.model.vo.Product p = pd.selectProduct(conn);
		
		// 해당 상품페이지에 대한 리뷰 리스트 조회 추가
		 p.setReviewList(pd.selectReviewList(conn));
		
		close(conn);
		
		return p;
	}
	
	// 로그인한 사용자의 상품 상세 조회
		public Product selectMyProduct() {
			Connection conn = getConnection();
			
			Product p = pd.selectProduct(conn);
			
			// 해당 사용자 마이페이지에 대한 리뷰 리스트 조회 추가
			 p.setReviewList(pd.selectMyReviewList(conn));
			
			close(conn);
			
			return p;
		}

		// 상품상세 페이지에서 리뷰 별점순 정렬
		public productInfo.model.vo.Product selectReviewPoint() {
			Connection conn = getConnection();
			
			Product p1 = pd.selectProduct(conn);
			
			// 해당 상품페이지에 대한 리뷰 리스트 조회 추가
			 p1.setReviewList(pd.selectReviewPoint(conn));
			
			close(conn);
			
			return p1;
		}

		// 마이페이지 리뷰 상품명 내림차순 정렬
		public Product selectMyReviewDescSort() {
			Connection conn = getConnection();
			
			Product p = pd.selectProduct(conn);
			
			// 해당 상품페이지에 대한 리뷰 리스트 조회 추가
			 p.setReviewList(pd.selectReviewNameDesc(conn));
			
			close(conn);
			
			return p;
		}

		

		
	
	

}
