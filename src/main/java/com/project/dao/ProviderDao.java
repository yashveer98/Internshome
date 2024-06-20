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

import com.project.mapper.CourseMapper;
import com.project.mapper.ProviderMapper;
import com.project.models.Course;
import com.project.models.Job;
import com.project.models.Notice;
import com.project.models.Provider;

@Repository
public class ProviderDao {
	Provider p;
	@Autowired
	JdbcTemplate template;

	public Provider doLogin(String username, String userpass) {
			String strsql="select * from provider_details where username=? and userpass=?";
			try {
				p=new Provider();
			template.queryForObject(strsql, new RowMapper<Provider>() {

				@Override
				public Provider mapRow(ResultSet rs, int rowNum) throws SQLException {
					// TODO Auto-generated method stub
					String username=rs.getString("username");
					String name=rs.getString("cmpname");
					String email=rs.getString("email");
					String phone= rs.getString("phone");
					String city =rs.getString("city");
					//
					
					p.setUsername(username);
					p.setEmail(email);
					p.setPhone(phone);
					p.setCmpname(name);
					p.setCity(city);
					//p.setId(id);
					
							
					return p;
				}
				
			}  ,
					
					
					new Object[] {username,userpass});
			
			}catch (EmptyResultDataAccessException e) {
			
				return null;
			}
			return p;
		}

	public void doRegistration(Provider provider) {
		String strinsert="insert into provider_details(username, userpass, email, cmpname, phone, city, address, aboutcmp,lattitude,longitude) values(?,?,?,?,?,?,?,?,?,?)";
		int status=template.update(strinsert,new Object[] {provider.getUsername(),provider.getPassword(),provider.getEmail(),provider.getCmpname(),provider.getPhone(),provider.getCity(),provider.getAddress(),provider.getAboutcmp(),provider.getLattitude(),provider.getLongitude()});
		System.out.println(status+"Row inserted");
		
	}

	public void updateProfile(String address,String email, String phone,String username) {
		// TODO Auto-generated method stub
		String strupdate="update provider_details set address=?,email=?,phone=? where username=?";
		template.update(strupdate,new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setString(1, address);
				ps.setString(2, email);
				ps.setString(3, phone);
				ps.setString(4, username);
				
			}
		});
		
	}

	public Provider viewProfile(String username) {
		// TODO Auto-generated method stub
		String strsql="select * from provider_details where username=?";
		try {
			p=new Provider();
		template.queryForObject(strsql, new RowMapper<Provider>() {

			@Override
			public Provider mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				String name=rs.getString("cmpname");
				String email=rs.getString("email");
				String phone= rs.getString("phone");
				String city=rs.getString("city");
				
				
				p.setEmail(email);
				p.setPhone(phone);
				p.setCmpname(name);
				p.setCity(city);
				
						
				return p;
			}
			
		}  ,
				
				
				new Object[] {username});
		
		}catch (EmptyResultDataAccessException e) {
		
			return null;
		}
		return p;
	}
	public void updatePassword(String userpass, String username) {
		// TODO Auto-generated method stub
		String strupdate="update provider_details set userpass=? where username=?";
		template.update(strupdate,new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setString(1, userpass);
				ps.setString(2, username);
				System.out.println(ps);
				
			}
		});
	}

	public void addCourse( Course course) {
		// TODO Auto-generated method stub
		String update ="insert into course(username, coursename, fees, duration, contents, aboutcourse) values(?,?,?,?,?,?)";
		int status=template.update(update,new Object[] {course.getUsername(),course.getCoursename(),course.getFees(),course.getDuration(),course.getContents(),course.getAboutcourse()});
		System.out.println(status+"Row inserted");
	}

	public List<Course> showCourse() {
		// TODO Auto-generated method stub
		String select= "select * from course";
		List<Course>courseList= template.query(select, new CourseMapper());
		return courseList;
	}

	public int addJob(Job job) {
		// TODO Auto-generated method stub
		System.out.println(job);
		String insert="insert into Job (postname,vacancies,elegibility,lastdate,mailid,postdate,provider) values(?,?,?,?,?,?,?)";
		int status=template.update(insert,new Object[]{job.getPostname(),job.getVacancies(),job.getElegibility(),job.getLastdate(),job.getMailid(),job.getPostdate(),job.getProvider()});
		return status;

	}

	public int addNotice(Notice notice) {
		// TODO Auto-generated method stub
		String insert= "insert into notice(content, date, username) values(?,?,?)";
		int status=template.update(insert,new Object[] {notice.getContent(),notice.getDate(),notice.getUsername()});
		return status;
		
		
	}	
	

	public int checkPass(String currpass, String username) {
		// TODO Auto-generated method stub
	    int status;
	    p=new Provider();
		String select="select * from provider_details where username=?";
		template.queryForObject(select, new RowMapper<Provider>() {

			@Override
			public Provider mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				String pass=rs.getString("userpass");
				p.setPassword(pass);
				return p;
			}} ,new Object[]{username});
		
		if(p.getPassword().equals(currpass)) {
			status=1;
		}
		else
			status=0;
		return status;
	}
}
