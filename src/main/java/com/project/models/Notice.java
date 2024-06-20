package com.project.models;

import java.util.Date;

public class Notice {
	private int noticeid;
	private String content;
	private Date date;
	private String username;
	public int getNoticeid() {
		return noticeid;
	}
	public void setNoticeid(int noticeid) {
		this.noticeid = noticeid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(int noticeid, String content, Date date, String username) {
		super();
		this.noticeid = noticeid;
		this.content = content;
		this.date = date;
		this.username = username;
	}

}
