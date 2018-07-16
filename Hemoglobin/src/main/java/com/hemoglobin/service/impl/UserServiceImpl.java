package com.hemoglobin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hemoglobin.entities.User;
import com.hemoglobin.entities.UserRole;
import com.hemoglobin.exceptions.UserAlreadyExistsException;
import com.hemoglobin.exceptions.UserNotFoundException;
import com.hemoglobin.respository.UserRepository;
import com.hemoglobin.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository repository;

	public List<User> findAll() throws UserNotFoundException{
		List<User> users = repository.findAll();
		if (users != null && users.size() > 0)
			return users;
		else
			throw new UserNotFoundException("No users found ");
	}

	public User findById(int id) throws UserNotFoundException {
		User user = repository.findById(id);
		if (user == null) {
			throw new UserNotFoundException("User with id:" + id + " not found");
		}
		return user;
	}

	@Override
	public User findUserByEmail(String email) throws UserNotFoundException {
		User user = repository.findByEmail(email);
		if (user == null) {
			throw new UserNotFoundException("User with user name:" + email + " not found");
		}
		return user;
	}

	@Transactional
	public User create(User user) throws UserAlreadyExistsException {
		User userInDB = repository.findByEmail(user.getEmail());
		if (userInDB != null) {
			throw new UserAlreadyExistsException("Email is already in use: " + user.getEmail());
		}
		user.setUserrole(new UserRole(1));
		return repository.create(user);
	}

	@Transactional
	public User update(int id, User emp) throws UserNotFoundException {
		User userInDB = repository.findById(id);
		if (userInDB == null) {
			throw new UserNotFoundException("User with id:" + id + " not found");
		}
		return repository.update(emp);
	}

	@Transactional
	public void delete(int id) throws UserNotFoundException {
		User userInDB = repository.findById(id);
		if (userInDB == null) {
			throw new UserNotFoundException("User with id:" + id + " not found");
		}
		repository.delete(userInDB);
	}

}
