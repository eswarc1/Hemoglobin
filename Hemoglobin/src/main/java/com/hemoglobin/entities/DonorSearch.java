package com.hemoglobin.entities;

public class DonorSearch {
	private String name;
	private String email;
	private String phoneNumber;
	private String bloodGroup;
	private String status;
	private String city;
	private String state;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public boolean search(Donor donor) {

		if (!(this.name == null || this.name.equals(""))) {
			String[] names = this.name.split(" ");
			boolean nameFound = false;
			if (names.length == 2
					&& (names[0].trim().equalsIgnoreCase(donor.getUser().getFirstName().trim())
							&& names[1].trim().equalsIgnoreCase(donor.getUser().getLastName().trim()))
					|| (names[0].trim().equalsIgnoreCase(donor.getUser().getLastName().trim())
							&& names[1].trim().equalsIgnoreCase(donor.getUser().getFirstName().trim())))
				nameFound = true;

			if ((names.length == 1 || names.length > 2)
					&& (names[0].trim().equalsIgnoreCase(donor.getUser().getFirstName().trim())
							|| names[0].trim().equalsIgnoreCase(donor.getUser().getLastName().trim())))
				nameFound = true;

			if (!nameFound)
				return false;

		}

		if (!(this.bloodGroup == null || this.bloodGroup.equals(""))) {
			if (!(donor.getBloodGroup().trim().equalsIgnoreCase(this.bloodGroup.trim())))
				return false;
		}

		if (!(this.email == null || this.email.equals(""))) {
			if (!(donor.getUser().getEmail().trim().equalsIgnoreCase(this.email.trim())))
				return false;
		}

		if (!(this.phoneNumber == null || this.phoneNumber.equals(""))) {
			if (!(donor.getUser().getPhone().trim().equalsIgnoreCase(this.phoneNumber.trim())))
				return false;
		}

		if (!(this.status == null || this.status.equals(""))) {
			if (!(donor.getStatus().getDescription().trim().equalsIgnoreCase(this.status.trim())))
				return false;
		}

		if (!(this.state == null || this.state.equals(""))) {
			if (!(donor.getUserAddress().getState().getDescription().trim().equalsIgnoreCase(this.state.trim())))
				return false;
		}

		if (!(this.city == null || this.city.equals(""))) {
			if (!(donor.getUserAddress().getCity().trim().equalsIgnoreCase(this.city.trim())))
				return false;
		}

		return true;
	}

	public boolean isEmpty() {
		if ((this.name == null || this.name.equals("")) && (this.bloodGroup == null || this.bloodGroup.equals(""))
				&& (this.email == null || this.email.equals(""))
				&& (this.phoneNumber == null || this.phoneNumber.equals(""))
				&& (this.status == null || this.status.equals("")) && (this.state == null || this.state.equals(""))
				&& (this.city == null || this.city.equals("")))
			return true;
		else
			return false;
	}

}
