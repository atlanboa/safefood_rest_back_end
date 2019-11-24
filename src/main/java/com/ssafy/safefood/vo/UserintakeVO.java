package com.ssafy.safefood.vo;

public class UserintakeVO {
	
	private int no;
	private String id;
	private int code;
	private String img;
	private int count;
	private double carlories;
	private String time;
	public UserintakeVO(int no, String id, int code, String img, int count, double carlories, String time) {
		super();
		this.no = no;
		this.id = id;
		this.code = code;
		this.img = img;
		this.count = count;
		this.carlories = carlories;
		this.time = time;
	}
	
	public UserintakeVO() {
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public double getCarlories() {
		return carlories;
	}

	public void setCarlories(double carlories) {
		this.carlories = carlories;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "UserintakeVO [no=" + no + ", id=" + id + ", code=" + code + ", img=" + img + ", count=" + count
				+ ", carlories=" + carlories + ", time=" + time + "]";
	}	
	
	
	
	

}
