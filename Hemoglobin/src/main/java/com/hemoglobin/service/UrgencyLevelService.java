package com.hemoglobin.service;

import java.util.List;

import com.hemoglobin.entities.UrgencyLevel;
import com.hemoglobin.exceptions.UrgencyLevelException;



public interface UrgencyLevelService {

	List<UrgencyLevel> findAll() throws UrgencyLevelException;

	UrgencyLevel findById(int id) throws UrgencyLevelException;

	UrgencyLevel create(UrgencyLevel state) throws UrgencyLevelException;

	UrgencyLevel update(int id, UrgencyLevel state) throws UrgencyLevelException;

	void delete(int id) throws UrgencyLevelException;

}
