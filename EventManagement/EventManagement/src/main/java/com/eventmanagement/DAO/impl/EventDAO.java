package com.eventmanagement.DAO.impl;

import java.util.List;

import org.hibernate.Session;
import com.eventmanagement.DAO.IEventDAO;
import com.eventmanagement.entity.EventEntity;
import com.eventmanagement.hibernate.HibernateUtils;


public class EventDAO implements IEventDAO {
	public List<EventEntity> findAll(){
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		List<EventEntity> events = null;
		events = session.createQuery("FROM EventEntity ORDER BY startDate, startTime DESC", EventEntity.class).list();
		if(events != null) {
			session.getTransaction().commit();
			return events;
		}
		else {
			session.getTransaction().commit();
			return null;}
	}
	
	public EventEntity findEventById(int id) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		List<EventEntity> events = null;
		events = session.createQuery("FROM EventEntity WHERE event_id="+id, EventEntity.class).list();
		session.getTransaction().commit();
		if(events != null) {
			return events.get(0);
		}
		return null;
	}
	
	public EventEntity createEvent(EventEntity event) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(event);
		session.getTransaction().commit();
		return event;
	}
	
	public EventEntity updateEvent(EventEntity event) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		/*String hql = "UPDATE event SET evet_name = :event_name, startdate = :start_date, starttime = :start_time, enddate = :end_date, endtime = :end_time, venuename = :venuename, fee = :fee, description = :description, user_id = :user_id, tickets = :tickets, sold = :sold, status = :status, header = :header, advanceddetails = :advanceddetails WHERE event_id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", event.getEventId());
		query.setParameter("event_name", event.getName());
		query.setParameter("start_date", event.getStartDate());
		query.setParameter("start_time", event.getStartTime());
		query.setParameter("end_date", event.getEndDate());
		query.setParameter("end_time", event.getEndTime());
		query.setParameter("venuename", event.getVenuename());
		query.setParameter("fee", event.getFee());
		query.setParameter("descripton", event.getDescription());
		query.setParameter("header", event.getHeader());
		query.setParameter("tickets", event.getTickets());
		query.setParameter("status", event.getStatus());
		query.setParameter("advanceddetails", event.getAdvancedDetails());
		int result = query.executeQuery();*/
		session.update(event);
		session.getTransaction().commit();
		return event;
	}
}
