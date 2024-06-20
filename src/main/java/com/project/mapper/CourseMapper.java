package com.project.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.project.models.Course;

public class CourseMapper implements RowMapper<Course> {

		Course course;

		@Override
		public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			course= new Course(rs.getString("username"),rs.getString("coursename"),rs.getString("fees"),rs.getString("duration"),rs.getString("contents"),rs.getString("aboutcourse"));
			
			return course;
		}
		
	


}
