package com.eventmanagement.DAO.impl;

import java.util.List;

import org.hibernate.Session;

import com.eventmanagement.DAO.IUserDAO;
import com.eventmanagement.entity.EventEntity;
import com.eventmanagement.entity.UserEntity;
import com.eventmanagement.hibernate.HibernateUtils;

public class UserDAO implements IUserDAO{
	public UserEntity createUser(UserEntity user) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
		return user;
	}
	
	public UserEntity findUserByUserId(int id) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		List<UserEntity> users = null;
		users = session.createQuery("FROM User WHERE user_id="+id, UserEntity.class).list();
		session.getTransaction().commit();
		if(users != null) {
			return users.get(0);
		}
		return null;
	}
	
	public UserEntity findUserByUsername(String username) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		List<UserEntity> users = null;
		users = session.createQuery("FROM UserEntity WHERE username='"+username+"'", UserEntity.class).list();
		session.getTransaction().commit();
		if(users != null) {
			return users.get(0);
		}
		return null;
	}
	
}
