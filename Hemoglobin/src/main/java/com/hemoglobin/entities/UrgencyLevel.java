package com.hemoglobin.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "urgency_level")
@NamedQueries({ @NamedQuery(name = "UrgencyLevel.findAll", query = "SELECT ul FROM UrgencyLevel ul "),
		@NamedQuery(name = "UrgencyLevel.findByUrgency", query = "SELECT ul FROM UrgencyLevel ul WHERE ul.urgency=:urgencyAttr") })
public class UrgencyLevel {

	@Id
	@GeneratedValue
	@Column(name = "urgency_id")
	private int urgencyId;
	@Column
	private String urgency;
	@Column
	private double price;
	@Column(name = "created_at", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	@UpdateTimestamp
	private Date createdAt;
	@Column(name = "updated_at", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	@UpdateTimestamp
	private Date updatedAt;

	public int getUrgencyId() {
		return urgencyId;
	}

	public void setUrgencyId(int urgencyId) {
		this.urgencyId = urgencyId;
	}

	public String getUrgency() {
		return urgency;
	}

	public void setUrgency(String urgency) {
		this.urgency = urgency;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

}
