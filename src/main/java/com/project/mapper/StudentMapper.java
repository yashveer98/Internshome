package com.project.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.project.models.Students;

public class StudentMapper implements RowMapper<Students>{
	Students s;

	@Override
	public Students mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		s=new Students(rs.getDate("date"),rs.getInt("formid"),rs.getString("coursename"),rs.getString("name"),rs.getString("email"),rs.getString("phone"),rs.getString("city"),rs.getString("college"),rs.getString("address"),rs.getString("degree"),rs.getString("providername"),rs.getString("transactionid"),rs.getString("enrollstatus"));
		return s;
	}

}
