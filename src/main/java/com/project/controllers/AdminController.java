package com.project.controllers;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.models.Admin;
import com.project.models.Contact;
import com.project.models.Course;
import com.project.models.Feedback;
import com.project.models.Provider;
import com.project.models.Students;
import com.project.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService service;
	@GetMapping("/adminpanel")
	public String admin_login() {
		return "admin/admin_login";
	}

	
	@PostMapping("/login")
	public String login(Model model,@RequestParam("userid")String userid,@RequestParam("userpass")String userpass,HttpSession hs)
	{
		Admin a= service.adminLogin(userid,userpass);
		if(a!=null) {
			hs.setAttribute("adminkey", a);
			hs.setAttribute("role","Admin");
			model.addAttribute("name",a.getName());
			List<Students> sl=service.showAdmissions();
			List<Course> cl=service.showCourses();
			model.addAttribute("cl",cl);
			model.addAttribute("sl",sl);
			List<Students>studentList=service.viewStudents();
			model.addAttribute("sl",studentList);
			List<Provider>providerList=service.viewProvider();
			model.addAttribute("pl",providerList);
			List<Contact>lc=service.showContacts();
			model.addAttribute("lc",lc);
			List<Feedback>lf=service.showFeedback();
			model.addAttribute("lf",lf);
			return "admin/admin_home";
		}
		else {
			
			return "admin/admin_login";
		}
	
	}
	
	@GetMapping("/viewcontacts")
	public String viewContacts(Model model) {
		
		List<Contact>lc=service.showContacts();
		model.addAttribute("lc",lc);
			return "/admin/viewcontacts";
			
		}
	
	@GetMapping("/viewfeedback")
	public String viewFeedback(Model model) {
		List<Feedback>lf=service.showFeedback();
		model.addAttribute("lf",lf);
		return "/admin/viewfeedback";
	}
	@GetMapping("/review/{id}")
	public String getReview(@PathVariable("id")int id,Model model) {
		Feedback f=service.showReview(id);
		model.addAttribute("feedback",f);
		return "/admin/review";
	}
	@GetMapping("/admin_logout")
	public String admin_Logout(HttpSession hs,Model model) {
		if(hs!=null) {
			hs.removeAttribute("adminkey");
			hs.invalidate();//invalidate function is used to destroy session 
		}
		List<Provider>providerList=service.viewProvider();
		model.addAttribute("pl",providerList);
		return "/admin/admin_login";
	}
	@GetMapping("/viewproviders")
	public String viewProvider(Model model) {
		List<Provider>providerList=service.viewProvider();
		model.addAttribute("pl",providerList);
		return "/admin/viewproviders";
	}
	@GetMapping("/viewstudents")
	public String viewStudents(Model model) {
		List<Students>studentList=service.viewStudents();
		model.addAttribute("sl",studentList);
		return "/admin/viewstudents";
	}
	@GetMapping("/statuschange/{es}/{fid}")
	public String statusChange(@PathVariable("es")String es,@PathVariable("fid")int fid,Model model) {
		
		List<Students> sl=service.showAdmissions();
		model.addAttribute("sl",sl);
		if(es.equals("pending")) {
			service.enrollStatus(fid);
			return "/admin/admin_home";
		}
		else {
			return "/admin/admin_home";
		}	
	}
	@GetMapping("/edit_profile")
	public String editProfile(HttpSession hs, Model model) {
		Admin a= (Admin)hs.getAttribute("adminkey");
		model.addAttribute("admin",a);
		return "/admin/editprofile1";
		
	}
	@GetMapping("/edit_password")
	public String editPassword() {
		return "/admin/changepassword1";
	}
	@PostMapping("/post_editprofile")
	public String postProfile(@RequestParam("name")String name,@RequestParam("email")String email,@RequestParam("phone")String phone,HttpSession hs, Model model){
		
		Admin a=(Admin)hs.getAttribute("adminkey");
		String userid=a.getUserid();
		int status=service.editProfile(name,email,phone,userid);
		return "/admin/admin_home";
	}
	@PostMapping("/post_editpassword")
	public String post_editPassword(@RequestParam("currpass")String currpass,@RequestParam("confirmpass")String confirmpass,@RequestParam("userpass")String userpass,HttpSession hs,Model model) {
		int updateStatus;
		Admin p = (Admin)hs.getAttribute("adminkey");
		String username=p.getUserid();
		int status=service.checkPass(currpass,username);
		if(status>0) {
			if(userpass.equals(confirmpass)) {
				updateStatus=service.updatePassword(userpass,username);
			}
		}
		else {
			System.out.println("Enter correct Old password");
		}
		
//		Provider p1= service.viewProfile(username);
//		model.addAttribute("user",p1);
		return "/admin/admin_home";
	}
	 
	}
