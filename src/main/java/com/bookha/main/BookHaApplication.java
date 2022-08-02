package com.bookha.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.bookha.controller", "com.bookha.imageSave"})
public class BookHaApplication {

	public static void main(String[] args) {
		SpringApplication.run(BookHaApplication.class, args);
	}
}