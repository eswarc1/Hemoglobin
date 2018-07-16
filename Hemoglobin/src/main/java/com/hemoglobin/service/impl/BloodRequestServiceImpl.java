package com.hemoglobin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hemoglobin.entities.BloodRequest;
import com.hemoglobin.entities.Status;
import com.hemoglobin.exceptions.BloodRequestException;
import com.hemoglobin.respository.BloodRequestRepository;
import com.hemoglobin.service.BloodRequestService;

@Service
public class BloodRequestServiceImpl implements BloodRequestService {

	@Autowired
	private BloodRequestRepository repository;

	public List<BloodRequest> findAll() throws BloodRequestException {
		List<BloodRequest> bloodRequests = repository.findAll();
		if (bloodRequests != null && bloodRequests.size() > 0)
			return bloodRequests;
		else
			throw new BloodRequestException("No Blood Requests found ");
	}

	public BloodRequest findById(int id) throws BloodRequestException {
		BloodRequest request = repository.findById(id);
		if (request == null) {
			throw new BloodRequestException("Blood Request with id:" + id + " not found");
		}
		return request;
	}

	@Transactional
	public BloodRequest create(BloodRequest request) throws BloodRequestException {
		BloodRequest requestFromDB = repository.create(request);
		if (requestFromDB == null) {
			throw new BloodRequestException("Blood Request cannot br created");
		}
		return requestFromDB;
	}

	@Transactional
	public BloodRequest update(int id, BloodRequest request) throws BloodRequestException {
		BloodRequest requestInDB = repository.findById(id);
		if (requestInDB == null) {
			throw new BloodRequestException("Blood Request with id:" + id + " not found");
		}
		return repository.update(request);
	}

	@Transactional
	public BloodRequest delete(int id) throws BloodRequestException {
		BloodRequest requestInDB = repository.findById(id);
		if (requestInDB == null) {
			throw new BloodRequestException("Blood Request with id:" + id + " not found");
		}
		requestInDB.setStatus(new Status(4));
		return repository.update(requestInDB);
	}

	@Override
	public List<BloodRequest> findByUser(int userId) throws BloodRequestException {
		List<BloodRequest> bloodRequests = repository.findByUserId(userId);
		if (bloodRequests != null && bloodRequests.size() > 0)
			return bloodRequests;
		else
			throw new BloodRequestException("No Blood Requests found for user with userId :" + userId);
	}

}
