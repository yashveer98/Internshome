package com.project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.models.Bank;
import com.project.models.Contact;
import com.project.models.Course;
import com.project.models.Feedback;
import com.project.models.Job;
import com.project.models.Notice;
import com.project.models.Provider;
import com.project.service.CommonService;
import com.project.utility.Messages;

@Controller
public class CommonControllers {
	@Autowired
	CommonService service;
	@GetMapping("/")
	public String homePage(Model model)
	{
		/* How to return data from Controller to view(jsp) */
		model.addAttribute("title","Internshome");
		List<Provider>pl = service.getProvider();
		model.addAttribute("pl",pl);
		List<Notice>ntc=service.getNotice();
		model.addAttribute("ntc", ntc);
		return "common_jsp/index";
	}
		
		@GetMapping("/contactus")
		public String contactUs(Model model)
		{
			/* How to return data from Controller to view(jsp) */
			model.addAttribute("title","Contact Us");
			return "common_jsp/contactus";
		}
		
		@PostMapping("/contact")
		public String postContact(@ModelAttribute("contact") Contact contact, Model model)
		{
			//System.out.println(contact);
			service.addContact(contact);	//calling addContact method of service class
			model.addAttribute("message",Messages.CONTACT_US_MESSAGE);
			
			return "common_jsp/contactus";
		}
		
		@GetMapping("/feedback")
		public String feedback(Model model) {
			model.addAttribute("title", "feedback");
			return "common_jsp/feedback";
		}
		
		@PostMapping("/postfeedback")
		public String postFeedback(@ModelAttribute("feedback") Feedback feedback,Model model) {
			
			service.addFeedback(feedback);
			
			return "common_jsp/feedback";
			
		}
		@GetMapping("common_jsp/viewcourse/{username}")
		public String getCourse(@PathVariable("username") String username,Model model ) {
			List<Course>courseList = service.getCourse(username);
			model.addAttribute("cl",courseList);
			return "/common_jsp/viewcourse";
		}
		@GetMapping("/studentenrollment/{username}/{coursename}")
		public String enroll(@PathVariable("username") String username,@PathVariable("coursename") String coursename,Model model) 
		{
			Bank b=service.showBank(username);
			model.addAttribute("b",b);
			model.addAttribute("un", username);
			model.addAttribute("cn",coursename);
			
			return "/common_jsp/studentenrollment";
		}
		@GetMapping("/viewjob")
		public String viewJob(Model model) {
			List<Job> jobList=service.viewJob();
			model.addAttribute("jl", jobList);
			return "/common_jsp/viewjob";
			
		}
		@GetMapping("/searchbylocation")
		public String location() {
			return "/common_jsp/searchbylocation";
		}
		@GetMapping("/searchbylocation1")
		public @ResponseBody List<Provider> locateOwner(@RequestParam("lat")double lat,@RequestParam("lng")double lng,Model model)
		{
			System.out.println("Latitude"+lat);
			System.out.println("Longitude"+lng);
			//ResponseEntity<T>
			List<Provider>ownerlist=service.showProvider(lat,lng);
				System.out.println(ownerlist);
			//return Arrays.asList(new String("scott"),new String("smith"));
			return ownerlist;
			
		}
		@GetMapping("/feedback2")
		public String openFeedback() {
			return "/common_jsp/feedback2";
		}
}
