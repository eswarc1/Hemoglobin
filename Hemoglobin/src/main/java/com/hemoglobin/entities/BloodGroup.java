package com.hemoglobin.entities;

import java.util.HashMap;
import java.util.Map;

public enum BloodGroup {

	A_POSITIVE("A+"), A_NAGATIVE("A-"), B_POSITIVE("B+"), B_NAGATIVE("B-"), AB_POSITIVE("AB+"), AB_NAGATIVE(
			"AB-"), O_POSITIVE("O+"), O_NAGATIVE("O-");

	private final String value;

	private BloodGroup(String value) {
		this.value = value;
	}

	public String toString() {
		return value;
	}

	public static Map<String, String> getBloodGroups() {
		Map<String, String> result = new HashMap<String, String>();
		for (BloodGroup s : BloodGroup.values())
			result.put(s.toString(), s.value);
		return result;
	}

	public static String getEnumNameForValue(Object value) {
		BloodGroup[] values = BloodGroup.values();
		String enumValue = null;
		for (BloodGroup eachValue : values) {
			enumValue = eachValue.toString();

			if (enumValue.equals(value)) {
				return eachValue.name();
			}
		}
		return enumValue;
	}

}
