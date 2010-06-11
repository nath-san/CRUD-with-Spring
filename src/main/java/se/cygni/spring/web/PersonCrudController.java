package se.cygni.spring.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	 * @return a ModelAndView object which means that the view "/people/id" is showed when all fields are correct, and "people/new" if not.
	 */
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView createNewPerson(Person person, Errors errors){
		if(checkFirstName(person.getFirstName()) && 
			checkSurName(person.getSurName()) &&
			checkEmail(person.getEmail()) &&
			checkBirthDate(person.getBirthDate()))
		{
			personDao.create(person);
			return new ModelAndView("redirect:/people/" +person.getId());	
		}
		else{
			if(!checkFirstName(person.getFirstName())){
				errors.rejectValue("firstName", "firstNameError", "First name must be more than two characters");
			}
			if(!checkSurName(person.getSurName())){
				errors.rejectValue("surName", "surNameError", "Surname must be more than two characters");
			}
			if(!checkEmail(person.getEmail())){
				errors.rejectValue("email", "emailError", "Email must contain @ and be more than four characters");
			}
			if(!checkBirthDate(person.getBirthDate())){
				errors.rejectValue("birthDate", "birthDateError", "Birth date must be eight digits");
			}
			return new ModelAndView("/people/new", "person", person);		
		}
	}
	
	public boolean checkFirstName(String firstName){
		if(firstName.length()<3){ 
			return false;
		}
		else
			return true;
	}
	
	public boolean checkSurName(String surName){
		if(surName.length()<3){
			return false;
		}
		else
			return true;
	}
	
	public boolean checkEmail(String email){
		if(email.length()<5 || !email.contains("@")){
			return false;
		}
		else
			return true;
	}
		
	public boolean checkBirthDate(String birthDate){
		if(birthDate.length()!=10){
			return false;
		}
		else
			return true;
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
	 * @return a String which means that the view "/people/id" is showed.
	 */
	@RequestMapping(value="/{id}", method=RequestMethod.PUT)
	public ModelAndView updatePut(@PathVariable("id") long id, Person person, Errors errors){
		if(checkFirstName(person.getFirstName()) && 
				checkSurName(person.getSurName()) &&
				checkEmail(person.getEmail()) &&
				checkBirthDate(person.getBirthDate())){
			personDao.update(person);
			return new ModelAndView("redirect:/people/" +person.getId());
		}
		else{
			if(!checkFirstName(person.getFirstName())){
				errors.rejectValue("firstName", "firstNameError", "First name must be more than two characters");
			}
			if(!checkSurName(person.getSurName())){
				errors.rejectValue("surName", "surNameError", "Surname must be more than two characters");
			}
			if(!checkEmail(person.getEmail())){
				errors.rejectValue("email", "emailError", "Email must contain @ and be more than four characters");
			}
			if(!checkBirthDate(person.getBirthDate())){
				errors.rejectValue("birthDate", "birthDateError", "Birth date must be eight digits");
			}
			return new ModelAndView("/people/update", "person", person);		
		}
	}
	

	@RequestMapping(value="/{id}", method=RequestMethod.DELETE)
	public String deletePerson(@PathVariable("id") long id){
		personDao.delete(personDao.findById(id));
		return "redirect:/people";
	}
	
}

