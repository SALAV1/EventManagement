package com.eventmanagement.service;

import com.eventmanagement.DAO.impl.UserDAO;
import com.eventmanagement.converter.UserConverter;
import com.eventmanagement.dto.UserDTO;
import com.eventmanagement.entity.UserEntity;

public class UserService {
	
	private UserDAO userDAO = new UserDAO();
	private UserConverter userConverter = new UserConverter();
	
	public UserDTO createUser(UserDTO user) {
		UserDTO result = new UserDTO();
		UserEntity userEntity = userConverter.toEntity(user);
		return userConverter.toDTO(userDAO.createUser(userEntity));
	}
}
