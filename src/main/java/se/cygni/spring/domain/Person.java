package se.cygni.spring.domain;

public class Person {
	private String firstName;
	private String surName;
	private String email;
	private String birthDate;
	private long id;
	
	public Person(String firstName, String surName, String email, String birthDate) {
		this.firstName = firstName;
		this.surName = surName;
		this.email = email;
		this.birthDate = birthDate;
	}
	public Person() {
		// TODO Auto-generated constructor stub
	}
	public String getBirthDate() {
		return birthDate;
	}
	public String getEmail() {
		return email;
	}
	public String getFirstName() {
		return firstName;
	}
	public long getId() {
		return id;
	}
	public String getSurName() {
		return surName;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public void setId(long id) {
		this.id = id;
	}
	public void setSurName(String surName) {
		this.surName = surName;
	}
	
	
}
