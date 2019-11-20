package com.ssafy.safefood.vo;

public class QnaVO {
	private int no;
	private String title;
	private String content;
	private String writer;
	private int hit;
	private String time;
	
	public QnaVO() {
		// TODO Auto-generated constructor stub
	}

	public QnaVO(int no, String title, String content, String writer, int hit, String time) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.hit = hit;
		this.time = time;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "NoticeVO [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer + ", hit="
				+ hit + ", time=" + time + "]";
	}
	
	

}
