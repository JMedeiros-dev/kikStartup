package dev.johnmedeiros.kikstartup.repositories;


import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import dev.johnmedeiros.kikstartup.models.User;





@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    
	List<User> findAll();
	
	Optional<User> findById(Long id);
	
	User findByEmail(String email);
	

    List<User> findByFirstNameContaining(String search);
	
	void deleteById(Long id);
}