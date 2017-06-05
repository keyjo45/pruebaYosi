package com.gruponutresa.prisma.exception;

import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

@Provider
public class AppExceptionMapper implements ExceptionMapper<RuntimeException>{
	
	@Override
	public Response toResponse(RuntimeException exception) {
		return Response.status(Status.INTERNAL_SERVER_ERROR)
				.header("ERR_MSG", exception.getMessage()).build();
	}

}
