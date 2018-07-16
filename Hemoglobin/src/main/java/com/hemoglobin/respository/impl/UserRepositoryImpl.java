package com.hemoglobin.respository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.hemoglobin.entities.User;
import com.hemoglobin.respository.UserRepository;

@Repository
public class UserRepositoryImpl implements UserRepository {

	@PersistenceContext
	private EntityManager entityManager;

	public List<User> findAll() {
		TypedQuery<User> query = entityManager.createNamedQuery("User.findAll", User.class);
		return query.getResultList();
	}

	public User findById(int id) {
		return entityManager.find(User.class, id);
	}

	public User findByEmail(String email) {
		TypedQuery<User> query = entityManager.createNamedQuery("User.findByEmail", User.class);
		query.setParameter("emailAttr", email);
		List<User> Users = query.getResultList();
		if (Users != null && Users.size() == 1) {
			return Users.get(0);
		}
		return null;
	}

	public User create(User user) {
		entityManager.persist(user);
		entityManager.flush();
		return user;
	}

	public User update(User user) {
		return entityManager.merge(user);
	}

	public void delete(User user) {
		entityManager.remove(user);
	}
}
