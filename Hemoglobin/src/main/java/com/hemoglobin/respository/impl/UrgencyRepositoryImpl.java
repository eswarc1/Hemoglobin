package com.hemoglobin.respository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.hemoglobin.entities.UrgencyLevel;
import com.hemoglobin.respository.UrgencyLevelRepository;

@Repository
public class UrgencyRepositoryImpl implements UrgencyLevelRepository {

	@PersistenceContext
	private EntityManager entityManager;

	public List<UrgencyLevel> findAll() {
		TypedQuery<UrgencyLevel> query = entityManager.createNamedQuery("UrgencyLevel.findAll", UrgencyLevel.class);
		return query.getResultList();
	}

	public UrgencyLevel findByUrgency(String urgency) {
		TypedQuery<UrgencyLevel> query = entityManager.createNamedQuery("UrgencyLevel.findByUrgency", UrgencyLevel.class);
		query.setParameter("urgencyAttr", urgency);
		List<UrgencyLevel> urgencyLevels = query.getResultList();
		if (urgencyLevels != null && urgencyLevels.size() == 1) {
			return urgencyLevels.get(0);
		}
		return null;
	}

	public UrgencyLevel findById(int id) {
		return entityManager.find(UrgencyLevel.class, id);
	}

	public UrgencyLevel create(UrgencyLevel urgencyLevel) {
		entityManager.persist(urgencyLevel);
		return urgencyLevel;
	}

	public UrgencyLevel update(UrgencyLevel urgencyLevel) {
		return entityManager.merge(urgencyLevel);
	}

	public void delete(UrgencyLevel urgencyLevel) {
		entityManager.remove(urgencyLevel);
	}

}
