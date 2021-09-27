package event.model.vo;

public class Event {
	private int eno;
	private String event_title;
	private String content;
	private String term;
	private int count;
	private String userId;
	private String status;
	/*
	 * evnet_no	number		NOT NULL,
	evnet_title	varchar2(50)		NOT NULL,
	content	varchar2(1500)		NOT NULL,
	term	varchar2(30)		NOT NULL,
	count	number	DEFAULT 0	NOT NULL,
	user_id	varchar2(12)		NOT NULL,
	status	varchar2(1)	DEFAULT 'Y'	NOT NULL
	 * */
	
	public Event() {}
	
	
	
	public Event(int eno, String event_title, String term, String content) {
		super();
		this.eno = eno;
		this.event_title = event_title;
		this.content = content;
		this.term = term;
	}



	public Event(String event_title, String content, String term) {
		super();
		this.event_title = event_title;
		this.content = content;
		this.term = term;
	}



	public Event(int eno, String event_title, String content, String term, int count, String userId,
			String status) {
		super();
		this.eno = eno;
		this.event_title = event_title;
		this.content = content;
		this.term = term;
		this.count = count;
		this.userId = userId;
		this.status = status;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Event [eventNo=" + eno + ", event_title=" + event_title + ", content=" + content + ", term=" + term
				+ ", count=" + count + ", userId=" + userId + ", status=" + status + "]";
	}

	
}