package com.hemoglobin.respository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.hemoglobin.entities.Donor;
import com.hemoglobin.respository.DonorRepository;

@Repository
public class DonorRepositoryImpl implements DonorRepository {

	@PersistenceContext
	private EntityManager entityManager;

	public List<Donor> findAll() {
		TypedQuery<Donor> query = entityManager.createNamedQuery("Donor.findAll", Donor.class);
		return query.getResultList();
	}

	public Donor findById(int id) {
		return entityManager.find(Donor.class, id);
	}

	public Donor create(Donor donor) {
		entityManager.persist(donor);
		return donor;
	}

	public Donor update(Donor donor) {
		return entityManager.merge(donor);
	}

	public void delete(Donor donor) {
		entityManager.remove(donor);
	}

	@Override
	public Donor findByUserId(int userId) {
		TypedQuery<Donor> query = entityManager.createNamedQuery("Donor.findByUserId", Donor.class);
		query.setParameter("userIdAttr", userId);
		List<Donor> donors = query.getResultList();
		if (donors != null && donors.size() == 1) {
			return donors.get(0);
		}
		return null;
	}

	@Override
	public List<Donor> findByStatusId(int statusId) {
		TypedQuery<Donor> query = entityManager.createNamedQuery("Donor.findByStatusId", Donor.class);
		query.setParameter("statusIdAttr", statusId);
		List<Donor> donors = query.getResultList();
		if (donors != null && donors.size() > 0) {
			return donors;
		}
		return null;
	}

}
