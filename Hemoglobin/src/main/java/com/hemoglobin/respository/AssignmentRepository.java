package com.hemoglobin.respository;

import java.util.List;

import com.hemoglobin.entities.Assignment;

public interface AssignmentRepository {

	List<Assignment> findAll();

	Assignment findById(int id);

	Assignment create(Assignment state);

	Assignment update(Assignment state);

	void delete(Assignment existing);

	List<Assignment> findByDonorId(int donorId);

}
