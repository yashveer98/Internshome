package com.project.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.project.models.Provider;

public class ProviderMapper implements RowMapper<Provider>{
	Provider p;

	@Override
	public Provider mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		p= new Provider(rs.getString("username"),rs.getString("email"),rs.getString("cmpname"),rs.getString("phone"),rs.getString("city"),rs.getString("address"),rs.getString("aboutcmp"));
		
		return p;
	}

}
