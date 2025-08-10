package com.kaleshrikant;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class SpringBootDockerGoogleJibApplication {

	@RequestMapping("/message")
	public String message() {
		return "Dockerize Java Application using Google-Jib..!!";
	}

	public static void main(String[] args) {
		SpringApplication.run(SpringBootDockerGoogleJibApplication.class, args);
	}

}
