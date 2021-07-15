package com.eventmanagement.DAO;

import java.util.List;

import com.eventmanagement.entity.EventEntity;


public interface IEventDAO {
	List<EventEntity> findAll();
	EventEntity findEventById(int id);
	EventEntity createEvent(EventEntity event);
	EventEntity updateEvent(EventEntity event);
}

