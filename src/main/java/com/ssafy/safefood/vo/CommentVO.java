package com.ssafy.safefood.vo;

public class CommentVO {
	private int no;
	private String content;
	public CommentVO(int no, String content) {
		super();
		this.no = no;
		this.content = content;
	}
	public CommentVO() {	}
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
		return "CommentVO [no=" + no + ", content=" + content + "]";
	}
	
	
}
