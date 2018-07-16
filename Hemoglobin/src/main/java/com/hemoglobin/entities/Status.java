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
@Table(name = "status")
@NamedQueries({ @NamedQuery(name = "Status.findAll", query = "SELECT s FROM Status s "),
		@NamedQuery(name = "Status.findByDescription", query = "SELECT s FROM Status s WHERE s.description=:descAttr") })
public class Status {
	@Id
	@GeneratedValue
	@Column(name = "status_id")
	private int statusId;
	@Column
	private String description;
	@Column(name = "created_at", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	@UpdateTimestamp
	private Date createdAt;
	@Column(name = "updated_at", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	@UpdateTimestamp
	private Date updatedAt;

	public Status(int statusId) {
		this.statusId = statusId;
	}

	public Status() {
	}

	public int getStatusId() {
		return statusId;
	}

	public void setStatusId(int stateId) {
		this.statusId = stateId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	@Override
	public String toString() {
		return "Status [statusId=" + statusId + ", description=" + description + ", createdAt=" + createdAt
				+ ", updatedAt=" + updatedAt + "]";
	}

}
