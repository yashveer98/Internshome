package com.project.models;

public class Course {
	private String username;
	private String coursename;
	private String fees;
	private String duration;
	private String contents;
	private String aboutcourse;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getFees() {
		return fees;
	}
	public void setFees(String fees) {
		this.fees = fees;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getAboutcourse() {
		return aboutcourse;
	}
	public void setAboutcourse(String aboutcourse) {
		this.aboutcourse = aboutcourse;
	}
	@Override
	public String toString() {
		return "Course [username=" + username + ", coursename=" + coursename + ", fees=" + fees + ", duration="
				+ duration + ", contents=" + contents + ", aboutcourse=" + aboutcourse + "]";
	}
	public Course(String username, String coursename, String fees, String duration, String contents,
			String aboutcourse) {
		super();
		this.username = username;
		this.coursename = coursename;
		this.fees = fees;
		this.duration = duration;
		this.contents = contents;
		this.aboutcourse = aboutcourse;
	}
	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}

}
