package com.project.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.project.mapper.ContactMapper;
import com.project.mapper.CourseMapper;
import com.project.mapper.FeedbackMapper;
import com.project.mapper.ProviderMapper;
import com.project.mapper.StudentMapper;
import com.project.models.Admin;
import com.project.models.Contact;
import com.project.models.Course;
import com.project.models.Feedback;
import com.project.models.Provider;
import com.project.models.Students;
@Repository
public class AdminDao {
	Admin a;
	@Autowired
	JdbcTemplate template;
	
	public Admin doLogin(String id, String pass) {
		String strsql="select * from admin_details where userid=? and userpass=?";
		try {
			a=new Admin();
		template.queryForObject(strsql, new RowMapper<Admin>() {

			@Override
			public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				String name=rs.getString("name");
				String email=rs.getString("email");
				String userid= rs.getString("userid");
				String userpass= rs.getString("userpass");
				String phone= rs.getString("phone");
				
				a.setEmail(email);
				a.setName(name);
				a.setPhone(phone);
				a.setUserid(userid);
				a.setUserpass(userpass);
				
						
				return a;
			}
			
		}  ,
				
				
				new Object[] {id,pass});
		
		}catch (EmptyResultDataAccessException e) {
		
			return null;
		}
		return a;
	}

	public List<Contact> showContacts() {
		String strsql="select * from contacts";
		List<Contact> contactList=template.query(strsql,new ContactMapper());
		return contactList;
	}

	public List<Feedback> showFeedback() {
		// TODO Auto-generated method stub
		String strsql="select * from feedback";
		List<Feedback> feedbackList=template.query(strsql, new FeedbackMapper());
		return feedbackList;
	}

	public Feedback showReview(int id) {
		// TODO Auto-generated method stub
		String strselect = "select * from feedback where id=?";
		Feedback f= template.queryForObject(strselect,new FeedbackMapper(), new Object[] {id});
		return f;
	}

	public List<Provider> viewProvider() {
		// TODO Auto-generated method stub
		String select= "select * from provider_details";
		List<Provider>providerList=template.query(select, new ProviderMapper());
		return providerList;
	}

	public List<Students> viewStudents() {
		// TODO Auto-generated method stub
		String select="select * from student";
		List<Students>studentList=template.query(select, new StudentMapper());
		return studentList;
	}

	public List<Students> showAdmissions() {
		// TODO Auto-generated method stub
		String select= "select * from student";
		List<Students> sl= template.query(select, new StudentMapper());
		return sl;
	}

	public List<Course> showCourses() {
		// TODO Auto-generated method stub
		String select="select* from course";
		return template.query(select, new CourseMapper());
	}

	public void enrollStatus(int fid) {
		// TODO Auto-generated method stub
		String update = "update student set enrollstatus=? where formid=?";
		template.update(update,new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setString(1,"completed");
				ps.setInt(2, fid);
				
			}
		});
	}

	public int editPassword(String name, String email, String phone, String userid) {
		// TODO Auto-generated method stub
		String update="update admin_details set name=?,email=?,phone=? where userid=?";
		int status= template.update(update,new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, phone);
				ps.setString(4, userid);
			}
		});
		return status;
	}

	public int checkPass(String currpass, String username) {
		// TODO Auto-generated method stub
		int status;
	    a=new Admin();
		String select="select * from admin_details where userid=?";
		template.queryForObject(select, new RowMapper<Admin>() {

			@Override
			public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				String pass=rs.getString("userpass");
				a.setUserpass(pass);
				return a;
				
			}} ,new Object[]{username});
		
		if(a.getUserpass().equals(currpass)) {
			status=1;
		}
		else
			status=0;
		return status;
	}

	public int updatePassword(String userpass, String username) {
		// TODO Auto-generated method stub
		String strupdate="update admin_details set userpass=? where userid=?";
		int status=template.update(strupdate,new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setString(1, userpass);
				ps.setString(2, username);
			}
		});
		
		return status;
	}
	
	

}
