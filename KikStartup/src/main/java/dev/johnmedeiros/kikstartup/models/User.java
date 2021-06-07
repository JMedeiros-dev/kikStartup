package dev.johnmedeiros.kikstartup.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="users")
public class User {
 @Id
 @GeneratedValue(strategy=GenerationType.IDENTITY)
 private Long id;
 @NotNull
 @Size(min=2, max=50, message = "First Name must be between 2-50 characters")
 private String firstName;
 @NotNull
 @Size(min=2, max=50, message = "Last Name must be between 2-50 characters")
 private String lastName;
 @NotNull
 @Email(message = "Please enter a valid email")
 @Size(min=5, max=50, message = "Email must be between 2-50 characters")
 private String email;
 @Column(nullable = true, length = 64)
 private String photo;
 @Size(min=10, max=500, message = "Please provide a bio between 10-500 characters")
 private String bio;
 @Size(min=2, max=50, message = "Location must be between 2-50 characters")
 private String location;
 private String linkedin;
 @NotNull
 @Size(min=8, message = "Password must be at least 8 characters long")
 private String password;
 @Transient
 private String passwordConfirmation;
 @Column(updatable=false)
 @DateTimeFormat(pattern="yyyy-MM-dd")
 private Date createdAt;
 @DateTimeFormat(pattern="yyyy-MM-dd")
 private Date updatedAt;
 
 //==================================
 //   ONE TO MANY WITH JOBS
 //==================================
 
 @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
 private List<Job> jobs;
 
 
//==================================
//   ONE TO MANY WITH POSTS
//==================================

@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
private List<UserPost> posts;
 
 
 //==================================
 //   MANY TO MANY WITH JOBS
 //==================================
 
 @ManyToMany(fetch = FetchType.LAZY)
 @JoinTable(
     name = "users_jobs", 
     joinColumns = @JoinColumn(name = "user_id"), 
     inverseJoinColumns = @JoinColumn(name = "job_id")
 )
 private List<Job> applications;

//=====================================
 
 private ArrayList<Long> followers = new ArrayList<Long>();
 
 

public ArrayList<Long> getFollowers() {
	return followers;
}



public void setFollowers(ArrayList<Long> followers) {
	this.followers = followers;
}



public User() {
 }
 
 
 
 public Long getId() {
	return id;
}



public void setId(Long id) {
	this.id = id;
}



public String getFirstName() {
	return firstName;
}



public void setFirstName(String firstName) {
	this.firstName = firstName;
}



public String getLastName() {
	return lastName;
}



public void setLastName(String lastName) {
	this.lastName = lastName;
}



public String getEmail() {
	return email;
}



public void setEmail(String email) {
	this.email = email;
}



public String getPhoto() {
	return photo;
}



public void setPhoto(String photo) {
	this.photo = photo;
}



public String getBio() {
	return bio;
}



public void setBio(String bio) {
	this.bio = bio;
}



public String getLocation() {
	return location;
}



public String getLinkedin() {
	return linkedin;
}



public void setLinkedin(String linkedin) {
	this.linkedin = linkedin;
}



public void setLocation(String location) {
	this.location = location;
}



public String getPassword() {
	return password;
}



public void setPassword(String password) {
	this.password = password;
}



public String getPasswordConfirmation() {
	return passwordConfirmation;
}



public void setPasswordConfirmation(String passwordConfirmation) {
	this.passwordConfirmation = passwordConfirmation;
}



public Date getCreatedAt() {
	return createdAt;
}



public void setCreatedAt(Date createdAt) {
	this.createdAt = createdAt;
}



public Date getUpdatedAt() {
	return updatedAt;
}



public void setUpdatedAt(Date updatedAt) {
	this.updatedAt = updatedAt;
}



@PrePersist
 protected void onCreate(){
     this.createdAt = new Date();
 }
 @PreUpdate
 protected void onUpdate(){
     this.updatedAt = new Date();
 }



public List<Job> getJobs() {
	return jobs;
}



public void setJobs(List<Job> jobs) {
	this.jobs = jobs;
}



public List<UserPost> getPosts() {
	return posts;
}



public void setPosts(List<UserPost> posts) {
	this.posts = posts;
}



public List<Job> getApplications() {
	return applications;
}



public void setApplications(List<Job> applications) {
	this.applications = applications;
}



}
