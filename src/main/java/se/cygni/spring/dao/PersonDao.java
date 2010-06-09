package se.cygni.spring.dao;

import java.util.Collection;

import se.cygni.spring.domain.Person;

public interface PersonDao {
	Collection<Person> findAll();
	Person findById(long id);
	void create(Person person);
	void update(Person person);
	void delete(Person person);
}