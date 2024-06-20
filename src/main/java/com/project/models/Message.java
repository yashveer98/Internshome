package com.project.models;

import java.util.Date;

public class Message {
	private int msgid;
	private String subject;
	private String senderid;
	private String recieverid;
	private String content;
	private String rstatus;
	private String sstatus;
	private Date date;
	public int getMsgid() {
		return msgid;
	}
	public void setMsgid(int msgid) {
		this.msgid = msgid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSenderid() {
		return senderid;
	}
	public void setSenderid(String senderid) {
		this.senderid = senderid;
	}
	public String getRecieverid() {
		return recieverid;
	}
	public void setRecieverid(String recieverid) {
		this.recieverid = recieverid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRstatus() {
		return rstatus;
	}
	public void setRstatus(String rstatus) {
		this.rstatus = rstatus;
	}
	public String getSstatus() {
		return sstatus;
	}
	public void setSstatus(String sstatus) {
		this.sstatus = sstatus;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Message(int msgid, String subject, String senderid, String recieverid, String content, String rstatus,
			String sstatus, Date date) {
		super();
		this.msgid = msgid;
		this.subject = subject;
		this.senderid = senderid;
		this.recieverid = recieverid;
		this.content = content;
		this.rstatus = rstatus;
		this.sstatus = sstatus;
		this.date = date;
	}
	 

}
