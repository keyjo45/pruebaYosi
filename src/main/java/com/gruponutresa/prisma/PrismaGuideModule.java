package com.gruponutresa.prisma;

import java.util.Properties;
import com.google.inject.AbstractModule;
import com.google.inject.persist.jpa.JpaPersistModule;
import com.gruponutresa.prisma.constants.ApplicationConstants;
import com.gruponutresa.prisma.dao.UserDao;
import com.gruponutresa.prisma.guice.modules.JpaInitializer;
import com.gruponutresa.prisma.resources.UserService;
import com.gruponutresa.prisma.util.ConexionHelper;
import com.hubspot.dropwizard.guice.GuiceBundle;

public class PrismaGuideModule extends AbstractModule {

	private GuiceBundle<PrismaConfiguration> guiceBundle;

	@Override
	protected void configure() {

		PrismaConfiguration configuration = ConexionHelper.createConfiguration(ConexionHelper.getConfigFilename());
		Properties jpaProperties = ConexionHelper.createPropertiesFromConfiguration(configuration);

		JpaPersistModule jpaPersistModule = new JpaPersistModule(ApplicationConstants.JPA_UNIT);
		jpaPersistModule.properties(jpaProperties);

		install(jpaPersistModule);
		bind(JpaInitializer.class).asEagerSingleton();
		bind(UserDao.class);
		bind(UserService.class);

	}

	public GuiceBundle<PrismaConfiguration> getInit() {

		guiceBundle = GuiceBundle.<PrismaConfiguration>newBuilder().addModule(new PrismaGuideModule())
				.setConfigClass(PrismaConfiguration.class).build();

		return guiceBundle;

	}

}
