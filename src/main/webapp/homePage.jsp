<%@page import="javax.swing.plaf.synth.SynthOptionPaneUI"%>
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
    <title>HomePage!</title>
    
    <style>
   .box{
	
	display:inline-block;
	} 
	.parent{display: flex;
	align-items:center;
	justify-content: space-around;
	}
    </style>
  </head>
  <body style="background-image: url('resource/img/storebg.jpg');
  				 background-position: fixed;
            background-size: cover;
            background-repeat: no-repeat;">
            
  
<nav class="navbar navbar-expand-lg navbar-dark head">

  <div class="container-fluid">
    <a class= "logo1" href="homePage.jsp" title="foodstore"><img src="resource/img/shop.png" alt="image" class="logo mx-2"></a>
    <a class="navbar-brand" href="homePage.jsp" >Food Store</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="homePage.jsp" style="font-size: 20px;">Home</a>
        </li>
      </ul>
      <div >
      <h1 class="text-center " style="color: white;margin-right: 300px;font-size: 35px;">Welcome to Wholesale Food store</h1>
       </div>
      
    </div>
  </div>
</nav>


<div class="parent my-5">
	
	<div class="card box" style="width: 18rem;background-color: cyan;">
  <img src="resource/img/customer.jpeg" class="card-img-top" alt="customer_image">
  <div class="card-body">
  <a href="CustomerFetch.jsp">
    <button type="button" class="btn btn-warning text-center">Customer</button>
   </a>
  </div>
  
</div>


<div class="card box" style="width: 18rem;background-color: cyan;">
  <img src="resource/img/OrderNow.png" class="card-img-top" alt="customer_image">
  <div class="card-body">
  <a href="orderPage.jsp">
    <button type="button" class="btn btn-warning text-center">Order</button>
    </a>
  </div>
</div>


<div class="card box" style="width: 18rem;background-color: cyan;">
  <img src="resource/img/Admin Login.jpeg" class="card-img-top" alt="customer_image">
  <div class="card-body">
  <a href="adminLogin.jsp">
    <button type="button" class="btn btn-warning text-center">Admin</button>
    </a>
  </div>
</div>
	 
	
	
</div>	

  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    
  </body>
</html>