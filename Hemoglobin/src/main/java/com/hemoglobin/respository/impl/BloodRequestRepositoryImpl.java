package com.hemoglobin.respository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.hemoglobin.entities.BloodRequest;
import com.hemoglobin.respository.BloodRequestRepository;

@Repository
public class BloodRequestRepositoryImpl implements BloodRequestRepository {

	@PersistenceContext
	private EntityManager entityManager;

	public List<BloodRequest> findAll() {
		TypedQuery<BloodRequest> query = entityManager.createNamedQuery("BloodRequest.findAll", BloodRequest.class);
		return query.getResultList();
	}

	public BloodRequest findById(int id) {
		return entityManager.find(BloodRequest.class, id);
	}

	public BloodRequest create(BloodRequest request) {
		entityManager.persist(request);
		return request;
	}

	public BloodRequest update(BloodRequest request) {
		return entityManager.merge(request);
	}

	public void delete(BloodRequest request) {
		entityManager.remove(request);
	}

	@Override
	public List<BloodRequest> findByUserId(int userId) {
		TypedQuery<BloodRequest> query = entityManager.createNamedQuery("BloodRequest.findByUserId", BloodRequest.class);
		query.setParameter("userIdAttr", userId);
		List<BloodRequest> bloodRequests = query.getResultList();
		if (bloodRequests != null && bloodRequests.size()> 0) {
			return bloodRequests;
		}
		return null;
	}
}
