package com.kramer.entity;

public class Type {
	public static final String TABLE_NAME = "type";
	public static final String ID = "id";
	public static final String TYPE = "type";
	public static final String REMARK = "remark";
	
	private String id;
	private String type;
	private String remark;
	
	public Type() {};
	
	public Type(String id, String type) {
		this.id = id;
		this.type = type;
	}

	public Type(String id, String type, String remark) {
		this.id = id;
		this.type = type;
		this.remark = remark;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Type [id=" + id + ", type=" + type + ", remark=" + remark + "]";
	}
	
	
}
