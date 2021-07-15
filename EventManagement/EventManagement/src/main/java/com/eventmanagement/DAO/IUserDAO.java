package com.eventmanagement.DAO;

import com.eventmanagement.entity.UserEntity;

public interface IUserDAO {
	UserEntity createUser(UserEntity user);
	UserEntity findUserByUserId(int id);
	UserEntity findUserByUsername(String name);
}
