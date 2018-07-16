package com.hemoglobin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hemoglobin.entities.Assignment;
import com.hemoglobin.entities.BloodGroup;
import com.hemoglobin.entities.BloodRequest;
import com.hemoglobin.entities.Status;
import com.hemoglobin.entities.User;
import com.hemoglobin.exceptions.BloodRequestException;
import com.hemoglobin.exceptions.StateException;
import com.hemoglobin.exceptions.UrgencyLevelException;
import com.hemoglobin.service.BloodRequestService;
import com.hemoglobin.service.StateService;
import com.hemoglobin.service.UrgencyLevelService;

@Controller
@RequestMapping(path = "requests")
public class BloodRequestController {

	@Autowired
	private BloodRequestService service;

	@Autowired
	private HttpSession session;

	@Autowired
	private StateService stateService;

	@Autowired
	private UrgencyLevelService urgencyLevelService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showAllBloodRequestsForUser() {
		ModelAndView modelAndView = new ModelAndView();
		try {
			modelAndView.setViewName("bloodRequests");
			User user = (User) session.getAttribute("user");
			modelAndView.addObject("requests", service.findByUser(user.getUserId()));
		} catch (BloodRequestException e) {
			e.printStackTrace();
		}
		return modelAndView;
	}

	@RequestMapping(path = "all", method = RequestMethod.GET)
	public ModelAndView showAllBloodRequests() {
		ModelAndView modelAndView = new ModelAndView();
		try {
			modelAndView.setViewName("bloodRequests");
			modelAndView.addObject("requests", service.findAll());
			modelAndView.addObject("assignment",new Assignment());
		} catch (BloodRequestException e) {
			e.printStackTrace();
		}
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET, path = "{id}")
	public ModelAndView showBloodRequestById(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView();
		BloodRequest request = null;
		try {
			request = service.findById(id);
			modelAndView.addObject("request", request);
			modelAndView.setViewName("editBloodRequest");
			modelAndView.addObject("bloodGroups", BloodGroup.values());
			try {
				modelAndView.addObject("states", stateService.findAll());
			} catch (StateException e) {
				e.printStackTrace();
			}
			try {
				modelAndView.addObject("urgencyLevels", urgencyLevelService.findAll());
			} catch (UrgencyLevelException e) {
				e.printStackTrace();
			}
		} catch (BloodRequestException e) {
			e.printStackTrace();
		}
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView createBloodRequest(@ModelAttribute BloodRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("home");
		try {
			User user = (User) session.getAttribute("user");
			Status status = new Status(1);
			request.setUser(user);
			request.setStatus(status);
			service.create(request);
			modelAndView.addObject("successMessage", "Your request has been submitted");
		} catch (BloodRequestException e) {
			modelAndView.addObject("failureMessage", "unable process your request");
			e.printStackTrace();
		}
		modelAndView.addObject("request", new BloodRequest());
		modelAndView.addObject("bloodGroups", BloodGroup.values());
		try {
			modelAndView.addObject("states", stateService.findAll());
		} catch (StateException e) {
			e.printStackTrace();
			modelAndView.addObject("failureMessage", "Unable to populate states");
		}
		try {
			modelAndView.addObject("urgencyLevels", urgencyLevelService.findAll());
		} catch (UrgencyLevelException e) {
			e.printStackTrace();
			modelAndView.addObject("failureMessage", "Unable to populate urgencyLevels");
		}

		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST, path = "edit/{id}")
	public ModelAndView updateBloodRequest(@PathVariable("id") int id, @ModelAttribute BloodRequest request) {
		ModelAndView modelAndView = null;
		try {
			service.update(id, request);
			modelAndView = new ModelAndView("redirect:/requests");
			modelAndView.addObject("successMessage", "Your request has been Updated");
		} catch (BloodRequestException e) {
			modelAndView = new ModelAndView();
			modelAndView.addObject("failureMessage", "unable to update your request");
			e.printStackTrace();
		}
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(produces = { MediaType.APPLICATION_JSON_VALUE }, method = RequestMethod.POST, path = "delete/{id}")
	public List<BloodRequest> deleteBloodRequest(@PathVariable("id") int id) {
		User user = (User) session.getAttribute("user");
		List<BloodRequest> bloodRequests = null;
		try {
			service.delete(id);
			if (user.getUserrole().getRoleId() == 3)
				bloodRequests = service.findAll();
			else
				bloodRequests = service.findByUser(user.getUserId());
		} catch (BloodRequestException e) {
			e.printStackTrace();
		}
		return bloodRequests;
	}

}
