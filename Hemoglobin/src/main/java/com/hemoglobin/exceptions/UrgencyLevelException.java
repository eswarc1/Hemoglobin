package com.hemoglobin.exceptions;

public class UrgencyLevelException extends Exception {

	private static final long serialVersionUID = 1L;

	public UrgencyLevelException() {
		super();
	}

	public UrgencyLevelException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public UrgencyLevelException(String message, Throwable cause) {
		super(message, cause);
	}

	public UrgencyLevelException(String message) {
		super(message);
	}

	public UrgencyLevelException(Throwable cause) {
		super(cause);
	}

}
