package com.eventmanagement.api.web;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.eventmanagement.dto.UserDTO;
import com.eventmanagement.service.UserService;

@RestController
public class UserAPI {
	UserService us = new UserService();
	
	@PostMapping("/api/user/create")
	public UserDTO createUser(@RequestBody UserDTO user) {
		user.setRoleId(2);
		System.out.print("Mat khau:"+user.getPassword());
		BCryptPasswordEncoder password = new BCryptPasswordEncoder();
		user.setPassword(password.encode(user.getPassword()));
		UserDTO result = us.createUser(user);
		System.out.print("id của user vua tao : "+user.getUserId());
		return result;
	}
	
}
