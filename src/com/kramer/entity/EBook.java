package com.kramer.entity;

import java.util.Date;

public class EBook {
	// 字段
	public static String TABLE_NAME = "book";
	public static String ID = "id";
	public static String NAME = "name";
	public static String TYPE_ID = "type_id";
	public static String AUTHOR = "author";
	public static String CHAPTER_NUMBER="chapter_number";
	public static String CHAR_NUMBER="char_number";
	public static String COVER_PATH="cover_path";
	public static String RESUME = "resume";
	public static String UP_LOAD_TIME = "upLoadTime";
	public static String REMARK = "remark";

	// 属性
	private String id;
	private String name;
	private Type type;
	private String author;
	private int chapterNumber;
	private int charNumber;
	private String coverPath;
	private String resume;
	private Date upLoadTime;
	private String remark;
	
	
	
	public EBook(){}

	public EBook(String id, String name, Type type, String author, String resume, Date upLoadTime, String remark) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.author = author;
		this.resume = resume;
		this.upLoadTime = upLoadTime;
		this.remark = remark;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public Type getType() {
		return type;
	}


	public void setType(Type type) {
		this.type = type;
	}


	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
	public int getChapterNumber() {
		return chapterNumber;
	}

	public void setChapterNumber(int chapterNumber) {
		this.chapterNumber = chapterNumber;
	}

	public int getCharNumber() {
		return charNumber;
	}

	public void setCharNumber(int charNumber) {
		this.charNumber = charNumber;
	}
	
	public String getCoverPath() {
		return coverPath;
	}

	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
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
		return "EBook [id=" + id + ", name=" + name + ", type=" + type + ", author=" + author + ", chapterNumber="
				+ chapterNumber + ", charNumber=" + charNumber + ", resume=" + resume + ", upLoadTime=" + upLoadTime
				+ ", remark=" + remark + "]";
	}



}
