package com.project.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.project.models.Notice;

public class NoticeMapper implements RowMapper<Notice>{
	Notice ntc;

	@Override
	public Notice mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		ntc= new Notice(rs.getInt("noticeid"), rs.getString("content"), rs.getDate("date"), rs.getString("username")); 
				
		return ntc;
	}

}
