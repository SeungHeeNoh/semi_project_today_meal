package totalReview.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import static common.JDBCTemplate.*;

import totalReview.model.vo.Option;
import totalReview.model.vo.Product;
import totalReview.model.vo.Review;

public class TotalReviewDao {
	private Properties query = new Properties();

	public TotalReviewDao() {
		String fileName = TotalReviewDao.class.getResource("/sql/totalReview/review-query.xml").getPath();
		
		try {
			query.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getListCount(Connection conn, List<Integer> categoryList) {
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rset = null;
		int result = 0;
		
		try {
			if(categoryList.size() > 0) {
				sql = query.getProperty("categoryListTotalCount");
				StringBuilder sb = new StringBuilder(" WHERE CATEGORY_NO IN (");

				for(int i=0; i<categoryList.size(); i++) {
					if(i != 0) {
						sb.append(",");
					}
					sb.append(categoryList.get(i));
				}
				sb.append(")");
				sql += sb.toString();
			} else {
				sql = query.getProperty("listCount");
			}
			pstmt = conn.prepareStatement(sql);	
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public List<Review> selectList(Connection conn, int page, List<Integer> categoryList) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Review> reviewList = new ArrayList<>();
		String sql = "";
		
		try {
			if(categoryList.size() > 0) {
				sql = query.getProperty("selectCategoryList");
				StringBuilder sb = new StringBuilder();

				for(int i=0; i<categoryList.size(); i++) {
					if(i != 0) {
						sb.append(",");
					}
					sb.append(categoryList.get(i));
				}

				sql = sql.replace("CATEGORY_NO_ARRAY", sb.toString());
			} else {
				sql = query.getProperty("selectList");
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (page-1)*9+1);
			pstmt.setInt(2, page*9);
			
			rset = pstmt.executeQuery();
			
			int prevReviewNo = 0;
			Product p = null;
			Review r = null;
			List<Option> optionList = null;
			boolean status = true;
			while(rset.next()) {
				int reviewNo = rset.getInt("REVIEW_NO");

				if(prevReviewNo != reviewNo) {
					prevReviewNo = reviewNo;

					if(r != null) {
						r.getProduct().setOptionList(optionList);
						r.setStatus(status);
						reviewList.add(r);
						status = true;
					}

					p = new Product(rset.getString("PRODUCT_NAME")
								  , rset.getString("PRODUCT_IMG")
								  , rset.getInt("PRODUCT_BUY_QUANTITY")
								  );
		
					r = new Review(reviewNo
							, rset.getFloat("POINT")
							, rset.getString("REVIEW_IMAGE")
							, rset.getInt("ORDER_SUM")
							, p
							);

					optionList = new ArrayList<>();
					if(p.getBuyQuantity() > rset.getInt("PRODUCT_INVENTORY_QUANTITY")) {
						status = false;
					}
				}
				
				Option o = new Option(rset.getString("OPTION_NAME")
									, rset.getInt("OPTION_BUY_QUANTITY")
						   			);
				
				if(o.getName() != null) {
					optionList.add(o);
					
					if(o.getBuyQuantity() > rset.getInt("OPTION_INVENTORY_QUANTITY")) {
						status = false;
					}
				}
			}

			if(r != null) {
				r.getProduct().setOptionList(optionList);
				r.setStatus(status);
				reviewList.add(r);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return reviewList;
	}

	public Review selectReview(Connection conn, int rno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = query.getProperty("selectReview");
		Review review = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			rset = pstmt.executeQuery();
			
			List<Option> optionList = null;
			boolean status = true;
			while(rset.next()) {
				if(review == null) {
					Product p = new Product(rset.getString("PRODUCT_NAME")
										  , rset.getString("PRODUCT_IMG")
										  , rset.getInt("PRODUCT_BUY_QUANTITY")
										  );

					review = new Review(rset.getInt("REVIEW_NO")
									  , rset.getFloat("POINT")
									  , rset.getString("REVIEW_TEXT")
									  , rset.getString("REVIEW_IMAGE")
									  , rset.getDate("REVIEW_REGISTER")
									  , rset.getString("USER_ID")
									  , rset.getInt("ORDER_SUM")
									  , p
									  );
					
					optionList = new ArrayList<>();

					if(p.getBuyQuantity() > rset.getInt("PRODUCT_INVENTORY_QUANTITY")) {
						status = false;
					}
				}
			
				Option o = new Option(rset.getString("OPTION_NAME")
									, rset.getInt("OPTION_BUY_QUANTITY")
									);
				
				if(o.getName() != null) {
					optionList.add(o);
					if(o.getBuyQuantity() > rset.getInt("OPTION_INVENTORY_QUANTITY")) {
						status = false;
					}
				}
			}
			review.getProduct().setOptionList(optionList);
			review.setStatus(status);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
			close(pstmt);
		}

		return review;
	}

	public Map<Integer, Integer> getCategoryListCount(Connection conn, List<Integer> categoryNumberList) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Map<Integer, Integer> result = new HashMap<>();
		String sql = query.getProperty("categoryListCount");
		
		for(int i : categoryNumberList) {
			result.put(i, 0);
		}
		
		try {
			StringBuilder sb = new StringBuilder();

			for(int i=0; i<categoryNumberList.size(); i++) {
				if(i != 0) {
					sb.append(",");
				}
				sb.append(categoryNumberList.get(i));
			}

			sql = sql.replace("CATEGORY_NO_ARRAY", sb.toString());

			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				result.put(rset.getInt(1), rset.getInt(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
}
