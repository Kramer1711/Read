package com.kramer.entity;

import java.util.Date;

public class ReadRecord {
	public static final String TABLE_NAME = "readrecord";
	public static final String ID = "id";
	public static final String USER_ID = "user_id" ;
	public static final String BOOK_ID = "book_id";
	public static final String CHPATER_ID = "chapter_id";
	public static final String TIME = "time";

	private String id;
	private User user;
	private EBook book;
	private Chapter chapter;
	private Date time;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public EBook getBook() {
		return book;
	}
	public void setBook(EBook book) {
		this.book = book;
	}
	public Chapter getChapter() {
		return chapter;
	}
	public void setChapter(Chapter chapter) {
		this.chapter = chapter;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "ReadRecord [id=" + id + ", user=" + user + ", book=" + book + ", chapter=" + chapter + ", time=" + time
				+ "]";
	}
}
