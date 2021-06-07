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
<meta name="color-scheme" content="dark light">
<title>KikStartup</title>
<!---------Bootstrap--------->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
  <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Baloo+Tammudu+2:wght@600&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Oxygen&family=Ubuntu:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="container"> <!---------Beginning of Container--------->
         
<h2 class="mt-5 text-center logo">KikStartup</h2>
 <div class="text-danger text-center"><form:errors path="user.*" /></div>

          <form:form
            method="POST"
            action="/registration"
            class="col-8 login-form"
            modelAttribute="user"
          >
           <div class="form-group d-flex justify-content-center">
              <form:input class="form-control col-8"  path="firstName" placeholder="First Name" />
            </div>
             <div class="form-group d-flex justify-content-center">
              <form:input class="form-control col-8"  path="LastName" placeholder="Last Name" />
            </div>
            <div class="form-group d-flex justify-content-center">
              <form:input class="form-control col-8" type="email" path="email" placeholder="Email" />
            </div>
            <div class="form-group d-flex justify-content-center">
              <form:password class="form-control col-8" path="password" placeholder="Password" />
            </div>
            <div class="form-group d-flex justify-content-center">
              <form:password class="form-control col-8" path="passwordConfirmation" placeholder="Password Confirmation" />
            </div>
            <div class="form-group d-flex justify-content-center">
            <input type="submit" class="btn sign-up text-white col-8" value="Sign Up" />
            </div>
          </form:form>
          <p class="text-center">By signing up, you agree to the<a href=""> Terms of Service</a>.</p>
          <hr class="col-4">
          <p class="text-center"><a href="/login">Already have an account?</a></p>
</div><!---------End of Container--------->
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