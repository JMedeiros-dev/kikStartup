package dev.johnmedeiros.kikstartup.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import dev.johnmedeiros.kikstartup.models.Job;

import dev.johnmedeiros.kikstartup.repositories.JobRepository;

@Service
public class JobService {
	
	  // adding the job repository as a dependency
	private final JobRepository jobRepository;
	    
	    public JobService(JobRepository jobRepository) {
	        this.jobRepository = jobRepository;
	    }
	    
	    // returns all the jobs
	    public List<Job> allJobs() {
	        return jobRepository.findAll();
	    }
	    
  
	    // retrieves a job
	    public Job findJob(Long id) {
	        Optional<Job> optionalJob = jobRepository.findById(id);
	        if(optionalJob.isPresent()) {
	            return optionalJob.get();
	        } else {
	            return null;
	        }
	    }
	  
	  // saves a job (either to update or create new)
	    public Job saveJob(Job j) {
	        return jobRepository.save(j);
	    }
	    
	
	    // searches for a job
		public List<Job> searchJob(String search) {
			return jobRepository.findByLocationContaining(search);
			
		}
	    
	    // deletes a job
	    public void deleteJob(Long id) {
	    	jobRepository.deleteById(id);
	    }

}
