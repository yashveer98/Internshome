package com.project.models;

public class Feedback {
	private int id;
	private String name;
	private String email;
	private String phone;
	private String feedback;
	private String rating;
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
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public String getRating() {
		return rating;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Feedback [name=" + name + ", email=" + email + ", phone=" + phone + ", feedback=" + feedback
				+ ", rating=" + rating + "]";
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Feedback(int id, String name, String email, String phone, String feedback, String rating) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.feedback = feedback;
		this.rating = rating;
	}
	public Feedback(String name, String email, String phone, String feedback, String rating) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.feedback = feedback;
		this.rating = rating;
	}

}
