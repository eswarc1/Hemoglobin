package com.hemoglobin.exceptions;

public class BloodRequestException extends Exception {

	private static final long serialVersionUID = 1L;

	public BloodRequestException() {
		super();
	}

	public BloodRequestException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public BloodRequestException(String message, Throwable cause) {
		super(message, cause);
	}

	public BloodRequestException(String message) {
		super(message);
	}

	public BloodRequestException(Throwable cause) {
		super(cause);
	}

}
