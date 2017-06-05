package com.gruponutresa.prisma.business;



import javax.inject.Inject;
import com.google.inject.persist.Transactional;
import com.gruponutresa.prisma.dao.UserDao;
import com.gruponutresa.prisma.models.User;


public class UserBusiness {
	
	@Inject
	private UserDao userDao;
	
	
	@Transactional
	public String addUser(User user){
		
		String message;
		
		User userObtained=userDao.consultUserByUserName(user.getUser());
		
		
		if(userObtained.getId()==0){
			
			userDao.saveUser(user);
			System.out.println("Entro aqui");
			message="Usuario Ingresado Exitosamente...!!!";
		}else{
			message="Usuario ya Existe...";
		}
		
		return message;
		
	}
}
