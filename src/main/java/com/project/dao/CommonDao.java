package com.project.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.project.mapper.CourseMapper;
import com.project.mapper.JobMapper;
import com.project.mapper.NoticeMapper;
import com.project.mapper.ProviderMapper;
import com.project.mapper.SearchMapper;
import com.project.models.Bank;
import com.project.models.Contact;
import com.project.models.Course;
import com.project.models.Feedback;
import com.project.models.Job;
import com.project.models.Notice;
import com.project.models.Provider;

@Repository
public class CommonDao
{
	Bank b;
	@Autowired
	JdbcTemplate template;	
public void insertContact(Contact contact) {
		
		String strinsert="insert into contacts(name, email, phone, message) values(?,?,?,?)";
		int status = template.update(strinsert, new Object[] {contact.getName(),contact.getEmail(),contact.getPhone(),contact.getMessage()});
		System.out.println(status + "row inserted");
	}
public void insertFeedback(Feedback feedback) {
	String strinsert="insert into feedback(name, email,phone,feedback,rating) values(?,?,?,?,?)";
	int status = template.update(strinsert, new Object[] {feedback.getName(),feedback.getEmail(),feedback.getPhone(),feedback.getFeedback(),feedback.getRating()});
	System.out.println(status +"row Inserted");
	
}
public List<Provider> getProvider() {
	// TODO Auto-generated method stub
	
	String select= "select * from provider_details";
	List<Provider>providerList = template.query(select,new ProviderMapper());
	
	return providerList;
}
public List<Course> getCourse(String username) {
	// TODO Auto-generated method stub
	String select= "select * from course where username =?";
	List<Course>courseList= template.query(select, new CourseMapper(),new Object[] {username});
	return courseList;
}
public List<Job> viewJob() {
	// TODO Auto-generated method stub
	String select = "select * from Job";
	List<Job> jobList= template.query(select, new JobMapper());
	return jobList;
}
public List<Notice> getNotice() {
	// TODO Auto-generated method stub
	String select="select * from notice";
	List<Notice>ntc=template.query(select, new NoticeMapper());
	return ntc;
}
public Bank showBank(String username) {
	// TODO Auto-generated method stub
	String selectb="select * from bank where providerusername = ?";
	b= new Bank();
	template.queryForObject(selectb,new RowMapper<Bank>() {

		@Override
		public Bank mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			String accid = rs.getString("accountid");
			String ifsc = rs.getString("ifsccode");
			String bankname = rs.getString("bankname");
			String branch = rs.getString("branchname");
			b.setAccountid(accid);
			b.setIfsccode(ifsc);
			b.setBankname(bankname);
			b.setBranchname(branch);
			
			return b;
		}
		
	}, new Object[] {username});
	return b;
}
public List<Provider> showProvider(double lat, double lng) {
	// TODO Auto-generated method stub
	String strsql="select cmpname,username,email,phone,lattitude,longitude,111.111*DEGREES(ACOS(LEAST(1.0, COS(RADIANS(?))* COS(RADIANS(lattitude))* COS(RADIANS(?- longitude))+SIN(RADIANS(?))* SIN(RADIANS(lattitude))))) AS distance_in_km  FROM  provider_details  HAVING distance_in_km <=20.0  ORDER BY distance_in_km DESC";	
	List<Provider>ownerlist=template.query(strsql, new SearchMapper(), new Object[] {lat,lng,lat});
		return ownerlist;
}

}
