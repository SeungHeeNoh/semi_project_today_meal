package subpage.model.vo;

import java.sql.Date;

public class Product {
	private int pno;
	private String pname;
	private String representationImage;
	private int price;
	private String detailImgPath;
	private Date createDate;
	private int cno;
	private String status;
	private String soldOutStatus;
	
	public Product() {}
	
	public Product(int pno, String pname, String representationImage, int price, String detailImgPath, Date createDate, int cno, String status) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.representationImage = representationImage;
		this.price = price;
		this.detailImgPath = detailImgPath;
		this.createDate = createDate;
		this.cno = cno;
		this.status = status;
	}
	
	public Product(int pno, String pname, String representationImage, int price, Date createDate, String soldOutStatus) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.representationImage = representationImage;
		this.price = price;
		this.createDate = createDate;
		this.soldOutStatus = soldOutStatus;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getRepresentationImage() {
		return representationImage;
	}

	public void setRepresentationImage(String representationImage) {
		this.representationImage = representationImage;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDetailImgPath() {
		return detailImgPath;
	}

	public void setDetailImgPath(String detailImgPath) {
		this.detailImgPath = detailImgPath;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSoldOutStatus() {
		return soldOutStatus;
	}

	public void setSoldOutStatus(String soldOutStatus) {
		this.soldOutStatus = soldOutStatus;
	}

	@Override
	public String toString() {
		return "Product [pno=" + pno + ", pname=" + pname + ", representationImage=" + representationImage + ", price="
				+ price + ", detailImgPath=" + detailImgPath + ", createDate=" + createDate + ", cno=" + cno
				+ ", status=" + status + ", soldOutStatus=" + soldOutStatus + "]";
	}

	
}
