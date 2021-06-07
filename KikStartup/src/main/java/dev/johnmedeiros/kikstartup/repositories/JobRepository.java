package dev.johnmedeiros.kikstartup.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import dev.johnmedeiros.kikstartup.models.Job;




@Repository
public interface JobRepository extends CrudRepository<Job, Long> {

	List<Job> findAll();
	
	Optional<Job> findById(Long id);
	
	void deleteById(Long id);
	
  	
    List<Job> findByLocationContaining(String search);
	
}
