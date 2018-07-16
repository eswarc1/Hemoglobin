package com.hemoglobin.respository;

import java.util.List;

import com.hemoglobin.entities.State;

public interface StateRepository {

	List<State> findAll();

	State findById(int id);

	State findByCode(String code);

	State create(State state);

	State update(State state);

	void delete(State existing);

}
