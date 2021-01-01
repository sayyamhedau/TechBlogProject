package org.nlt.model;

import java.util.Date;

public class Post {
	private int pid;
	private String post_title;
	private String post_content;
	private Date publishedDate;
	private int userid;
	private int categoryid;
	private int status;

	
	public Post() {

	}


	public Post(String post_title, String post_content, int userid, int categoryid, int status) {
		this.post_title = post_title;
		this.post_content = post_content;
		this.userid = userid;
		this.categoryid = categoryid;
		this.status = status;
	}

	
	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}


	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public Date getPublishedDate() {
		return publishedDate;
	}

	public void setPublishedDate(Date publishedDate) {
		this.publishedDate = publishedDate;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Post [pid=" + this.pid + ", post_title=" + post_title + ", post_content=" + post_content + ", publishedDate="
				+ publishedDate + ", userid=" + userid + ", categoryid=" + categoryid + ", status=" + status + "]";
	}

}
