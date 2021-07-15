package com.eventmanagement.dto;


import com.sun.istack.NotNull;

public class UserDTO {

		private int userId;
		
		@NotNull
		private String userName;
		
		@NotNull
		private String password;
		
		@NotNull
		private String fullName;
		
		@NotNull
		private String address;
		
		@NotNull
		private String phoneNumber;
		
		@NotNull
		private int roleId;
		
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
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
		public int getRoleId() {
			return roleId;
		}
		public void setRoleId(int roleId) {
			this.roleId = roleId;
		}	
		
		
}
