package com.hemoglobin.exceptions;

public class StateException extends Exception {

	private static final long serialVersionUID = 1L;

	public StateException() {
		super();
	}

	public StateException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public StateException(String message, Throwable cause) {
		super(message, cause);
	}

	public StateException(String message) {
		super(message);
	}

	public StateException(Throwable cause) {
		super(cause);
	}

}
