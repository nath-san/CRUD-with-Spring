package se.cygni.spring.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.stereotype.Component;

import se.cygni.spring.domain.Person;

@Component
public class PersonInMemoryDao implements PersonDao {

	private List<Person> people = new ArrayList<Person>();
	private long nextId = 1;
	
	public PersonInMemoryDao(){
		create(new Person("Nathalie", "Sandström", "natta.sandstrom@gmail.com", "1985-04-29"));
		create(new Person("Svenne", "Svensson", "sven.svensson@gmail.com", "1935-01-14"));
		create(new Person("Arne", "Andersson", "arne.andersson@gmail.com", "1885-05-19"));
	}
	
	public void create(Person person) {
		person.setId(nextId++);
		people.add(person);
	}

	public void delete(Person person) {
		for(int i=0; i<people.size();++i){
			if(people.get(i).getId()== person.getId()){
				people.remove(i);
				return;
			}
		}
	}

	public Collection<Person> findAll() {
		return people;
	}

	public Person findById(long id) {
		for(Person p:people){
			if(id==p.getId()){
				return p;
			}
		}
		return null;
	}

	public void update(Person person) {
		for(int i=0; i<people.size();i++){
			if(person.getId()==people.get(i).getId()){
				people.set(i, person);
			}
		}
	}

}
