package com.hemoglobin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hemoglobin.entities.Assignment;
import com.hemoglobin.entities.Donor;
import com.hemoglobin.entities.User;
import com.hemoglobin.exceptions.AssignmentException;
import com.hemoglobin.service.AssignmentService;
import com.hemoglobin.service.DonorService;

@Controller
@RequestMapping(path = "assignments")
public class AssignmentController {

	@Autowired
	private AssignmentService assignmentService;

	@Autowired
	private DonorService donorService;

	@Autowired
	private HttpSession session;

	@ResponseBody
	@RequestMapping(consumes = { MediaType.APPLICATION_JSON_VALUE }, produces = {
			MediaType.APPLICATION_JSON_VALUE }, method = RequestMethod.POST)
	public Assignment search(@RequestBody Assignment assignment) {
		Assignment assignmentFromDB = null;
		System.out.println(assignment.toString());
		try {
			assignmentFromDB = assignmentService.create(assignment);
		} catch (AssignmentException e) {
			e.printStackTrace();
		}
		return assignmentFromDB;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showAllAssignments() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("assignments");
		try {
			User user = (User) session.getAttribute("user");
			if (user.getUserrole().getRoleId() == 2) {
				Donor donor = donorService.getDonarByUserId(user.getUserId());
				modelAndView.addObject("assignments", assignmentService.findByDonorId(donor.getDonorId()));
			} else if (user.getUserrole().getRoleId() == 3)
				modelAndView.addObject("assignments", assignmentService.findAll());
		} catch (AssignmentException e) {
			e.printStackTrace();
		}
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET, path = "{id}")
	public ModelAndView getAssignmentById(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			modelAndView.setViewName("assignmentEdit");
			modelAndView.addObject("assignment", assignmentService.findById(id));
		} catch (AssignmentException e) {
			e.printStackTrace();
		}
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST, path = "{id}")
	public ModelAndView updateAssignment(@PathVariable("id") int id, @ModelAttribute Assignment assignment) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			modelAndView.setViewName("assignmentEdit");
			Assignment assignmentFromDB = assignmentService.update(id, assignment);
			modelAndView.addObject("assignment", assignmentFromDB);
			modelAndView.addObject("successMessage", "Assignment has been updated");
		} catch (AssignmentException e) {
			modelAndView.addObject("failureMessage", "Unable to update request");
			e.printStackTrace();
		}
		return modelAndView;
	}
}
