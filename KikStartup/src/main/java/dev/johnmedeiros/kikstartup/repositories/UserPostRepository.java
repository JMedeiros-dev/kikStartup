package dev.johnmedeiros.kikstartup.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import dev.johnmedeiros.kikstartup.models.User;
import dev.johnmedeiros.kikstartup.models.UserPost;

@Repository
public interface UserPostRepository extends CrudRepository <UserPost, Long> {
	
	 // this method retrieves all the posts from the database
    List<UserPost> findAll();
    

   
   
  	// this method finds posts containing the search string
    List<UserPost> findByPContaining(String search);
    
    
  	// this method counts how many posts contain a certain string
    Long countByPContaining(String search);
    
  	
  	//this method finds a post by ID
  	Optional<UserPost> findById(Long id);
  
  	//this method deletes a post by ID
		void deleteById(Long id);
	
}


