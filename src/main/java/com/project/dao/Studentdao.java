package com.project.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.project.models.Bank;
import com.project.models.Students;

@Repository
public class Studentdao {
	@Autowired
	JdbcTemplate template;

	public void enroll(Students student) {
		// TODO Auto-generated method stub
		String insert= "insert into student(coursename, name, email, phone, city, college, address, degree, providername,date,transactionid,enrollstatus) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		int status=template.update(insert,new Object[] {student.getCourseid(),student.getName(),student.getEmail(),student.getPhone(),student.getCity(),student.getCollege(),student.getAddress(),student.getDegree(),student.getProviderusername(),student.getDate(),student.getTransactionid(),student.getEnrollStatus()});
		System.out.println(status);
	}

	public void payment(Bank bank) {
		// TODO Auto-generated method stub
		String insert ="insert into bank(accountid,ifsccode,bankname,branchname,providerusername) values(?,?,?,?,?)";
		template.update(insert,new Object[] {bank.getAccountid(),bank.getIfsccode(),bank.getBankname(),bank.getBranchname(),bank.getProviderusername()});
		
	}

}
