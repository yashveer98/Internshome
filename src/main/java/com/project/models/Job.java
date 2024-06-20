package com.project.models;

import java.sql.Date;

public class Job {
	private int jobid;
	private String postname;
	private String vacancies;
	private String elegibility;
	private Date lastdate;
	private String mailid;
	private Date postdate;
	private String provider;
	public int getJobid() {
		return jobid;
	}
	public void setJobid(int jobid) {
		this.jobid = jobid;
	}
	public String getPostname() {
		return postname;
	}
	public void setPostname(String postname) {
		this.postname = postname;
	}
	public String getVacancies() {
		return vacancies;
	}
	public void setVacancies(String vacancies) {
		this.vacancies = vacancies;
	}
	public String getElegibility() {
		return elegibility;
	}
	public void setElegibility(String elegibility) {
		this.elegibility = elegibility;
	}
	public Date getLastdate() {
		return lastdate;
	}
	public void setLastdate(Date lastdate) {
		this.lastdate = lastdate;
	}
	public String getMailid() {
		return mailid;
	}
	public void setMailid(String mailid) {
		this.mailid = mailid;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public String getProvider() {
		return provider;
	}
	public void setProvider(String provider) {
		this.provider = provider;
	}
	public Job() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Job(int jobid, String postname, String vacancies, String elegibility, Date lastdate, String mailid,
			Date postdate, String provider) {
		super();
		this.jobid = jobid;
		this.postname = postname;
		this.vacancies = vacancies;
		this.elegibility = elegibility;
		this.lastdate = lastdate;
		this.mailid = mailid;
		this.postdate = postdate;
		this.provider = provider;
	}
	@Override
	public String toString() {
		return "Job [jobid=" + jobid + ", postname=" + postname + ", vacancies=" + vacancies + ", elegibility="
				+ elegibility + ", lastdate=" + lastdate + ", mailid=" + mailid + ", postdate=" + postdate
				+ ", provider=" + provider + "]";
	}
	

}
