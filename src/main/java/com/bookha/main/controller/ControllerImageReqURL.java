package com.bookha.main.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@RestController
public class ControllerImageReqURL implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry
			.addResourceHandler("/images/**")
			.addResourceLocations("file:/C:/imageSaveStorage/");
	}
}