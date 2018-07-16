package com.hemoglobin.respository;

import java.util.List;

import com.hemoglobin.entities.Status;

public interface StatusRepository {

	List<Status> findAll();

	Status findById(int id);

	Status findByDescription(String code);

	Status create(Status state);

	Status update(Status state);

	void delete(Status existing);

}
