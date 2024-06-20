package com.project.models;

import java.sql.Date;

public class Students {
	private Date date;
	private int formid;
	private String courseid;
	private String name;
	private String email;
	private String phone;
	private String city;
	private String college;
	private String address;
	private String degree;
	private String providerusername;
	private String transactionid;
	private String enrollStatus;
	public String getTransactionid() {
		return transactionid;
	}
	public void setTransactionid(String transactionid) {
		this.transactionid = transactionid;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getFormid() {
		return formid;
	}
	public void setFormid(int formid) {
		this.formid = formid;
	}
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getProviderusername() {
		return providerusername;
	}
	public void setProviderusername(String providerusername) {
		this.providerusername = providerusername;
	}
	
	
	
	public String getEnrollStatus() {
		return enrollStatus;
	}
	public void setEnrollStatus(String enrollStatus) {
		this.enrollStatus = enrollStatus;
	}
	public Students(Date date, int formid, String courseid, String name, String email, String phone, String city,
			String college, String address, String degree, String providerusername, String transactionid ,String enrollStatus  ) {
		super();
		this.date = date;
		this.formid = formid;
		this.courseid = courseid;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.city = city;
		this.college = college;
		this.address = address;
		this.degree = degree;
		this.providerusername = providerusername;
		this.transactionid = transactionid;
		this.enrollStatus = enrollStatus;
	}
	public Students() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}