package com.hemoglobin.controller;

import java.util.List;

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

import com.hemoglobin.entities.BloodGroup;
import com.hemoglobin.entities.Donor;
import com.hemoglobin.entities.DonorSearch;
import com.hemoglobin.entities.Status;
import com.hemoglobin.entities.User;
import com.hemoglobin.exceptions.DonorException;
import com.hemoglobin.exceptions.StateException;
import com.hemoglobin.exceptions.StatusException;
import com.hemoglobin.service.DonorService;
import com.hemoglobin.service.StateService;
import com.hemoglobin.service.StatusService;

@Controller
@RequestMapping(path = "donors")
public class DonarController {

	@Autowired
	private DonorService donorService;

	@Autowired
	private StateService stateService;

	@Autowired
	private StatusService statusService;

	@Autowired
	private HttpSession session;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showDonorRegistration() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("donorReg");
		User user = (User) session.getAttribute("user");
		Donor donor = donorService.getDonarByUserId(user.getUserId());
		modelAndView.addObject("donor", donor != null ? donor : new Donor());
		modelAndView.addObject("bloodGroups", BloodGroup.values());
		try {
			modelAndView.addObject("states", stateService.findAll());
		} catch (StateException e) {
			modelAndView.addObject("failureMessage", "Unable to populate states");
			e.printStackTrace();
		}
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView registerDonor(@ModelAttribute(name = "donor") Donor donor) {
		ModelAndView modelAndView = new ModelAndView();
		Donor donorFromDB = null;
		try {
			if (donor.getDonorId() != 0) {
				System.out.println(donor.toString());
				donorFromDB = donorService.updateDonor(donor.getDonorId(), donor);
				modelAndView.addObject("donorRegSuccessMsg", "Your Request has been Updated");
			} else {
				System.out.println(donor.toString());
				User user = (User) session.getAttribute("user");
				user.getUserrole().setRoleId(2);
				Status status = new Status(1);
				donor.setStatus(status);
				donor.setUser(user);
				donorFromDB = donorService.register(donor);
				modelAndView.addObject("donorRegSuccessMsg", "Your Request has been submitted");
			}
			modelAndView.setViewName("donorReg");
			modelAndView.addObject("donor", donorFromDB);

		} catch (DonorException e) {
			modelAndView.addObject("donorRegFailureMsg", "Unable to process your request at this time");
			e.printStackTrace();
		}
		modelAndView.addObject("bloodGroups", BloodGroup.values());
		try {
			modelAndView.addObject("states", stateService.findAll());
		} catch (StateException e) {
			modelAndView.addObject("failureMessage", "Unable to populate states");
			e.printStackTrace();
		}
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.PUT)
	public ModelAndView deRegisterDonor(@ModelAttribute Donor donor) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			donorService.deregister(donor);
		} catch (DonorException e) {
			e.printStackTrace();
		}
		return modelAndView;

	}

	@RequestMapping(path = "{id}", method = RequestMethod.GET)
	public ModelAndView showDonorById(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			modelAndView.setViewName("donorInformation");
			Donor donor = donorService.getDonarById(id);
			if (donor.getStatus().getStatusId() == 1) {
				donor.setStatus(new Status(2));
				donor = donorService.updateDonor(id, donor);
			}
			modelAndView.addObject("donor", donorService.getDonarById(id));
		} catch (DonorException e) {
			modelAndView.setViewName("donorRequests");
			modelAndView.addObject("donorErrorMessage", "Unable to find donor with id : " + id);
		}
		modelAndView.addObject("bloodGroups", BloodGroup.values());
		try {
			modelAndView.addObject("states", stateService.findAll());
		} catch (StateException e) {
			modelAndView.addObject("failureMessage", "Unable to populate states");
			e.printStackTrace();
		}
		return modelAndView;

	}

	@RequestMapping(method = RequestMethod.POST, path = "{id}")
	public ModelAndView updateDonorInfo(@PathVariable("id") int id, @ModelAttribute Donor donor) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("donorInformation");
		try {
			System.out.println(donor.toString());
			donorService.updateDonor(id, donor);
			modelAndView.addObject("successMessage", "Donor Information has been Updated");
		} catch (DonorException e) {
			modelAndView.addObject("failureMessage", "unable to update your Donor information");
			e.printStackTrace();
		}
		modelAndView.addObject("bloodGroups", BloodGroup.values());
		try {
			modelAndView.addObject("states", stateService.findAll());
		} catch (StateException e) {
			modelAndView.addObject("failureMessage", "Unable to populate states");
			e.printStackTrace();
		}
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET, path = "approve/{id}")
	public ModelAndView approveDonor(@PathVariable("id") int id) {
		ModelAndView modelAndView = null;
		try {
			Donor donor = donorService.getDonarById(id);
			donor.setStatus(new Status(3));
			donorService.updateDonor(id, donor);
			modelAndView = new ModelAndView("redirect:/donors/requests");
		} catch (DonorException e) {
			modelAndView = new ModelAndView();
			modelAndView.addObject("failureMessage", "unable to approve donor");
			e.printStackTrace();
		}
		return modelAndView;
	}

	@RequestMapping(path = "requests", method = RequestMethod.GET)
	public ModelAndView showAllDonars() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("donorRequests");
		try {
			modelAndView.addObject("donorList", donorService.getDonars());
		} catch (DonorException e) {
			e.printStackTrace();
		}
		modelAndView.addObject("bloodGroups", BloodGroup.values());
		try {
			modelAndView.addObject("statusList", statusService.findAll());
		} catch (StatusException e) {
			e.printStackTrace();
		}
		return modelAndView;

	}

	@RequestMapping(path = "dashboard", method = RequestMethod.GET)
	public ModelAndView showAllActiveDonors() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("dashboard");
		try {
			modelAndView.addObject("donorList", donorService.getDonarsByStatus(3));
		} catch (DonorException e) {
			e.printStackTrace();
		}

		modelAndView.addObject("bloodGroups", BloodGroup.values());
		try {
			modelAndView.addObject("states", stateService.findAll());
		} catch (StateException e) {
			e.printStackTrace();
		}

		return modelAndView;

	}

	@ResponseBody
	@RequestMapping(produces = { MediaType.APPLICATION_JSON_VALUE }, method = RequestMethod.POST, path = "delete/{id}")
	public List<Donor> deleteDonorRequest(@PathVariable("id") int id) {
		List<Donor> donors = null;
		try {
			donorService.delete(id);
			donors = donorService.getDonars();
		} catch (DonorException e) {
			e.printStackTrace();
		}
		return donors;
	}

	@ResponseBody
	@RequestMapping(consumes = { MediaType.APPLICATION_JSON_VALUE }, produces = {
			MediaType.APPLICATION_JSON_VALUE }, method = RequestMethod.POST, path = "search")
	public List<Donor> search(@RequestBody DonorSearch donorSearch) {
		List<Donor> donors = null;
		try {
			donors = donorService.getDonorsBySearchCriteria(donorSearch);
		} catch (DonorException e) {
			e.printStackTrace();
		}
		return donors;
	}

	@ResponseBody
	@RequestMapping(produces = {
			MediaType.APPLICATION_JSON_VALUE }, method = RequestMethod.POST, path = "loadDonors/{id}")
	public List<Donor> getDonorsForRequest(@PathVariable("id") int requestId) {
		List<Donor> donors = null;
		try {
			donors = donorService.getDonars();
		} catch (DonorException e) {
			e.printStackTrace();
		}
		return donors;
	}

}
