package com.project.controllers;




import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.instamojo.wrapper.api.ApiContext;
import com.instamojo.wrapper.api.Instamojo;
import com.instamojo.wrapper.api.InstamojoImpl;
import com.instamojo.wrapper.exception.ConnectionException;
import com.instamojo.wrapper.exception.HTTPException;
import com.instamojo.wrapper.model.PaymentOrder;
import com.instamojo.wrapper.model.PaymentOrderResponse;
import com.project.models.Bank;
import com.project.models.Students;
import com.project.service.StudentService;

@Controller
public class StudentController {
	@Autowired()
	StudentService service;
	// 
	ApiContext context=ApiContext.create("test_9hbnOBVGMEnrmQMYoHb08wXtecvoUVcXStn", "test_eURtJkAuNjADZzRbapB2HuMtu0iOwPdIVYJOJ21hmBWQ0KseWIt2UYWa1zeWc04Z6UxBSqKrPFSghE8yDomtiIVR2IzuHH8TwYgbytD8foMrETRD8Of4UUi1r0N", ApiContext.Mode.TEST);
	Instamojo api=new InstamojoImpl(context);
	
	
	@PostMapping("/student_enrollment/{un}/{cn}")
	public String studentEnrollment(@PathVariable("un")String username,@PathVariable("cn")String coursename,@ModelAttribute("student") Students student,Model model) {
		student.setProviderusername(username);
		student.setCourseid(coursename);
		java.util.Date dt= new java.util.Date();
		java.sql.Date sd= new java.sql.Date(dt.getTime());
		student.setDate(sd);
		student.setEnrollStatus("pending");
		service.enroll(student);
		model.addAttribute("st",student.getProviderusername());
		return "/common_jsp/enrollcompletion";
		
		
	}
	
	@PostMapping("/payment1")
	public void makePayment(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		System.out.println("in payment method");
		
//		UUID uuid=UUID.randomUUID();   
//		System.out.println(uuid);
		
		PaymentOrder order = new PaymentOrder();
		order.setName("John Smith");
		order.setEmail("john.smith@gmail.com");
		order.setPhone("9987654587");
		order.setCurrency("INR");
		order.setAmount(90.0);
		order.setDescription("This is a test transaction.");
		//order.setRedirectUrl("https://test.instamojo.com/@manoj_lko2021");
		order.setRedirectUrl("http://localhost:8080/trainee/thanku");
		//order.setWebhookUrl("http://localhost:8080/trainee/thanku");
		//order.setWebhookUrl("http://www.precursorinfo.org");
		
		order.setTransactionId("dxg1239890");
		System.out.println(order.getDescription());
		//insert
		try {
		    PaymentOrderResponse paymentOrderResponse = api.createPaymentOrder(order);
		    response.sendRedirect(paymentOrderResponse.getPaymentOptions().getPaymentUrl());
		    
		    System.out.println(paymentOrderResponse.getPaymentOrder().getStatus());

		} catch (HTTPException e) {
		    System.out.println(e.getStatusCode());
		    System.out.println(e.getMessage());
		    System.out.println(e.getJsonPayload());

		} catch (ConnectionException e) {
		    System.out.println(e.getMessage());
	}
	
	
	}
	
}

