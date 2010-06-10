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
	
	/**
	 * 
	 * Since no value is set, this method is called when the url "/people/" is typed.
	 * @return personList
	 */
	@RequestMapping(method=RequestMethod.GET)
	public Collection<Person> allPeople(){
		return personDao.findAll();	
	}
	
	/**
	 * 
	 * This method is called when the url "/people/something(except new) is typed. 
	 * With @PathVariable we get the id from the url and can use this inside the method. 
	 * @return a ModelAndView object since we want to return both a view ("/people/show") which is the the view that is showed, and, in this case, a Person object. The Person object can be accessed in the view with the name "person"
	 */
	@RequestMapping(value = "/{id}", method=RequestMethod.GET)
	public ModelAndView findPerson(@PathVariable("id")long id){
		return new ModelAndView("/people/show", "person", personDao.findById(id));
	}
	
	/**
	 * 
	 * This method is called when the url "/people/new" is typed. Since we don't return anything, the view "/new" is showed. 
	 */
	@RequestMapping(value = "/new", method=RequestMethod.GET)
	public Person showNewForm(){
		return new Person();
	}
	
	/**
	 * This method is called when a POST is made to the url "/people" (in this case when a new person is created). 
	 * All params are collected from the form in the "new-view". 
	 * A new person is created. 
	 * @return a String which means that the view "/people/id" is showed.
	 */
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView createNewPerson(Person person){
		if(checkInput(person.getFirstName(), person.getSurName(), person.getEmail(), person.getBirthDate())){
			personDao.create(person);
			return new ModelAndView("redirect:/people/" +person.getId());	
		}
		else{
			return new ModelAndView("/people/new", "person", person);		
		}
	}
	
	public boolean checkInput(String firstName, String surName, String email, String birthDate){
		if(firstName.length()<3 || surName.length()<3 || email.length()<5 || !email.contains("@") || birthDate.length() < 8){
			return false;
		}
		else{
			return true;
	
		}
	}
		
	/**
	 * This method is called when the url "/people/id/update" is typed.
	 * @return a ModelAndView object where we specify the view "/people/update" and sends a Person object. 
	 */
	@RequestMapping("/{id}/update")
	public ModelAndView updatePerson(@PathVariable("id") long id){
		return new ModelAndView("/people/update", "person", personDao.findById(id));
	}
	
	/**
	 * This method is called when a PUT action is made to the url "/people/id".
	 * We collect the params from a form, find the Person and update it. 
	 * @return a String which means that the view "/people/id" is showed.
	 */
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
	

	@RequestMapping(value="/{id}", method=RequestMethod.DELETE)
	public String deletePerson(@PathVariable("id") long id){
		personDao.delete(personDao.findById(id));
		return "redirect:/people";
	}
	
}

