package se.cygni.spring.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import se.cygni.spring.dao.PersonDao;
import se.cygni.spring.domain.Person;

@Controller
@RequestMapping("/people")
public class PersonCrudController {
	@Autowired
	private PersonDao personDao;
	
	@RequestMapping(method=RequestMethod.GET)
	public Collection<Person> allPeople(){
		return personDao.findAll();
	}
	
	@RequestMapping(value = "/{id}", method=RequestMethod.GET)
	public ModelAndView findPerson(@PathVariable("id")long id){
		return new ModelAndView("/people/show", "person", personDao.findById(id));
	}
	
	@RequestMapping("/new")
	public void showNewForm(){
		
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String createNewPerson(@RequestParam("firstName") String firstName, @RequestParam("surName") String lastName, @RequestParam("email") String email, @RequestParam("birthDate") String birthDate){
		Person person = new Person(firstName, lastName, email, birthDate);
		personDao.create(person);
		return "redirect:/people/" +person.getId();
	}
	
	@RequestMapping("/{id}/update")
	public ModelAndView updatePerson(@PathVariable("id") long id){
		return new ModelAndView("/people/update", "person", personDao.findById(id));
	}
	
	@RequestMapping(value="/{id}", method=RequestMethod.PUT)
	public String updatePut(
			@PathVariable("id") long id,
			@RequestParam("firstName") String firstName, 
			@RequestParam("surName") String surName, 
			@RequestParam("email") String email, 
			@RequestParam("birthDate") String birthDate){
		Person person = personDao.findById(id);
		person.setFirstName(firstName);
		person.setSurName(surName);
		person.setEmail(email);
		person.setBirthDate(birthDate);
		personDao.update(person);
		return "redirect:/people/" +person.getId();
	}
	
	
}

