package com.hemoglobin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hemoglobin.entities.User;
import com.hemoglobin.exceptions.UserAlreadyExistsException;
import com.hemoglobin.exceptions.UserNotFoundException;
import com.hemoglobin.service.UserService;

@RestController
@CrossOrigin
@RequestMapping(path = "users")
public class UserController {

	@Autowired
	private UserService service;

	@RequestMapping(method = RequestMethod.GET)
	public List<User> showAllUsers() {
		try {
			return service.findAll();
		} catch (UserNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(method = RequestMethod.GET, path = "{id}")
	public User ShowUserById(@PathVariable("id") int id) {
		User user = null;
		try {
			user = service.findById(id);
		} catch (UserNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	@RequestMapping(method = RequestMethod.POST)
	public User createUser(@RequestBody User user) {
		User result = null;
		try {
			result = service.create(user);
		} catch (UserAlreadyExistsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(method = RequestMethod.PUT, path = "{id}")
	public User updateUser(@PathVariable("id") int id, @RequestBody User user) {
		User result = null;
		try {
			result = service.update(id, user);
		} catch (UserNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(method = RequestMethod.DELETE, path = "{id}")
	public void deleteUser(@PathVariable("id") int id) {
		try {
			service.delete(id);
		} catch (UserNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}