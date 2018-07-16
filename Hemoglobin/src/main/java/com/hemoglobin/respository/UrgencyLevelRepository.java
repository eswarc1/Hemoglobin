package com.hemoglobin.respository;

import java.util.List;

import com.hemoglobin.entities.UrgencyLevel;

public interface UrgencyLevelRepository {

	List<UrgencyLevel> findAll();

	UrgencyLevel findById(int id);

	UrgencyLevel findByUrgency(String urgency);

	UrgencyLevel create(UrgencyLevel state);

	UrgencyLevel update(UrgencyLevel state);

	void delete(UrgencyLevel existing);

}
