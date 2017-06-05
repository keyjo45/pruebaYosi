package com.gruponutresa.prisma.bean;

import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import javax.inject.Inject;
import com.gruponutresa.prisma.dao.UserDao;
import com.gruponutresa.prisma.models.User;
import com.gruponutresa.prisma.util.Encrypt;

public class Security {

	@Inject
	private UserDao userDao;

	private User userConsult;

	private static final Map<String, User> activeAutorizations = new ConcurrentHashMap<>();

	public User login(String userName, String password){

		User user = null;
		if (checkUser(password, userName)){
			user = generateToken();
		}
		return user;
	}

	public boolean checkUser(String password, String userName){

		String passwordEncrypt = Encrypt.encryptPassword(password);
		
		boolean check = true;

		userConsult = userDao.consultUserByUserAndPassword(userName, passwordEncrypt);
		
		if(userConsult.getUser()==null){
			check= false;
		}
		return check;
	}

	private User generateToken() {

		final String token = UUID.randomUUID().toString();
		final User user = userConsult;
		user.setToken(token);
		activeAutorizations.put(token, user);
		return user;

	}

	public User loguot(String token) {
		return activeAutorizations.remove(token);
	}

}
