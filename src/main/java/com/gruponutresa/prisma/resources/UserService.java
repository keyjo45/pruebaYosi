package com.gruponutresa.prisma.resources;


import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.slf4j.LoggerFactory;

import javax.inject.Inject;
import com.gruponutresa.prisma.bean.Security;
import com.gruponutresa.prisma.business.UserBusiness;
import com.gruponutresa.prisma.dto.LoginRequest;
import com.gruponutresa.prisma.exception.LoginException;
import com.gruponutresa.prisma.models.User;
import com.gruponutresa.prisma.util.Encrypt;

import ch.qos.logback.classic.Logger;

@Path("/user")
public class UserService {

	private static final Logger LOGGER = (Logger) LoggerFactory.getLogger(UserService.class);

	@Inject
	private UserBusiness userBusiness;

	@Inject
	private Security security;

	@POST
	@Path("/add")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String addUser(User user){

		String pass = user.getPassword();
		String hash = Encrypt.encryptPassword(pass);

		user.setPassword(hash);
		user.setUser(user.getUser());
		user.setIdRole(user.getIdRole());

		return userBusiness.addUser(user);
	}

	@POST
	@Path("/login")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public User login(LoginRequest request){

		try {
			return security.login(request.getUserName(), request.getPassword());
		} catch (Exception e) {
			LOGGER.info("No hay datos registrados, con el usuario consultado..." + e);
			throw new LoginException(e, "Credenciales no validas...");
		}
	}
}
