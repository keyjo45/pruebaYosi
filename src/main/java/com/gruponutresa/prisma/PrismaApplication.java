package com.gruponutresa.prisma;

import java.util.EnumSet;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration.Dynamic;

import com.google.inject.servlet.GuiceFilter;
import com.gruponutresa.prisma.filter.CORSFilter;
import com.gruponutresa.prisma.util.ConexionHelper;

import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

public class PrismaApplication extends Application<PrismaConfiguration> {

	private PrismaGuideModule prismaGuideModule;
	
	

	public static void main(final String[] args) throws Exception {
		for (int i = 0; i < args.length; i++) {
			if (args[i].endsWith(".yml")) {
				ConexionHelper.setConfigFilename(args[i]);
			}
		}
		new PrismaApplication().run(args);
	}

	@Override
	public String getName() {
		return "MVNPrisma3020";
	}

	@Override
	public void initialize(final Bootstrap<PrismaConfiguration> bootstrap) {

		prismaGuideModule=new PrismaGuideModule();
		bootstrap.addBundle(prismaGuideModule.getInit());

	}

	@Override
	public void run(final PrismaConfiguration configuration, final Environment environment) {
			
		
		environment.servlets().addFilter("persistFilter", GuiceFilter.class)
		.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST), true, "/*");
		
		Dynamic filter = environment.servlets().addFilter("CORS", CORSFilter.class);
		filter.addMappingForUrlPatterns(EnumSet.allOf(DispatcherType.class), true, "/*");
		
		//environment.jersey().register(guiceBundle.getInjector().getInstance(UserService.class));

	}

}
