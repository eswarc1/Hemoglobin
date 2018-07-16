package com.hemoglobin.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "blood_tests")
public class BloodTests {
	@Id
	@GeneratedValue
	@Column(name = "blood_tests_id")
	private int bloodTestId;
	@Column
	private char hiv;
	@Column
	private char hepatitis;
	@Column
	private char syphilis;
	@Column
	private char malaria;
	@Column(name = "drug_test")
	private char drugTest;
	@Column(name = "created_at", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	@UpdateTimestamp
	private Date createdAt;
	@Column(name = "updated_at", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	@UpdateTimestamp
	private Date updatedAt;

	public int getBloodTestId() {
		return bloodTestId;
	}

	public void setBloodTestId(int bloodTestId) {
		this.bloodTestId = bloodTestId;
	}

	public char getHiv() {
		return hiv;
	}

	public void setHiv(char hiv) {
		this.hiv = hiv;
	}

	public char getHepatitis() {
		return hepatitis;
	}

	public void setHepatitis(char hepatitis) {
		this.hepatitis = hepatitis;
	}

	public char getSyphilis() {
		return syphilis;
	}

	public void setSyphilis(char syphilis) {
		this.syphilis = syphilis;
	}

	public char getMalaria() {
		return malaria;
	}

	public void setMalaria(char malaria) {
		this.malaria = malaria;
	}

	public char getDrugTest() {
		return drugTest;
	}

	public void setDrugTest(char drugTest) {
		this.drugTest = drugTest;
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
		return "BloodTests [bloodTestId=" + bloodTestId + ", hiv=" + hiv + ", hepatitis=" + hepatitis + ", syphilis="
				+ syphilis + ", malaria=" + malaria + ", drugTest=" + drugTest + ", createdAt=" + createdAt
				+ ", updatedAt=" + updatedAt + "]";
	}

}
