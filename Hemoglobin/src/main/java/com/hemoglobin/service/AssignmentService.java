package com.hemoglobin.service;

import java.util.List;

import com.hemoglobin.entities.Assignment;
import com.hemoglobin.exceptions.AssignmentException;

public interface AssignmentService {

	List<Assignment> findAll() throws AssignmentException;

	Assignment findById(int id) throws AssignmentException;

	Assignment create(Assignment state) throws AssignmentException;

	Assignment update(int id, Assignment state) throws AssignmentException;

	void delete(int id) throws AssignmentException;

	List<Assignment> findByDonorId(int donorId) throws AssignmentException;

}
