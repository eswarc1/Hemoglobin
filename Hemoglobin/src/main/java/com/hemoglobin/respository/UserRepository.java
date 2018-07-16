package com.hemoglobin.respository;

import java.util.List;

import com.hemoglobin.entities.User;


public interface UserRepository {
	List<User> findAll();

	User findById(int id);

	User findByEmail(String email);

	User create(User emp);

	User update(User emp);

	void delete(User existing);
}
