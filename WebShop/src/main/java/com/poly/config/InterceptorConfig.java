package com.poly.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.service.AuthInterceptor;
import com.poly.service.GlobalInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	@Autowired
	AuthInterceptor auth;

	@Autowired
	GlobalInterceptor global;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(global).addPathPatterns("/**");

//		registry.addInterceptor(cart).addPathPatterns("/", "/shop/**").excludePathPatterns("/assets/**");

		registry.addInterceptor(auth).addPathPatterns("/profile/**", "/admin/**" , "/cart/**");
	}
}
