package com.hemoglobin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hemoglobin.entities.Status;
import com.hemoglobin.exceptions.StatusException;
import com.hemoglobin.respository.StatusRepository;
import com.hemoglobin.service.StatusService;

@Service
public class StatusServiceImpl implements StatusService {

	@Autowired
	private StatusRepository repository;

	public List<Status> findAll() throws StatusException {
		List<Status> statusces = repository.findAll();
		if (statusces != null && statusces.size() > 0)
			return statusces;
		else
			throw new StatusException("No status found ");
	}

	public Status findById(int id) throws StatusException {
		Status status = repository.findById(id);
		if (status == null) {
			throw new StatusException("Status with id:" + id + " not found");
		}
		return status;
	}

	@Transactional
	public Status create(Status status) throws StatusException {
		Status statusInDB = repository.findByDescription(status.getDescription());
		if (statusInDB != null) {
			throw new StatusException("Status with code " + status.getDescription() + " is already in use");
		}
		return repository.create(status);
	}

	@Transactional
	public Status update(int id, Status status) throws StatusException {
		Status statusInDB = repository.findById(id);
		if (statusInDB == null) {
			throw new StatusException("Status with id:" + id + " not found");
		}
		return repository.update(status);
	}

	@Transactional
	public void delete(int id) throws StatusException {
		Status statusInDB = repository.findById(id);
		if (statusInDB == null) {
			throw new StatusException("Status with id:" + id + " not found");
		}
		repository.delete(statusInDB);
	}

}
