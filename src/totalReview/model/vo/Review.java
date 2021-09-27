package totalReview.model.vo;

import java.sql.Date;

public class Review {
	private int rno;
	private int ono;
	private float point;
	private String reviewText;
	private String reviewImagePath;
	private Date registerDate;
	private String uid;
	private int sum;
	private Product product;
	private boolean status;
	
	public Review() {}

	public Review(int rno, int ono, float point, String reviewText, String reviewImagePath, Date registerDate,
			String uid, int sum, Product product) {
		super();
		this.rno = rno;
		this.ono = ono;
		this.point = point;
		this.reviewText = reviewText;
		this.reviewImagePath = reviewImagePath;
		this.registerDate = registerDate;
		this.uid = uid;
		this.sum = sum;
		this.product = product;
	}
	
	public Review(int rno, float point, String reviewImagePath, int sum, Product product) {
		super();
		this.rno = rno;
		this.point = point;
		this.reviewImagePath = reviewImagePath;
		this.sum = sum;
		this.product = product;
	}
	
	public Review(int rno, float point, String reviewText, String reviewImagePath, Date registerDate, String uid,
			int sum, Product product) {
		super();
		this.rno = rno;
		this.point = point;
		this.reviewText = reviewText;
		this.reviewImagePath = reviewImagePath;
		this.registerDate = registerDate;
		this.uid = uid;
		this.sum = sum;
		this.product = product;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public float getPoint() {
		return point;
	}

	public void setPoint(float point) {
		this.point = point;
	}

	public String getReviewText() {
		return reviewText;
	}

	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

	public String getReviewImagePath() {
		return reviewImagePath;
	}

	public void setReviewImagePath(String reviewImagePath) {
		this.reviewImagePath = reviewImagePath;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Review [rno=" + rno + ", ono=" + ono + ", point=" + point + ", reviewText=" + reviewText
				+ ", reviewImagePath=" + reviewImagePath + ", registerDate=" + registerDate + ", uid=" + uid + ", sum="
				+ sum + ", product=" + product + ", status=" + status + "]";
	}
	
}