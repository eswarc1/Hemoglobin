package com.hemoglobin.entities;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "donor_info")
public class DonorInfo {

	@Id
	@GeneratedValue
	@Column(name = "donor_info_id")
	private int donorInfoId;
	@Column
	private String height;
	@Column
	private String weight;
	@Column(name = "hair_color")
	private String hairColor;
	@Column(name = "eye_color")
	private String eyeColor;
	@Column(name = "last_donated_date")
	@DateTimeFormat(pattern = "mm/dd/yyyy")
	private Date lastDonatedDate;
	@Column
	private String ssn;
	@Column(name = "id_type")
	private String idType;
	@Column(name = "id_number")
	private String idNumber;
	@DateTimeFormat(pattern = "mm/dd/yyyy")
	@Column(name = "id_issue_date")
	private Date idIssueDate;
	@DateTimeFormat(pattern = "mm/dd/yyyy")
	@Column(name = "id_expiry_date")
	private Date idExpiryDate;
	@Column
	private String occupation;
	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "work_address_id")
	private UserAddress workAddress;
	@Column(name = "created_at", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	@UpdateTimestamp
	private Date createdAt;
	@Column(name = "updated_at", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	@UpdateTimestamp
	private Date updatedAt;

	public int getDonorInfoId() {
		return donorInfoId;
	}

	public void setDonorInfoId(int donorInfoId) {
		this.donorInfoId = donorInfoId;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getHairColor() {
		return hairColor;
	}

	public void setHairColor(String hairColor) {
		this.hairColor = hairColor;
	}

	public String getEyeColor() {
		return eyeColor;
	}

	public void setEyeColor(String eyeColor) {
		this.eyeColor = eyeColor;
	}

	public Date getLastDonatedDate() {
		return lastDonatedDate;
	}

	public void setLastDonatedDate(Date lastDonatedDate) {
		this.lastDonatedDate = lastDonatedDate;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getIdType() {
		return idType;
	}

	public void setIdType(String idType) {
		this.idType = idType;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public Date getIdIssueDate() {
		return idIssueDate;
	}

	public void setIdIssueDate(Date idIssueDate) {
		this.idIssueDate = idIssueDate;
	}

	public Date getIdExpiryDate() {
		return idExpiryDate;
	}

	public void setIdExpiryDate(Date idExpiryDate) {
		this.idExpiryDate = idExpiryDate;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public UserAddress getWorkAddress() {
		return workAddress;
	}

	public void setWorkAddress(UserAddress workAddress) {
		this.workAddress = workAddress;
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
