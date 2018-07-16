package com.hemoglobin.exceptions;

public class StatusException extends Exception {

	private static final long serialVersionUID = 1L;

	public StatusException() {
		super();
	}

	public StatusException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public StatusException(String message, Throwable cause) {
		super(message, cause);
	}

	public StatusException(String message) {
		super(message);
	}

	public StatusException(Throwable cause) {
		super(cause);
	}

}
