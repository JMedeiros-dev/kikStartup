package dev.johnmedeiros.kikstartup.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import dev.johnmedeiros.kikstartup.models.User;
import dev.johnmedeiros.kikstartup.models.UserPost;
import dev.johnmedeiros.kikstartup.repositories.UserPostRepository;

@Service
public class UserPostService {
	
private final UserPostRepository userPostRepository;
    
    public UserPostService(UserPostRepository userPostRepository) {
        this.userPostRepository = userPostRepository;
    }
    
    // returns all the posts
    public List<UserPost> allPosts() {
        return userPostRepository.findAll();
    }
        
    
    // retrieves a post
    public UserPost findPost(Long id) {
        Optional<UserPost> optionalPost = userPostRepository.findById(id);
        if(optionalPost.isPresent()) {
            return optionalPost.get();
        } else {
            return null;
        }
    }
  
  // saves a post (either to update or create new)
    public UserPost savePost(UserPost p) {
        return userPostRepository.save(p);
    }
    
    // deletes a post
    public void deletePost(Long id) {
    	userPostRepository.deleteById(id);
    }

}
