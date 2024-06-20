package com.project.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.project.models.Job;

public class JobMapper implements RowMapper<Job> {
	Job job;

	@Override
	public Job mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		job=new Job(rs.getInt("jobid"),rs.getString("postname"),rs.getString("vacancies"),rs.getString("elegibility"),rs.getDate("lastdate"),rs.getString("mailid"),rs.getDate("postdate"),rs.getString("provider"));
		return job;
	}
	

}
