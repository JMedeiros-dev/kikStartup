<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!---------"c:out ; c:if ; c:when ; c:forEach"--------->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="color-scheme" content="dark light">
<title>KikStartup</title>
<!---------Bootstrap--------->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
  <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
  <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Baloo+Tammudu+2:wght@600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oxygen&family=Ubuntu:wght@700&display=swap" rel="stylesheet">

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-white">
   <a class="navbar-brand logo-small logo-dash mt-2" href="/dashboard">KikStartup</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span><i class="fas fa-bars"></i></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto justify-content-around w-100">
      <li class="nav-item active">
        <a class="nav-link" aria-current="page" href="/dashboard">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/jobs">Jobs</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/my_applications">Applications</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Profile
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			<a class="dropdown-item" href="/profile">View Profile</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="/update_profile">Edit Profile</a>
          <a class="dropdown-item" href="/reset_pass">Reset Password</a>
        </div>
      </li>
    <form class="form-inline my-2 my-lg-0" action="/search_job" method="post">
      <input type="text" class="form-control mr-sm-2" placeholder="Find Jobs" name="job"/>
      <input type="submit" class="btn btn-secondary mr-4 my-2 my-sm-0" value="Search"/>
    </form>
      <a class="btn my-2 my-sm-0 sign-up text-white" href="/logout">Logout</a>
    </ul>
  </div>
</nav>
<div class="container"> <!---------Beginning of Container--------->
<p class="create-job-text text-center"> Edit Job </p>
<form:form action="/jobs/${job.id}/edit" method="post" class=" col-10 login-form" modelAttribute="job" >
<form:hidden value="${user.id}" path="user"/>
<input type="hidden" name="_method" value="put">
    <div class="form-group d-flex justify-content-center">
        <form:errors path="title"/>
        <form:input class="form-control col-10" path="title" placeholder="Title"/>
    </div>
    
     <div class="form-group d-flex justify-content-center">
        <form:errors path="company"/>
        <form:input class="form-control col-10" path="company" placeholder="Company"/>
    </div>
    
    <div class="form-group d-flex justify-content-center">
        <form:errors path="description"/>
        <form:textarea class="form-control col-10" path="description" placeholder="Description"/>
    </div>
    
    <div class="form-group d-flex justify-content-center">
        <form:errors path="salary"/>
        <form:input type="number" class="form-control col-10" path="salary" placeholder="Annual Salary"/>
    </div>
    
    <div class="form-group d-flex justify-content-center">
        <form:errors path="location"/>
        <form:input  class="form-control col-10" path="location" placeholder="Location"/>
    </div>
    
<div class="form-group d-flex justify-content-center">

            <form:select path="remote" class="form-control col-10">
            	<option selected>Can this position be filled remotely?</option>
            	<form:option value="Yes" label="Yes">Yes</form:option>
            	<form:option value="No" label="No">No</form:option>
            </form:select>
            </div>
            
     <div class="form-group d-flex justify-content-center">
    <input type="submit" class="btn text-white sign-up col-10" value="Save Changes"/>
    </div>
</form:form> 
    
     <form action="/delete/${job.id}" method="post" class="col-10 d-flex justify-content-center login-form" >
    <input type="hidden" name="_method" value="delete">
    <input type="submit" class="btn text-white btn-secondary col-10" value="Delete"></form>
    
   
</div><!---------End of Container--------->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<script type="text/javascript">
//Select the button
const btn = document.querySelector(".btn-toggle");
// Select the theme preference from localStorage
const currentTheme = localStorage.getItem("theme");

// If the current theme in localStorage is "dark"...
if (currentTheme == "dark") {
  // ...then use the .dark-theme class
  document.body.classList.add("dark-theme");
}

// Listen for a click on the button 
btn.addEventListener("click", function() {
  // Toggle the .dark-theme class on each click
  document.body.classList.toggle("dark-theme");
  
  // Let's say the theme is equal to light
  let theme = "light";
  // If the body contains the .dark-theme class...
  if (document.body.classList.contains("dark-theme")) {
    // ...then let's make the theme dark
    theme = "dark";
  }
  // Then save the choice in localStorage
  localStorage.setItem("theme", theme);
});

</script>
</body>
</html>