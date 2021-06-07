package dev.johnmedeiros.kikstartup.controllers;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.johnmedeiros.kikstartup.models.Job;
import dev.johnmedeiros.kikstartup.models.UserPost;
import dev.johnmedeiros.kikstartup.models.User;
import dev.johnmedeiros.kikstartup.services.JobService;
import dev.johnmedeiros.kikstartup.services.UserPostService;
import dev.johnmedeiros.kikstartup.services.UserService;
import dev.johnmedeiros.kikstartup.validator.UserValidator;


@Controller
public class MainController {
	
	private final UserService userService;
	private final UserValidator userValidator;
	private final JobService jobService;
	private final UserPostService userPostService;
	
	 public MainController(UserService userService, UserValidator userValidator, JobService jobService, UserPostService userPostService) {
	     this.userService = userService;
	     this.userValidator = userValidator;
	     this.jobService= jobService;
	     this.userPostService= userPostService;
	 }
	
	
	
//==========================================================================================
// LANDING PAGE
//==========================================================================================
	
	
	@RequestMapping("/")
	public String landingPage() {
		return "redirect:/login";
	}
	
	
//===========================================================================================
// LOGIN ROUTE
//===========================================================================================
	
	
	@RequestMapping("/login")
	public String loginPage() {
		return "login.jsp";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	 public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session, RedirectAttributes redirect) {
	     if(userService.authenticateUser(email, password)) {
	    	 User u = userService.findByEmail(email);
	         session.setAttribute("userId", u.getId());
	         return "redirect:/dashboard";
	     } else {
	    	 redirect.addFlashAttribute("error", "Invalid email or password.");
	    	 return "redirect:/login";
	     }

	 }
	
	
//===========================================================================================
// REGISTRATION ROUTE
//===========================================================================================	
	
	 @RequestMapping("/registration")
	 public String registerForm(Model model) {
		 model.addAttribute("user", new User());
	     return "registration.jsp";
	 }
	 
	 
	 @RequestMapping(value="/registration", method=RequestMethod.POST)
	 public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		 userValidator.validate(user, result);
		 if (result.hasErrors()) {
	            return "registration.jsp";
	        } else {
	            User u = userService.registerUser(user);
	            session.setAttribute("userId", u.getId());
	            return "redirect:/dashboard";
	        }
	    }
	 
	 
//===========================================================================================
// DASHBOARD ROUTE
//===========================================================================================
	
		@RequestMapping("/dashboard")
		 public String dashboard(HttpSession session, Model model, RedirectAttributes redirect) {
			Long userId = (Long) session.getAttribute("userId");
				 if(userId == null) {
					redirect.addFlashAttribute("please", "Please Login or Register before entering the site");
					return "redirect:/";
				}
			 List<Job> jobs = jobService.allJobs();
			 List<Job> recentJobs = jobs.subList(jobs.size()-5, jobs.size());
			 model.addAttribute("recentJobs", recentJobs);
			 model.addAttribute("user", userService.findUserById(userId));
			 model.addAttribute("posts", userPostService.allPosts());
			 model.addAttribute("userpost", new UserPost()); 
		     return "dashboard.jsp";
		 }
		
		
		
//===========================================================================================
// JOBS ROUTE
//===========================================================================================
			
				@RequestMapping("/jobs")
				 public String jobs(HttpSession session, Model model, RedirectAttributes redirect) {
					Long userId = (Long) session.getAttribute("userId");
						 if(userId == null) {
							redirect.addFlashAttribute("please", "Please Login or Register before entering the site");
							return "redirect:/";
						}
					 List<Job> jobs = jobService.allJobs();
					        model.addAttribute("jobs", jobs);
					 model.addAttribute("user", userService.findUserById(userId));
				     return "jobs.jsp";
				 }
				
				
		
		
		
//===========================================================================================
// SEARCH MEMBER ROUTE
//===========================================================================================
			
				@RequestMapping(value="/search", method=RequestMethod.POST)
			    public String search(@RequestParam(value="user") String user, Model model) {
					List<User> results= userService.searchUser(user);
					model.addAttribute("results", results);
					model.addAttribute("user", user);
					
			            return "results.jsp";
			    }
				
				
//===========================================================================================
// SEARCH JOB ROUTE
//===========================================================================================
							
				@RequestMapping(value="/search_job", method=RequestMethod.POST)
				public String searchJob(@RequestParam(value="job") String job, Model model) {
					List<Job> results= jobService.searchJob(job);
					model.addAttribute("results", results);
					model.addAttribute("job", job);
									
						return "jobResults.jsp";
				}
															
	
//===========================================================================================
// NEW JOB ROUTE
//===========================================================================================	
					
				 
				@RequestMapping("/new-job")
				public String newJob(HttpSession session, Model model, RedirectAttributes redirect) {
					Long userId = (Long) session.getAttribute("userId");
					 if(userId == null) {
						redirect.addFlashAttribute("please", "Please Login or Register before entering the site");
						return "redirect:/";
					 }
					model.addAttribute("user", userService.findUserById(userId));
					model.addAttribute("job", new Job());
					return "newJob.jsp";
				}
				
				@RequestMapping(value="/new-job", method=RequestMethod.POST)
				    public String createJob(@Valid @ModelAttribute("job") Job job, BindingResult result) {
				        if (result.hasErrors()) {
				            return "jobs.jsp";
				        } else {
				            jobService.saveJob(job);
				            return "redirect:/dashboard";
				        }
				    }
				
				
//===========================================================================================
// EDIT JOB ROUTE
//===========================================================================================	

				@RequestMapping("/jobs/{id}/edit")
				public String editJob(@PathVariable("id") Long id, HttpSession session, Model model, RedirectAttributes redirect) {
					Long userId = (Long) session.getAttribute("userId");
					 if(userId == null) {
						redirect.addFlashAttribute("please", "Please Login or Register before entering the site");
						return "redirect:/";
					 }
					model.addAttribute("user", userService.findUserById(userId));
					Job job = jobService.findJob(id);
					model.addAttribute("job", job);
					return "editJob.jsp";
				}
				
				@RequestMapping(value="/jobs/{id}/edit", method=RequestMethod.PUT)
				    public String saveJob(@Valid @ModelAttribute("job") Job job, BindingResult result) {
				        if (result.hasErrors()) {
				            return "editJob.jsp";
				        } else {
				            jobService.saveJob(job);
				            return "redirect:/dashboard";
				        }
				    }
				
				
				@RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
			    public String destroy(@PathVariable("id") Long id) {
			        jobService.deleteJob(id);
			        return "redirect:/dashboard";
			    }
				
				
//===========================================================================================
// JOB SHOW ROUTE
//===========================================================================================
			
				  @RequestMapping("/jobs/{id}")
					public String jobShow(@PathVariable("id") Long id, Model model, HttpSession session, RedirectAttributes redirect) {
					  Long userId = (Long) session.getAttribute("userId");
						 if(userId == null) {
							redirect.addFlashAttribute("please", "Please Login or Register before entering the site");
							return "redirect:/";
						 }
						Job job = jobService.findJob(id);
						model.addAttribute("job", job);
						model.addAttribute("user", userService.findUserById(userId));
						return "jobShow.jsp";
					}	
				
				
				
//===========================================================================================
// MY PROFILE ROUTE
//===========================================================================================				
				
				@RequestMapping("/profile")
				public String profile(HttpSession session, Model model, RedirectAttributes redirect) {
					Long userId = (Long) session.getAttribute("userId");
					 if(userId == null) {
						redirect.addFlashAttribute("please", "Please Login or Register before entering the site");
						return "redirect:/";
					 }
					model.addAttribute("user", userService.findUserById(userId));
					model.addAttribute("userpost", new UserPost()); 
					return "profile.jsp";
				}
	
				
//===========================================================================================
// SHOW PROFILE ROUTE
//===========================================================================================				
								
				@RequestMapping("/profile/{id}")
				public String showProfile(@PathVariable("id") Long id, HttpSession session, Model model, RedirectAttributes redirect) {
					Long userId = (Long) session.getAttribute("userId");
					 if(userId == null) {
						redirect.addFlashAttribute("please", "Please Login or Register before entering the site");
						return "redirect:/";
					}
					 	model.addAttribute("loggedUser", userService.findUserById(userId));
						model.addAttribute("user", userService.findUserById(id)); 
						return "showProfile.jsp";
				}
									
				
//===========================================================================================
// ADD POST ROUTE
//===========================================================================================				
				
				@RequestMapping(value="/add_post", method=RequestMethod.POST)
			    public String addPost(@Valid @ModelAttribute("userpost") UserPost userpost, BindingResult result) {
			        if (result.hasErrors()) {
			            return "profile.jsp";
			        } else {
			            userPostService.savePost(userpost);
			            return "redirect:/profile";
			        }
			    }
				

//===========================================================================================
// DELETE POST ROUTE
//===========================================================================================					
				
				@RequestMapping(value="/posts/delete/{id}", method=RequestMethod.DELETE)
			    public String destroyPost(@PathVariable("id") Long id) {
			        userPostService.deletePost(id);
			        return "redirect:/profile";
			    }
					
				
//===========================================================================================
// EDIT PROFILE ROUTES
//===========================================================================================
				
				@RequestMapping("/update_profile")
				public String editProfile(HttpSession session, Model model, RedirectAttributes redirect) {
					Long userId = (Long) session.getAttribute("userId");
					 if(userId == null) {
						redirect.addFlashAttribute("please", "Please Login or Register before entering the site");
						return "redirect:/";
					 }
					model.addAttribute("user", userService.findUserById(userId));
					return "editProfile.jsp";
				}
				
				
				
				@RequestMapping(value="/update_profile/{id}", method=RequestMethod.PUT)
			    public String updateProfile(@Valid @ModelAttribute("user") User user, BindingResult result) {
			        if (result.hasErrors()) {
			            return "editProfile.jsp";
			        } else {
			            userService.saveUser(user);
			            return "redirect:/dashboard";
			        }
			    }
				

				
				
//===========================================================================================
// MY JOBS ROUTE
//===========================================================================================
				
				@RequestMapping("/my_applications")
				public String myApplications(HttpSession session, Model model, RedirectAttributes redirect) {
					Long userId = (Long) session.getAttribute("userId");
					 if(userId == null) {
						redirect.addFlashAttribute("please", "Please Login or Register before entering the site");
						return "redirect:/";
					 }
					model.addAttribute("user", userService.findUserById(userId));
					return "myapplications.jsp";
				}
				
				
				
//===========================================================================================
// MY JOBS ROUTE
//===========================================================================================
								
				@RequestMapping("/my_jobs")
					public String myJobs(HttpSession session, Model model, RedirectAttributes redirect) {
						Long userId = (Long) session.getAttribute("userId");
						 if(userId == null) {
							redirect.addFlashAttribute("please", "Please Login or Register before entering the site");
							return "redirect:/";
						}
						model.addAttribute("user", userService.findUserById(userId));
						return "myjobs.jsp";
				}
												
				
				
//===========================================================================================
// RESET PASSWORD ROUTES
//===========================================================================================
								
				@RequestMapping("/reset_pass")
				public String passReset(HttpSession session, Model model, RedirectAttributes redirect) {
					Long userId = (Long) session.getAttribute("userId");
					if(userId == null) {
						redirect.addFlashAttribute("please", "Please Login or Register before entering the site");
						return "redirect:/";
					}
					model.addAttribute("user", userService.findUserById(userId));
						return "passReset.jsp";
				}
				
												
								
				@RequestMapping(value="/reset_pass/{id}", method=RequestMethod.PUT)
				public String updatePass(@Valid @ModelAttribute("user") User user, BindingResult result) {
					if (result.hasErrors()) {
						return "passReset.jsp";
					} else {
						userService.registerUser(user);
						return "redirect:/update_profile";
					}
				}
							
				
//===========================================================================================
// APPLY FOR JOB ROUTES
//===========================================================================================
											
			    @RequestMapping("/apply/{id}")
				public String apply(@PathVariable("id") Long id, HttpSession session, Model model) {
					
					
					Long userId = (Long) session.getAttribute("userId");
					User u = userService.findUserById(userId);
					Job job = jobService.findJob(id);
					
					List<User> applicants = job.getApplicants();
					
					applicants.add(u);
					
					job.setApplicants(applicants);
					
					jobService.saveJob(job);
					
					return "redirect:/application_success";
				}
			    
			    
			    @RequestMapping("/application_success")
			    public String appSuccess() {
			        return "success.jsp";
			    }
			    
			    
		
//===========================================================================================
// LOGOUT ROUTES
//===========================================================================================
		 
		 @RequestMapping("/logout")
		 public String logout(HttpSession session) {
			 session.invalidate();
				return "redirect:/";
		 }


}
