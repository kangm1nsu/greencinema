package com.cos.greencinema;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class GreencinemaApplication {

	public static void main(String[] args) {
		SpringApplication.run(GreencinemaApplication.class, args);
	}

}
