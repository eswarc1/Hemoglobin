package com.hemoglobin.respository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.hemoglobin.entities.Assignment;
import com.hemoglobin.respository.AssignmentRepository;

@Repository
public class AssignmentRepositoryImpl implements AssignmentRepository {

	@PersistenceContext
	private EntityManager entityManager;

	public List<Assignment> findAll() {
		TypedQuery<Assignment> query = entityManager.createNamedQuery("Assignment.findAll", Assignment.class);
		return query.getResultList();
	}

	@Override
	public List<Assignment> findByDonorId(int donorId) {
		TypedQuery<Assignment> query = entityManager.createNamedQuery("Assignment.findByDonorId", Assignment.class);
		query.setParameter("donorIdAttr", donorId);
		List<Assignment> assignments = query.getResultList();
		if (assignments != null && assignments.size() > 0) {
			return assignments;
		}
		return null;
	}

	public Assignment findById(int id) {
		return entityManager.find(Assignment.class, id);
	}

	public Assignment create(Assignment assignment) {
		entityManager.persist(assignment);
		return assignment;
	}

	public Assignment update(Assignment assignment) {
		return entityManager.merge(assignment);
	}

	public void delete(Assignment assignment) {
		entityManager.remove(assignment);
	}

}
