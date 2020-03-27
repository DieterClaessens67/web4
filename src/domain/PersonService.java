package domain;

import java.util.Collection;
import java.util.List;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.JsonObject;
import db.PersonRepository;
import db.PersonRepositoryStub;

public class PersonService {
	private PersonRepository personRepository = new PersonRepositoryStub();

	public PersonService(){
	}
	
	public Person getPerson(String personId)  {
		return getPersonRepository().get(personId);
	}

	public List<Person> getPersons() {
		return getPersonRepository().getAll();
	}

	public void addPerson(Person person) {
		getPersonRepository().add(person);
	}

	public void updatePersons(Person person) {
		getPersonRepository().update(person);
	}

	public void deletePerson(String id) {
		getPersonRepository().delete(id);
	}
	
	public Person getAuthenticatedUser(String email, String password) {
		return getPersonRepository().getAuthenticatedUser(email, password);
	}
	private PersonRepository getPersonRepository() {
		return personRepository;
	}

	public JsonObject getFriends(String personId) {
		Person user = getPerson(personId);
		if (user != null) {
			JsonObject friends = getFriendsAsJson(user.getFriendsCollection());
			return friends;
		}
		return null;
	}

	private JsonObject getFriendsAsJson(Collection<Person> friends) {
		JsonObject object = new JsonObject();
		for (Person friend : friends) {
			JsonObject persoon = new JsonObject();
			persoon.addProperty("userName", friend.getFirstName());
			persoon.addProperty("status", friend.getStatus());
			object.add(friend.getUserId(), persoon);
		}
		return object;
	}
}
