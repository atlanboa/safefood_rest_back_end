package com.ssafy.safefood.vo;

public class CommentVO {
	private int cno;
	private int no;
	private String content;
	public CommentVO(int cno, int no, String content) {
		super();
		this.cno = cno;
		this.no = no;
		this.content = content;
	}
	
	public CommentVO() {	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "CommentVO [cno=" + cno + ", no=" + no + ", content=" + content + "]";
	}

	
}
