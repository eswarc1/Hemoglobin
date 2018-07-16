package com.hemoglobin.entities;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "donor")
@NamedQueries({ @NamedQuery(name = "Donor.findAll", query = "SELECT u FROM Donor u "),
		@NamedQuery(name = "Donor.findByUserId", query = "SELECT d FROM Donor d WHERE d.user.userId=:userIdAttr"),
		@NamedQuery(name = "Donor.findByStatusId", query = "SELECT d FROM Donor d WHERE d.status.statusId=:statusIdAttr") })
public class Donor {

	@Id
	@GeneratedValue
	@Column(name = "donor_id")
	private int donorId;
	@Column(name = "blood_group")
	private String bloodGroup;
	@Column(name = "date_of_birth")
	@DateTimeFormat(pattern = "mm/dd/yyyy")
	private Date dateOfBirth;
	@Column
	private char gender;
	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "address_id")
	private UserAddress userAddress;
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "status_id")
	private Status status;
	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "donor_info_id")
	private DonorInfo donorInfo;
	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "blood_tests_id")
	private BloodTests bloodTests;
	@Column(name = "created_at", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	@UpdateTimestamp
	private Date createdAt;
	@Column(name = "updated_at", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	@UpdateTimestamp
	private Date updatedAt;

	public int getDonorId() {
		return donorId;
	}

	public void setDonorId(int donorId) {
		this.donorId = donorId;
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public UserAddress getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(UserAddress userAddress) {
		this.userAddress = userAddress;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public DonorInfo getDonorInfo() {
		return donorInfo;
	}

	public void setDonorInfo(DonorInfo donorInfo) {
		this.donorInfo = donorInfo;
	}

	public BloodTests getBloodTests() {
		return bloodTests;
	}

	public void setBloodTests(BloodTests bloodTests) {
		this.bloodTests = bloodTests;
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
		return "Donor [donorId=" + donorId + ", bloodGroup=" + bloodGroup + ", dateOfBirth=" + dateOfBirth + ", gender="
				+ gender + ", userAddress=" + userAddress + ", user=" + user + ", status=" + status + ", donorInfo="
				+ donorInfo + ", bloodTests=" + bloodTests + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt
				+ "]";
	}

}
