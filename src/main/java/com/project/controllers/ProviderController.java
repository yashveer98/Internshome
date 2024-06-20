package com.project.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.models.Course;
import com.project.models.Job;
import com.project.models.Notice;
import com.project.models.Provider;
import com.project.service.ProviderService;

@Controller
@RequestMapping("/provider")
public class ProviderController {
	
	@Autowired
	ProviderService service;
	@GetMapping("/provider_registration")
	public String  providerRegistration() {
		return "/provider/provider_registration3";
	}
	@PostMapping("/provider_register")
	public String AddRegistration(@ModelAttribute("provider")Provider provider,Model model){
		
	      service.register(provider);
	      
		return "provider/provider_registration3";
		
	}
	@GetMapping("/loginpage")
	public String provider_login() {
		return "provider/provider_login";
	}
	@PostMapping("/login")
	public String login(Model model,@RequestParam("username")String username,@RequestParam("userpass")String userpass,HttpSession hs,Course course)
	{
		Provider p= service.providerLogin(username,userpass);
		if(p!=null) {
			hs.setAttribute("adminkey", p);
			model.addAttribute("user",p);
			hs.setAttribute("username", p.getUsername());
			hs.setAttribute("role","Provider");
			//System.out.println(p);
			List<Course>sc=service.showCourse();
			model.addAttribute("sc",sc);
			return "provider/provider_home";
		}
		else {
			
			return "provider/provider_login";
		}
	
	}
	@GetMapping("/editprofile")
	public String editProfile(HttpSession hs,Model model) {
		Provider p= (Provider)hs.getAttribute("adminkey");
		model.addAttribute("user",p);
		return"provider/editprofile1";
	}
	@PostMapping("/post_editprofile")
	public String post_editProfile(@RequestParam("address")String address,@RequestParam("email")String email,@RequestParam("phone")String phone,HttpSession hs,Model model) {
		Provider p = (Provider)hs.getAttribute("adminkey");
		String username=p.getUsername();
//		System.out.println(user.getUsername());
//		System.out.println(user.getEmail());
		service.updateProfile(address,email,phone,username);
		Provider p1= service.viewProfile(username);
		model.addAttribute("user",p1);
		return "provider/provider_home";
	}
	@GetMapping("/edit_password")
	public String editPassword(HttpSession hs,Model model) {
		Provider p= (Provider)hs.getAttribute("adminkey");
		model.addAttribute("user",p);
		return"provider/changepassword1";
	}
	@PostMapping("editpassword")
	public String post_editPassword(@RequestParam("currpass")String currpass,@RequestParam("confirmpass")String confirmpass,@RequestParam("userpass")String userpass,HttpSession hs,Model model) {
		Provider p = (Provider)hs.getAttribute("adminkey");
		String username=p.getUsername();
//		System.out.println(user.getUsername());
//		System.out.println(user.getEmail());
		int status=service.checkPass(currpass,username);
		if(status>0) {
			if(userpass.equals(confirmpass)) {
				service.updatePassword(userpass,username);
			}
		}
		else {
			System.out.println("Enter correct Old password");
		}
		
//		Provider p1= service.viewProfile(username);
//		model.addAttribute("user",p1);
		return "provider/provider_home";
	}
	@GetMapping("/add_course")
	public String addcourse(){
		return "/provider/addcourse";
	}
	
	@PostMapping("addcourse")
	public String addCourse(@ModelAttribute("course")Course course,HttpSession hs,Model model) {
		Provider p = (Provider)hs.getAttribute("adminkey");
		String username=p.getUsername();
		
		course.setUsername(username);
		service.addCourse(course);
		System.out.println(course);
		
		return "/provider/addcourse";
		}
	@GetMapping("/view_course")
	public String viewCourse(Model model,HttpSession hs,Course course) {
		//Provider p=(Provider)hs.getAttribute("adminkey");
		//course.setUsername(p.getUsername());
		List<Course>sc=service.showCourse();
		model.addAttribute("sc",sc);
		return "/provider/viewcourse";
	}
	@GetMapping("/job_post")
	public String postJob() {
		return "/provider/postjob";
	}
	@PostMapping("/postjob")
	public String addJob(@ModelAttribute("job") Job job,HttpSession hs) {
		Provider p= (Provider)hs.getAttribute("adminkey");
		//Last date of post
//		 SimpleDateFormat DateFormat
//	      = new SimpleDateFormat("yyyy/MM/dd");
//		java.util.Date date=job.getLastdate();
//		String lastDate=DateFormat.format(date);
		System.out.println("last date to apply"+job.getLastdate());
		
		//Current Date of posting 
        java.util.Date dt=new java.util.Date();
		java.sql.Date sd=new java.sql.Date(dt.getTime());
		job.setPostdate(sd);
		job.setProvider(p.getUsername());
		int status=service.addJob(job);
		System.out.println(status);
		return "/provider/provider_home";
	}
	@GetMapping("/add_notice")
	public String notice() {
		return "/provider/notice";
	}
	@PostMapping("/notice")
	public String addNotice(@ModelAttribute("notice") Notice notice,HttpSession hs,Model model) {
		String username=(String)hs.getAttribute("username");
		notice.setUsername(username);
		java.util.Date dt=new java.util.Date();
		java.sql.Date sd=new java.sql.Date(dt.getTime());
		notice.setDate(sd);
		int status=service.addNotice(notice);
		if(status>0) {
			return "/provider/notice";
		}
		else {
			return null;
		}
		
		
	}
	@GetMapping("/provider_logout")
	public String providerLogout(HttpSession hs,Model model) {
		if(hs!=null) {
			hs.removeAttribute("adminkey");
			hs.removeAttribute("username");
			hs.removeAttribute("role");
			hs.invalidate();//invalidate function is used to destroy session 
			
		}
		return "provider/provider_login";
		}
//	public String post_editProfile(@ModelAttribute("user")Provider user,HttpSession hs) {
//		Provider p = (Provider)hs.getAttribute("adminkey");
//		String username= p.getUsername();
//		System.out.println(user.getUsername());
//		System.out.println(user.getEmail());
//		return null;
//	}
	

}
