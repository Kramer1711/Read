package com.kramer.entity;

import sun.print.resources.serviceui;

public class User {
	//	域名
	public static final String TABLE_NAME="user";
	public static final String USERNAME="username";
	public static final String PASSWORD="password";
	public static final String NAME="name";
	public static final String SEX="sex";
	public static final String EMAIL="email";
	
	//	属性
	private String username;
	private String password;
	private String name;
	private String sex;
	private String email;
	
	public User(){}
	
	public User(String username, String password, String name, String sex) {
		super();
		this.username = username;
		this.password = password;
		this.name = name;
		this.sex = sex;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", name=" + name + ", sex=" + sex + ", email="
				+ email + "]";
	}
	
	
	
}
