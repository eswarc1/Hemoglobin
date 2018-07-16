package com.hemoglobin.respository;

import java.util.List;

import com.hemoglobin.entities.BloodRequest;

public interface BloodRequestRepository {

	List<BloodRequest> findAll();

	BloodRequest findById(int id);

	BloodRequest create(BloodRequest request);

	void delete(BloodRequest requestInDB);

	BloodRequest update(BloodRequest request);

	List<BloodRequest> findByUserId(int userId);

}
