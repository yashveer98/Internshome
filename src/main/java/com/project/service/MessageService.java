package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;


import com.project.dao.MessageDao;
import com.project.models.Message;

@Service
public class MessageService {
	@Autowired
	MessageDao dao;

	public int compose(Message msg) {
		// TODO Auto-generated method stub
		return dao.compose(msg);
	}

	public List<Message> getMessage(String username) {
		// TODO Auto-generated method stub
		return dao.getMessage(username);
	}

}
