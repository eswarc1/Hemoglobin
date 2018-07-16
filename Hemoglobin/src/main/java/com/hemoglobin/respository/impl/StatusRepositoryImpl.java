package com.hemoglobin.respository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.hemoglobin.entities.Status;
import com.hemoglobin.respository.StatusRepository;

@Repository
public class StatusRepositoryImpl implements StatusRepository {

	@PersistenceContext
	private EntityManager entityManager;

	public List<Status> findAll() {
		TypedQuery<Status> query = entityManager.createNamedQuery("Status.findAll", Status.class);
		return query.getResultList();
	}

	public Status findByDescription(String description) {
		TypedQuery<Status> query = entityManager.createNamedQuery("Status.findByDescription", Status.class);
		query.setParameter("descAttr", description);
		List<Status> sList = query.getResultList();
		if (sList != null && sList.size() == 1) {
			return sList.get(0);
		}
		return null;
	}

	public Status findById(int id) {
		return entityManager.find(Status.class, id);
	}

	public Status create(Status status) {
		entityManager.persist(status);
		entityManager.flush();
		return status;
	}

	public Status update(Status status) {
		return entityManager.merge(status);
	}

	public void delete(Status status) {
		entityManager.remove(status);
	}

}
