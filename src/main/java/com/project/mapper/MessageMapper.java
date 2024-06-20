package com.project.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.project.models.Message;

public class MessageMapper implements RowMapper<Message> {
	Message message;

	@Override
	public Message mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		message= new Message(rs.getInt("msgid"),rs.getString("subject"),rs.getString("senderid"),rs.getString("recieverid"),rs.getString("content"),rs.getString("rstatus"),rs.getString("sstatus"),rs.getDate("date"));
		return message;
	}
	

}
