package com.eventmanagement.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;




@Entity
@Table(name="event")
public class EventEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="event_id")
	private int eventId;
	
	@Column(name="event_name")
	private String name;
	
	@Column(name="startdate")
	private String startDate;
	
	@Column(name="starttime")
	private String startTime;
	
	@Column(name="enddate")
	private String endDate;
	
	@Column(name="endtime")
	private String endTime;
	
	@Column(name="venuename")
	private String venuename;
	
	@Column(name="fee")
	private Long fee;
	
	@Column(name="description")
	private String description;
	
	@Column(name="tickets")
	private int tickets;
	
	@Column(name="sold")
	private int sold;
	
	@Column(name="status")
	private String status;
	
	@Column(name="header")
	private String header;
	
	@Column(name="advanceddetails")
	private String advancedDetails;
	
	@ManyToMany(cascade = { CascadeType.ALL })
	@JoinTable(name="register_event", joinColumns = { @JoinColumn(name = "event_id") }, 
	        inverseJoinColumns = { @JoinColumn(name = "user_id") })
	private Set<UserEntity> users = new HashSet<>();
	
	public EventEntity() {
		super();
	}

	public EventEntity(int eventId) {
		super();
		this.eventId = eventId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getVenuename() {
		return venuename;
	}

	public void setVenuename(String venuename) {
		this.venuename = venuename;
	}

	public Long getFee() {
		return fee;
	}

	public void setFee(Long fee) {
		this.fee = fee;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getTickets() {
		return tickets;
	}

	public void setTickets(int tickets) {
		this.tickets = tickets;
	}

	public int getSold() {
		return sold;
	}

	public void setSold(int sold) {
		this.sold = sold;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getAdvancedDetails() {
		return advancedDetails;
	}

	public void setAdvancedDetails(String advancedDetails) {
		this.advancedDetails = advancedDetails;
	}


	public Set<UserEntity> getUsers() {
		return users;
	}

	public void setUsers(Set<UserEntity> users) {
		this.users = users;
	}

	public int getEventId() {
		return eventId;
	}

}
