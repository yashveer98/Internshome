package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.CommonDao;
import com.project.models.Bank;
import com.project.models.Contact;
import com.project.models.Course;
import com.project.models.Feedback;
import com.project.models.Job;
import com.project.models.Notice;
import com.project.models.Provider;

@Service
public class CommonService {
	@Autowired
	CommonDao dao;
	
	public void addContact(Contact contact) {
		dao.insertContact(contact);
	}

	public void addFeedback(Feedback feedback) {
		dao.insertFeedback(feedback);
		
	}

	public List<Provider> getProvider() {
		// TODO Auto-generated method stub
		return dao.getProvider();
	}

	public List<Course> getCourse(String username) {
		// TODO Auto-generated method stub
		return dao.getCourse(username);
	}

	public List<Job> viewJob() {
		// TODO Auto-generated method stub
		return dao.viewJob();
	}

	public List<Notice> getNotice() {
		// TODO Auto-generated method stub
		return dao.getNotice();
	}

	public Bank showBank(String username) {
		// TODO Auto-generated method stub
		return dao.showBank(username);
	}

	public List<Provider> showProvider(double lat, double lng) {
		// TODO Auto-generated method stub
		return dao.showProvider(lat,lng);
	}

	
	
}
