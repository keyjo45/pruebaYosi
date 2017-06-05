package com.gruponutresa.prisma.dao;
import javax.inject.Inject;
import javax.inject.Provider;
import javax.inject.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.slf4j.LoggerFactory;
import com.google.inject.persist.Transactional;
import com.gruponutresa.prisma.models.User;
import ch.qos.logback.classic.Logger; 

@Singleton
public class UserDao {

	private static final Logger LOGGER = (Logger) LoggerFactory.getLogger(UserDao.class);
	
	@Inject
    protected Provider<EntityManager> entityManager;

	@Transactional
	public void saveUser(User user) {
		System.out.println("entro a guardar "+entityManager+ " Usuario: "+user.getUser());
		entityManager.get().persist(user);
		
	}

	public User consultUserByUserName(String user) {

		User usuario = new User();

		try {
			Query query = entityManager.get().createNativeQuery("SELECT u.* FROM usuario u WHERE UPPER(usuario) LIKE UPPER(?)",
					User.class);
			query.setParameter(1, user);

			usuario = (User) query.getSingleResult();
		} catch (Exception e) {
			LOGGER.info("Usuario: No hay datos registrados con el usuario consultado..." + e);
		}
		
		System.out.println("Este es el id del usuario: "+usuario.getId());
		
		
		return usuario;

	}

	public User consultUserByUserAndPassword(String user, String password) {
		
		System.out.println("entitny "+entityManager);

		Query query = entityManager.get().createNativeQuery(
				"SELECT u.* FROM usuario u WHERE u.usuario LIKE ? AND u.contrasena LIKE ?", User.class);
		query.setParameter(1, user);
		query.setParameter(2, password);

		return (User) query.getSingleResult();
	}
}
