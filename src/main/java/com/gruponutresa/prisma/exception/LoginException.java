package com.gruponutresa.prisma.exception;

@SuppressWarnings("serial")
public class LoginException extends RuntimeException {

	public LoginException(Throwable throwlable, String message){
		super(message, throwlable);
	}

}
