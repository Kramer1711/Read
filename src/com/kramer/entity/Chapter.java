package com.kramer.entity;

import java.sql.Date;

public class Chapter {
	
	public static String TABLE_NAME = "chapter";
	public static String ID = "id";
	public static String BOOK_ID = "book_id";
	public static String SERIAL_NUMBER = "serial_number";
	public static String CHAPTER = "chapter";
	public static String CONTENT = "content";
	public static String UP_LOAD_TIME = "upLoadTime";
	public static String REMARK = "remark";

	private String id;
	private EBook book;
	private int serialNumber;
	private String chapter;
	private String content;
	private Date upLoadTime;
	private String remark;
	
	public Chapter() {};
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public EBook getBook() {
		return book;
	}
	public void setBook(EBook book) {
		this.book = book;
	}
	public int getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(int serialNumber) {
		this.serialNumber = serialNumber;
	}
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getUpLoadTime() {
		return upLoadTime;
	}
	public void setUpLoadTime(Date upLoadTime) {
		this.upLoadTime = upLoadTime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Chapter [id=" + id + ", book=" + book + ", serialNumber=" + serialNumber + ", chapter=" + chapter
				+ ", content=" + content + ", upLoadTime=" + upLoadTime + ", remark=" + remark + "]";
	}
	
}
