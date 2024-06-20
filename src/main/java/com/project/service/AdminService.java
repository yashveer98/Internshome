package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.AdminDao;
import com.project.models.Admin;
import com.project.models.Contact;
import com.project.models.Course;
import com.project.models.Feedback;
import com.project.models.Provider;
import com.project.models.Students;

@Service
public class AdminService {
	@Autowired
	AdminDao dao;
	
	
	public Admin adminLogin(String id,String pass) {
		
		Admin a= dao.doLogin(id,pass);
		return a;
	}


	public List<Contact> showContacts() {
		return  dao.showContacts();
	}


	public List<Feedback> showFeedback() {
		// TODO Auto-generated method stub
		return dao.showFeedback();
	}


	public Feedback showReview(int id) {
		// TODO Auto-generated method stub
		
		return dao.showReview(id);
	}


	public List<Provider> viewProvider() {
		// TODO Auto-generated method stub
		return dao.viewProvider();
	}


	public List<Students> viewStudents() {
		// TODO Auto-generated method stub
		return dao.viewStudents();
	}


	public List<Students> showAdmissions() {
		// TODO Auto-generated method stub
		return dao.showAdmissions();
	}


	public List<Course> showCourses() {
		// TODO Auto-generated method stub
		return dao.showCourses();
	}


	public void enrollStatus(int fid) {
		// TODO Auto-generated method stub
		dao.enrollStatus(fid);
		
	}


	public int editProfile(String name, String email, String phone, String userid) {
		// TODO Auto-generated method stub
		return dao.editPassword(name,email,phone,userid);
	}


	public int checkPass(String currpass, String username) {
		// TODO Auto-generated method stub
		return dao.checkPass(currpass, username);
	}


	public int updatePassword(String userpass, String username) {
		// TODO Auto-generated method stub
		return dao.updatePassword(userpass,username);
		
	}


	

}
