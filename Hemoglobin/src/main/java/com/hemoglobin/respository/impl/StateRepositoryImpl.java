package com.hemoglobin.respository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.hemoglobin.entities.State;
import com.hemoglobin.respository.StateRepository;

@Repository
public class StateRepositoryImpl implements StateRepository {

	@PersistenceContext
	private EntityManager entityManager;

	public List<State> findAll() {
		TypedQuery<State> query = entityManager.createNamedQuery("State.findAll", State.class);
		return query.getResultList();
	}

	public State findByCode(String code) {
		TypedQuery<State> query = entityManager.createNamedQuery("State.findByCode", State.class);
		query.setParameter("codeAttr", code);
		List<State> states = query.getResultList();
		if (states != null && states.size() == 1) {
			return states.get(0);
		}
		return null;
	}

	public State findById(int id) {
		return entityManager.find(State.class, id);
	}

	public State create(State state) {
		entityManager.persist(state);
		return state;
	}

	public State update(State state) {
		return entityManager.merge(state);
	}

	public void delete(State state) {
		entityManager.remove(state);
	}

}
