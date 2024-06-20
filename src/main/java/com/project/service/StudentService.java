package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.Studentdao;
import com.project.models.Bank;
import com.project.models.Students;

@Service
public class StudentService {
	@Autowired
	Studentdao dao;

	public void enroll(Students student) {
		// TODO Auto-generated method stub
		dao.enroll(student);
	}

	public void payment(Bank bank) {
		// TODO Auto-generated method stub
		dao.payment(bank);
	}

}
