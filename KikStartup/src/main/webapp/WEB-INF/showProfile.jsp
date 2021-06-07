<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Tammudu+2:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Oxygen&family=Ubuntu:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
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
		
		
		 <div class="bg-light mt-4 col-8 profile-div">
		<h3 class="mt-3 ml-2"><c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/>  <button type="button" class="btn btn-sm rounded-pill text-white sign-up float-right" data-toggle="modal" data-target="#exampleModal">
  Contact Info
</button></h3>
		<p class="ml-2"><c:out value="${user.location}"/></p>
		</div>
		<div class="bg-light mt-4 col-8 profile-div">
		<h4 class="ml-4">About</h4>
		<p class="ml-2"><c:out value="${user.bio}"/></p>
  		</div>
  		

		<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p style="color: #ed4e23;" class="font-weight-bold">Contact info</p>
		<p class="font-weight-bold ml-2"><i class="far fa-envelope"></i> Email</p>
		<p class="ml-4"><a href="mailto:${user.email}?subject=Hi ${user.firstName}, I found you in KikStartup">${user.email}</a></p>
		<p class="font-weight-bold ml-2"><i class="fab fa-linkedin"></i> LinkedIn</p>
		<p class="ml-4"><a href="http://${user.linkedin}">${user.linkedin}</a></p>
      </div>
    </div>
  </div>
  </div>
</div>

		
 

</div><!---------End of Container--------->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
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