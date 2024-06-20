package com.project.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.project.models.Feedback;

public class FeedbackMapper implements RowMapper<Feedback> {
	Feedback feedback;
	
	@Override
	public Feedback mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		feedback= new Feedback(rs.getString("name"),rs.getString("email"),rs.getString("phone"),rs.getString("feedback"),rs.getString("rating"));
		feedback.setId(rs.getInt("id"));
		return feedback;
	}

}
