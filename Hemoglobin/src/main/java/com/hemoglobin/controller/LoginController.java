package com.hemoglobin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hemoglobin.entities.User;
import com.hemoglobin.exceptions.UserAlreadyExistsException;
import com.hemoglobin.exceptions.UserNotFoundException;
import com.hemoglobin.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService service;
	@Autowired
	private HttpSession session;

	@RequestMapping(path = "login", method = RequestMethod.GET)
	public ModelAndView showlogin() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login");
		modelAndView.addObject("user", new User());
		return modelAndView;
	}

	@RequestMapping(path = "login", method = RequestMethod.POST)
	public ModelAndView dologin(@ModelAttribute User user) {
		ModelAndView modelAndView = null;
		User userFromDB = null;
		try {
			userFromDB = service.findUserByEmail(user.getEmail());
		} catch (UserNotFoundException e) {
			e.printStackTrace();
		}
		if (userFromDB != null && userFromDB.getPassword().equals(user.getPassword())) {
			session.setAttribute("user", userFromDB);
			if (userFromDB.getUserrole().getRoleId() == 3)
				modelAndView = new ModelAndView("redirect:/donors/dashboard");
			else
				modelAndView = new ModelAndView("redirect:/");
		} else {
			modelAndView = new ModelAndView();
			modelAndView.setViewName("login");
			modelAndView.addObject("loginFailureMessage", "Username or Password is wrong!!");
		}
		return modelAndView;
	}

	@RequestMapping(path = "logout", method = RequestMethod.GET)
	public ModelAndView dologout() {
		session.removeAttribute("user");
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(path = "register", method = RequestMethod.POST)
	public ModelAndView doRegistraction(@ModelAttribute(name = "userReg") User user) {
		ModelAndView modelAndView = null;
		try {
			User result = service.create(user);
			session.setAttribute("user", result);
			modelAndView = new ModelAndView("redirect:/");
		} catch (UserAlreadyExistsException e) {
			modelAndView = new ModelAndView();
			modelAndView.setViewName("login");
			modelAndView.addObject("registractionFailureMessage", "Unable to register");
		}

		return modelAndView;
	}
}
