package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.ProviderDao;
import com.project.models.Course;
import com.project.models.Job;
import com.project.models.Notice;
import com.project.models.Provider;

@Service
public class ProviderService {
	@Autowired
	ProviderDao dao;

	public Provider providerLogin(String username, String userpass) {
		Provider p= dao.doLogin(username,userpass);
		return p;
	}

	public void register(Provider provider) {
		dao.doRegistration(provider);
	}


	public void updateProfile(String address,String email, String phone,String username) {
		// TODO Auto-generated method stub
		dao.updateProfile(address,email,phone,username);
		
	}

	public Provider viewProfile(String username) {
		// TODO Auto-generated method stub
		
		return dao.viewProfile(username);
	}
	public void updatePassword(String userpass, String username) {
		// TODO Auto-generated method stub
		dao.updatePassword(userpass,username);
		
	}

	public void addCourse( Course course) {
		// TODO Auto-generated method stub
		dao.addCourse(course);
	}

	public List<Course> showCourse() {
		// TODO Auto-generated method stub
		
		return dao.showCourse();
	}

	public int addJob(Job job) {
		// TODO Auto-generated method stub
		return dao.addJob(job);
		
	}

	public int addNotice(Notice notice) {
		// TODO Auto-generated method stub
		return dao.addNotice(notice);
		
	}

	public int checkPass(String currpass, String username) {
		return dao.checkPass(currpass,username);
		// TODO Auto-generated method stub
		
	}

	
}
