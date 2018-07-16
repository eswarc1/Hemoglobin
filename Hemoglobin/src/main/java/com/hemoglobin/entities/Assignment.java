package com.hemoglobin.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "assignments")
@NamedQueries({ @NamedQuery(name = "Assignment.findAll", query = "SELECT a FROM Assignment a "),
		@NamedQuery(name = "Assignment.findByDonorId", query = "SELECT a FROM Assignment a WHERE a.donor.donorId=:donorIdAttr") })
public class Assignment {

	@Id
	@GeneratedValue
	@Column(name = "assignment_id")
	private int assignmentId;
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "donor_id")
	private Donor donor;
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "request_id")
	private BloodRequest bloodRequest;
	@Column(name = "created_at", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	@UpdateTimestamp
	private Date createdAt;
	@Column(name = "updated_at", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	@UpdateTimestamp
	private Date updatedAt;

	public int getAssignmentId() {
		return assignmentId;
	}

	public void setAssignmentId(int assignmentId) {
		this.assignmentId = assignmentId;
	}

	public Donor getDonor() {
		return donor;
	}

	public void setDonor(Donor donor) {
		this.donor = donor;
	}

	public BloodRequest getBloodRequest() {
		return bloodRequest;
	}

	public void setBloodRequest(BloodRequest bloodRequest) {
		this.bloodRequest = bloodRequest;
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
		return "Assignment [assignmentId=" + assignmentId + ", donor=" + donor + ", bloodRequest=" + bloodRequest + "]";
	}

}
