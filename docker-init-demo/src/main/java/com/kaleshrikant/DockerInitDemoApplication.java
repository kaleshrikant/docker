package com.kaleshrikant;

import com.kaleshrikant.dto.Customer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@RestController
@RequestMapping("/customers")
@SpringBootApplication
public class DockerInitDemoApplication {

	@GetMapping
	public List<Customer> getCustomers() {
		return Stream.of(new Customer(101, "Basant", "basant@gmail.com", "Male"),
						new Customer(102, "Santosh", "santosh@gmail.com", "Male"),
						new Customer(103, "Shruti", "shruti@gmail.com", "Female"))
				.collect(Collectors.toList());
	}

	public static void main(String[] args) {
		SpringApplication.run(DockerInitDemoApplication.class, args);
	}

}
