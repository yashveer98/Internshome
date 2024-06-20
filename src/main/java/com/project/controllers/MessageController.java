package com.project.controllers;


import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.models.Message;
import com.project.service.MessageService;

@Controller
public class MessageController {
	
	@Autowired
	MessageService service;
	@GetMapping("/compose")
	public String getCompose(HttpSession hs,Model model) {
		
		String role=(String)hs.getAttribute("role");
		model.addAttribute("role", role);
		if(role.equals("Provider")) {
			return "/provider/message/provider_compose";
		}
		if(role.equals("Admin")) {
			return "/admin/message/admin_compose";
		}
		else {
		return null;
		}
	}
	@PostMapping("/send_data")
	public String postData(@ModelAttribute("msg") Message msg ,Model model, HttpSession hs) {
		String role=(String)hs.getAttribute("role");
		String senderid=(String)hs.getAttribute("username");
		msg.setSenderid(senderid);
		java.util.Date dt=new java.util.Date();
		java.sql.Date sd=new java.sql.Date(dt.getTime());
		msg.setDate(sd);
		msg.setRstatus("true");
		msg.setSstatus("true");
		int status=service.compose(msg);
		if(status>0) {
			if(role.equals("Admin")) {
				return "/admin/message/admin_compose";
			}
			if(role.equals("Provider")) {
				return "/provider/message/provider_compose";
			}
			
		}
		return null;
		
		
	}
	@GetMapping("/message")
	public String inbox(Model model,HttpSession hs) {
		
		String username= (String)hs.getAttribute("username");
		String role=(String)hs.getAttribute("role");
		List<Message> message=service.getMessage(username);
		model.addAttribute("msg",message);
		if(role.equalsIgnoreCase("provider")) {
		return "/provider/message/provider_inbox";
		}
		else if(role.equalsIgnoreCase("admin")) {
			return "/admin/message/admin_inbox";
		}
		return "";
	}
	@GetMapping("/message/{date}/{subject}/{senderid}/{content}")
public String inbox1(Model model,HttpSession hs,@PathVariable("date")Date date,@PathVariable("subject")String subject,@PathVariable("senderid")String senderid,@PathVariable("content")String content) {
		
		String username= (String)hs.getAttribute("username");
		List<Message> message=service.getMessage(username);
		model.addAttribute("msg",message);
		model.addAttribute("date",date);
		model.addAttribute("subject", subject);
		model.addAttribute("senderid",senderid);
		model.addAttribute("content", content);
		
		return "/provider/message/provider_inbox";
	}

	

}
