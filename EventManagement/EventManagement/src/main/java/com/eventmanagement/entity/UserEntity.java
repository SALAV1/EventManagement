package com.eventmanagement.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class UserEntity {
	@Id
	@Column(name="user_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	
	@Column(name="username")
	private String userName;
	
	@Column(name="password")
	private String password;
	
	@Column(name="fullname")
	private String fullName;
	
	@Column(name="address")
	private String address;
	
	@Column(name="phonenumber")
	private String phoneNumber;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="role_id")
	private RoleEntity role;
	
	@ManyToMany(mappedBy = "users")
	private Set<EventEntity> events = new HashSet<>();
	
	
	public UserEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserEntity(int userId) {
		super();
		this.userId = userId;
	}

	public int getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public RoleEntity getRole() {
		return role;
	}

	public void setRole(RoleEntity role) {
		this.role = role;
	}

	public Set<EventEntity> getEvents() {
		return events;
	}

	public void setEvents(Set<EventEntity> events) {
		this.events = events;
	}

	
	
	

}
