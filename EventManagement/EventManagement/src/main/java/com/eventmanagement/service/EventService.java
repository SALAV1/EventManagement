package com.eventmanagement.service;

import java.util.List;
import java.util.ArrayList;

import com.eventmanagement.DAO.impl.EventDAO;
import com.eventmanagement.converter.EventConverter;
import com.eventmanagement.dto.EventDTO;
import com.eventmanagement.entity.EventEntity;
import com.eventmanagement.entity.UserEntity;

public class EventService {
	private EventDAO eventdao = new EventDAO();
	private EventConverter eventConverter = new EventConverter();
	
	public List<EventDTO> findAll() {
		List<EventDTO> events = new ArrayList<>();
		List<EventEntity> items = eventdao.findAll();
		for(EventEntity item : items) {
			EventDTO event = eventConverter.toDTO(item);
			events.add(event);
		}
		return events;
	}
	public EventDTO findEventById(int id){
		EventDTO result = new EventDTO();
		EventEntity event = eventdao.findEventById(id);
		result = eventConverter.toDTO(event);
		return result;
	}
	public EventDTO createEvent(EventDTO event) {
		EventDTO result = new EventDTO();
		EventEntity item = eventdao.createEvent(eventConverter.toEntity(event));
		result = eventConverter.toDTO(item);
		return result;
	}
	public EventDTO updateEvent(EventDTO event) {
		EventDTO result = new EventDTO();
		EventEntity item = eventdao.updateEvent(eventConverter.toEntity(event));
		result = eventConverter.toDTO(item);
		return result;
	}
}
