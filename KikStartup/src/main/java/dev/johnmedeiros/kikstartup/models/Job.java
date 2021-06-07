package dev.johnmedeiros.kikstartup.models;

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
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="jobs")
public class Job {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@NotNull
	@Size(min=6, max=75, message = "Title must be between 6-75 characters")
	private String title;
	@NotNull
	@Size(min=2, max=75, message = "Company must be between 10-75 characters")
	private String company;
	@NotNull
	@Size(min=10, max=255, message = "Pro Tip: The most active job listings have a description between 10-255 characters")
	private String description;
	@NotNull
	private Integer salary;
	@NotNull
	@Size(min=10, max=255, message = "A location is required!")
	private String location;
	@NotNull
	private String remote;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	
	//==================================
	//   MANY TO ONE WITH USER
	//==================================
	
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
    
    
	//==================================
	//   MANY TO MANY WITH USER
	//==================================
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "users_jobs", 
        joinColumns = @JoinColumn(name = "job_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> applicants;


	
    public Job() {

	}



	public Job(String title, String company, String description, Integer salary,String location, String remote) {
		this.title = title;
		this.company = company;
		this.description = description;
		this.salary = salary;
		this.location = location;
		this.remote= remote;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}



	public String getRemote() {
		return remote;
	}





	public void setRemote(String remote) {
		this.remote = remote;
	}





	public String getCompany() {
		return company;
	}



	public void setCompany(String company) {
		this.company = company;
	}





	public Integer getSalary() {
		return salary;
	}





	public void setSalary(Integer salary) {
		this.salary = salary;
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


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}



	public List<User> getApplicants() {
		return applicants;
	}



	public void setApplicants(List<User> applicants) {
		this.applicants = applicants;
	}
    
    

}
