package org.nlt.model;

import java.util.Date;

public class Category {
	private int cid;
	private String name;
	private String description;
	private Date publishedDate;
	private int status;

	public Category() {

	}

	public Category(int cid, String name, String description, Date publishedDate) {
		this.cid = cid;
		this.name = name;
		this.description = description;
		this.publishedDate = publishedDate;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getPublishedDate() {
		return publishedDate;
	}

	public void setPublishedDate(Date publishedDate) {
		this.publishedDate = publishedDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
