 
  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="resource/css/style.css" rel="stylesheet">
    <title>adminLogin</title>
  </head>
  <body style="background-image: url('resource/img/addProduct.jpg');
  				 background-position: fixed;
            background-size: cover;
            background-repeat: no-repeat;">

<nav class="navbar navbar-expand-lg navbar-dark head">

  <div class="container-fluid">
    <a class= "logo1" href="homePage.jsp" ><img src="resource/img/shop.png" alt="image" class="logo mx-2"></a>
    <a class="navbar-brand" href="homePage.jsp">Food Store</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="homePage.jsp" style="font-size: 20px;">Home</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="CustomerFetch.jsp" style="font-size: 20px;">Customer</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="orderPage.jsp" style="font-size: 20px;">Order</a>
        </li>
      </ul>
      
      
    </div>
  </div>
</nav>

<div class="container col-md-4 offset-md-4 my-5">
<div class="card " style="background-color: lightgreen;">
		<div class="card-body">
		<div class="text-center">
		<h3>Admin Login</h3>
		</div>
<form action="Slogin" method="Post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Username</label>
    <input type="text" class="form-control" placeholder="Enter your Username" id="exampleInputEmail1" aria-describedby="emailHelp" name="uname">
    <!-- <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div> -->
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" placeholder="Enter your password" id="exampleInputPassword1" name="pass">
  </div>
  <!-- <div class="mb-3 form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div> -->
  <button type="submit" class="btn btn-primary">Submit</button>
  <span class="mx-2" style="color: yellow;">username : store816 and pass: store@816</span>
</form>
</div>
</div>
</div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    
  </body>
</html> 