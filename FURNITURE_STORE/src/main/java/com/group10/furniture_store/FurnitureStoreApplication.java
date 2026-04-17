package com.group10.furniture_store;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.group10.furniture_store.domain.Role;
import com.group10.furniture_store.domain.User;
import com.group10.furniture_store.repository.RoleRepository;
import com.group10.furniture_store.repository.UserRepository;

// @SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
@SpringBootApplication
public class FurnitureStoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(FurnitureStoreApplication.class, args);
	}

	@Bean
	CommandLineRunner initDatabase(RoleRepository roleRepository) {
		return args -> {
			if (roleRepository.count() == 0) {
				Role adminRole = new Role();
				adminRole.setName("ADMIN");
				adminRole.setDescription("Quản trị viên");

				Role userRole = new Role();
				userRole.setName("USER");
				userRole.setDescription("Người dùng thông thường");

				roleRepository.save(adminRole);
				roleRepository.save(userRole);
			}
		};
	}

	@Bean
	CommandLineRunner initDatabaseUser(RoleRepository roleRepository, UserRepository userRepository,
			PasswordEncoder passwordEncoder) {
		return args -> {
			User adminUser = userRepository.findByEmail("admin@gmail.com");
			if (adminUser == null) {
				adminUser = new User();
				adminUser.setEmail("admin@gmail.com");
				adminUser.setPassword(passwordEncoder.encode("123456"));
				adminUser.setFullName("Admin");
				adminUser.setRole(roleRepository.findById(1L).get());
				adminUser.setAddress("HaNoi");
				adminUser.setAvatar("default-avatar.jpg");
				adminUser.setPhone("0945268805");
				adminUser.setEmailVerified(true);
				userRepository.save(adminUser);
			} else {
				if (adminUser.getEmailVerified() == null || !adminUser.getEmailVerified()) {
					adminUser.setEmailVerified(true);
					userRepository.save(adminUser);
				}
			}
		};
	}
}