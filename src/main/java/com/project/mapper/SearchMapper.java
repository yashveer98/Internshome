package com.project.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.project.models.Provider;

public class SearchMapper implements RowMapper<Provider> {
Provider p;
	@Override
	public Provider mapRow(ResultSet rs, int rowNum) throws SQLException {
		p=new Provider();
		p.setCmpname(rs.getString("cmpname"));
		p.setUsername(rs.getString("username"));
		p.setLattitude(rs.getDouble("lattitude"));
		p.setLongitude(rs.getDouble("longitude"));
		p.setEmail(rs.getString("email"));
		p.setPhone(rs.getString("phone"));
		return p;
	}
	

}
