package com.project.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.project.mapper.MessageMapper;
import com.project.models.Message;


@Repository
public class MessageDao {
@Autowired
JdbcTemplate template;

public int compose(Message msg) {
	// TODO Auto-generated method stub
	String insert= "insert into message(subject, senderid, recieverid, content, rstatus, sstatus, date) values(?,?,?,?,?,?,?)";
	int status= template.update(insert,new Object[] {msg.getSubject(),msg.getSenderid(),msg.getRecieverid(),msg.getContent(),msg.getRstatus(),msg.getSstatus(),msg.getDate()});
	
	return status;
}

public List<Message> getMessage(String username) {
	// TODO Auto-generated method stub
	String select= "select * from message where recieverid=?";
	List<Message> message= template.query(select, new MessageMapper(), new Object[] {username});
	return message;
}
}
