package com.hemoglobin.service;

import java.util.List;

import com.hemoglobin.entities.BloodRequest;
import com.hemoglobin.exceptions.BloodRequestException;

public interface BloodRequestService {

	List<BloodRequest> findAll() throws BloodRequestException;
	
	List<BloodRequest> findByUser(int userId) throws BloodRequestException; 

	BloodRequest findById(int id) throws BloodRequestException;

	BloodRequest create(BloodRequest usr) throws BloodRequestException;

	BloodRequest update(int id, BloodRequest usr) throws BloodRequestException;

	BloodRequest delete(int id) throws BloodRequestException;
}
