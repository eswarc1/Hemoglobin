package com.hemoglobin.exceptions;

public class DonorException extends Exception {

	private static final long serialVersionUID = 1L;

	public DonorException() {
		super();
	}

	public DonorException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public DonorException(String message, Throwable cause) {
		super(message, cause);
	}

	public DonorException(String message) {
		super(message);
	}

	public DonorException(Throwable cause) {
		super(cause);
	}

}
