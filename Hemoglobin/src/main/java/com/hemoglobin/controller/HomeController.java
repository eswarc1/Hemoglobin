package com.hemoglobin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hemoglobin.entities.BloodGroup;
import com.hemoglobin.entities.BloodRequest;
import com.hemoglobin.entities.User;
import com.hemoglobin.exceptions.StateException;
import com.hemoglobin.exceptions.UrgencyLevelException;
import com.hemoglobin.service.StateService;
import com.hemoglobin.service.UrgencyLevelService;

@Controller
public class HomeController {

	@Autowired
	private StateService stateService;
	
	@Autowired
	private UrgencyLevelService urgencyLevelService;
	
	@Autowired
	private HttpSession session;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showHomePage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("home");
		User user = (User) session.getAttribute("user");
		if(user!=null&&user.getUserrole().getRoleId()==3)
			return new ModelAndView("redirect:/donors/dashboard");
		modelAndView.addObject("request", new BloodRequest());
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
		return modelAndView;
	}

}
