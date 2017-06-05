package com.gruponutresa.prisma.guice.modules;

import javax.inject.Inject;
import javax.inject.Singleton;
import com.google.inject.persist.PersistService;

/**
 * Created by aurel.avramescu on 15/06/2014.
 */
@Singleton
public class JpaInitializer {

    @Inject
    public JpaInitializer(final PersistService service)
    {
        service.start();
    }
}