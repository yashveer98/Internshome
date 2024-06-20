package com.project.models;

import java.util.Date;

public class Provider {

	private Date date;
	private double lattitude,longitude;
	private String username;
	private String password;
	private String email;
	private String cmpname;
	private String phone;
	private String city;
	private String address;
	private String aboutcmp;
	
	public Date getDate() {
		return date;
	}

	@Override
	public String toString() {
		return "Provider [date=" + date + ", lattitude=" + lattitude + ", longitude=" + longitude + ", username="
				+ username + ", password=" + password + ", email=" + email + ", cmpname=" + cmpname + ", phone=" + phone
				+ ", city=" + city + ", address=" + address + ", aboutcmp=" + aboutcmp + "]";
	}
	public Provider() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Provider(Date date, double lattitude, double longitude, String username, String password, String email,
			String cmpname, String phone, String city, String address, String aboutcmp) {
		super();
		this.date = date;
		this.lattitude = lattitude;
		this.longitude = longitude;
		this.username = username;
		this.password = password;
		this.email = email;
		this.cmpname = cmpname;
		this.phone = phone;
		this.city = city;
		this.address = address;
		this.aboutcmp = aboutcmp;
	}
	
	public Provider(String username,String email, String cmpname, String phone, String city,
			String address, String aboutcmp) {
		super();
		this.username = username;
		this.email = email;
		this.cmpname = cmpname;
		this.phone = phone;
		this.city = city;
		this.address = address;
		this.aboutcmp = aboutcmp;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	public double getLattitude() {
		return lattitude;
	}
	public void setLattitude(double lattitude) {
		this.lattitude = lattitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCmpname() {
		return cmpname;
	}
	public void setCmpname(String cmpname) {
		this.cmpname = cmpname;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAboutcmp() {
		return aboutcmp;
	}
	public void setAboutcmp(String aboutcmp) {
		this.aboutcmp = aboutcmp;
	}

}
