package com.eventmanagement.api.admin;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.eventmanagement.dto.EventDTO;
import com.eventmanagement.entity.EventEntity;
import com.eventmanagement.service.EventService;

@RestController(value = "eventAPIOfAdmin")
public class EventAPI {
	
	private EventService es = new EventService();
	
	@GetMapping("/api/secure/event/")
	public List<EventDTO> findAll() {
		List<EventDTO> events = es.findAll();
		return events;
	}
	
	@GetMapping(value="/api/secure/event/{id}")
	public EventDTO findEventById(@PathVariable("id") int id) {
		return es.findEventById(id);
	}
	
	@PostMapping("/api/private/newevent")
	public EventDTO createEvent(@RequestBody EventDTO event) {
		return es.createEvent(event);
	}
	
	@PutMapping("/api/private/update")
	public EventDTO updateEvent(@RequestBody EventDTO event) {
		System.out.print(event.getEventId());
		return es.updateEvent(event);
	}
}
