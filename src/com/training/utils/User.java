package com.training.utils;



public class User {
	private String userId;
	private String passWord;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public User(String userId, String passWord) {
		super();
		this.userId = userId;
		this.passWord = passWord;
	}


	public String getuserId() {
		return userId;
	}
	public String getPassWord() {
		return passWord;
	}

	
}
