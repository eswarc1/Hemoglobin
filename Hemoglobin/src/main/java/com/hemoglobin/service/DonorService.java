package com.hemoglobin.service;

import java.util.List;

import com.hemoglobin.entities.Donor;
import com.hemoglobin.entities.DonorSearch;
import com.hemoglobin.exceptions.DonorException;

public interface DonorService {

	Donor register(Donor donor) throws DonorException;

	void deregister(Donor donor) throws DonorException;

	Donor getDonarById(int id) throws DonorException;

	List<Donor> getDonars() throws DonorException;
	
	List<Donor> getDonarsByStatus(int statusId) throws DonorException;
	
	Donor getDonarByUserId(int userId);

	Donor updateDonor(int id,Donor donor) throws DonorException;

	Donor delete(int id) throws DonorException;

	List<Donor> getDonorsBySearchCriteria(DonorSearch donorSearch) throws DonorException;

}
