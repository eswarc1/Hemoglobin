package com.hemoglobin.service;

import java.util.List;

import com.hemoglobin.entities.State;
import com.hemoglobin.exceptions.StateException;

public interface StateService {

	List<State> findAll() throws StateException;

	State findById(int id) throws StateException;

	State create(State state) throws StateException;

	State update(int id, State state) throws StateException;

	void delete(int id) throws StateException;

}
