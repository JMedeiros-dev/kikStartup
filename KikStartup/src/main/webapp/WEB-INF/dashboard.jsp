<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!---------"c:out ; c:if ; c:when ; c:forEach"--------->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="color-scheme" content="dark light">
<title>KikStartup</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    $.get(
      "https://gnews.io/api/v4/search?q=technology&token=c766b6c753b1e965487323513e06ec04",
      function (res) {
        console.log(res);
        var html_str = "<h5>Top Tech Stories:</h5>";
        html_str += "<ul>";
        for (var i = 0; i < res.articles.length; i++) {
          html_str +=
            "<li>" +
            "<a href=" +
            res.articles[i].url +
            " target='_blank' rel='noreferrer noopener'>" +
            res.articles[i].title +
            "</a>" +
            "</li>";
        }
        html_str += "</ul>";
        $("#news").html(html_str);
      },
      "json"
    );
  });
        </script>
<!---------Bootstrap--------->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
  <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
     <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Baloo+Tammudu+2:wght@600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oxygen&family=Ubuntu:wght@700&display=swap" rel="stylesheet">
      <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
  <link href="lib/css/emoji.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
.auto {
  margin: auto;
}
</style>
<script src="https://cdn.tiny.cloud/1/hbvzhjopxaobcxjlish5itnrrx38gu1wa7niw2x970lahyi7/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
  tinymce.init({
    selector: "#mytextarea",
    skin: 'bootstrap',
    plugins: "emoticons, lists, link, image, media",
    toolbar: "emoticons h1 h2 bold italic strikethrough blockquote bullist numlist backcolor | link image media | removeformat help",
    toolbar_location: "bottom",
    menubar: false,
    height: 125
  });
</script>
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

<div class="row">
		<div class="col-md-2 bg-light mt-4 profile-div"> <!-- Profile Card -->
		 <h5 class="text-center"><a class="post-name text-center" href="/profile/${user.id}"><c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/> </a></h5>
		 <hr>
		 <ul class="mt-3">
  			<li class="list-item mt-3 profile-list-item"><a class="profile-list-item" href="/my_jobs">My Jobs</a></li>
  			<li class="list-item mt-3 profile-list-item"><a class="profile-list-item" href="/my_applications">My Applications</a></li>
			</ul>
		</div>
		
		<div class="col-md-6"> <!-- Feed -->
		
		<div class="bg-light pb-2 mt-4 profile-div">
		<h3 class="text-center mt-2">Message Board</h3>
		 <form:form action="/add_post" method="post" class="pr-2" modelAttribute="userpost">
   			<form:hidden value="${user.id}" path="user"/>
    		<div class="form-group">
        	<form:errors path="p"/>
        	<form:input class="form-control rounded-pill" path="p" id="mytextarea" placeholder="Start a post"/>
    		</div>
    		<input type="submit" class="btn sign-up pb-2 text-white" value="Post"/>
		</form:form> 
		</div>
		
		
		 <c:forEach items="${posts}" var="p">
    <div class="bg-light mt-4 profile-div">
    
    <a class="post-name" href="/profile/${p.user.id}"><c:out value="${p.user.firstName}"/> <c:out value="${p.user.lastName}"/> </a>
		<span class="ml-5 mt-2">${p.p}</span>
    <p class="post-date"><fmt:formatDate type = "both" 
         dateStyle = "long" timeStyle = "long" value = "${p.createdAt}" /></p>
    </div>
    </c:forEach>

		</div>
		
		<div class="col-md-4"> <!-- Top News / Latest Jobs -->
		<div class="bg-light mt-4 pr-2 profile-div" id="news">
		</div>
		<div class="bg-light mt-4 mb-2 pr-2 pb-4 profile-div">
		<h5>Latest Jobs:</h5>
		<c:forEach items="${recentJobs}" var="r">
		<ul>
		<li><a href="/jobs/${r.id}"><c:out value="${r.title}"/></a></li>
		</ul>
		</c:forEach>
		<p><a class="post-name float-right" href="/jobs">See more Jobs</a></p>
		</div>
		</div>
	</div>


</div><!---------End of Container--------->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script src="lib/js/config.js"></script>
  <script src="lib/js/util.js"></script>
  <script src="lib/js/jquery.emojiarea.js"></script>
  <script src="lib/js/emoji-picker.js"></script>
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