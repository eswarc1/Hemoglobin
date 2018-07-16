package com.hemoglobin.service;

import java.util.List;

import com.hemoglobin.entities.User;
import com.hemoglobin.exceptions.UserAlreadyExistsException;
import com.hemoglobin.exceptions.UserNotFoundException;

public interface UserService {

	List<User> findAll() throws UserNotFoundException;

	User findById(int id) throws UserNotFoundException;
	
	User findUserByEmail(String email) throws UserNotFoundException;

	User create(User usr) throws UserAlreadyExistsException;

	User update(int id, User usr) throws UserNotFoundException;

	void delete(int id) throws UserNotFoundException;
}
