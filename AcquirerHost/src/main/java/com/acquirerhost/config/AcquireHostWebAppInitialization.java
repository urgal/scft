package com.acquirerhost.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.GroovyWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;

@Configuration
public class AcquireHostWebAppInitialization implements WebApplicationInitializer {
    @Override
    public void onStartup(ServletContext container) {
        GroovyWebApplicationContext context = new GroovyWebApplicationContext();
        context.setServletContext(container);
        context.setConfigLocation("classpath:dispatcher-config.groovy");
        ServletRegistration.Dynamic dispatcher = container.addServlet("dispatcher", new DispatcherServlet(context));
        dispatcher.setLoadOnStartup(1);
        dispatcher.addMapping("/rest/*");
    }
}
