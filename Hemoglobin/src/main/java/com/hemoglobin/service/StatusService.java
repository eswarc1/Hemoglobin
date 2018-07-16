package com.hemoglobin.service;

import java.util.List;

import com.hemoglobin.entities.Status;
import com.hemoglobin.exceptions.StatusException;

public interface StatusService {

	List<Status> findAll() throws StatusException;

	Status findById(int id) throws StatusException;

	Status create(Status state) throws StatusException;

	Status update(int id, Status state) throws StatusException;

	void delete(int id) throws StatusException;

}
