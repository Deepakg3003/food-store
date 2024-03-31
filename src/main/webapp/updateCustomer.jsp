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
    <title>updateCustomer</title>
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
      </ul>
     
      
    </div>
  </div>
</nav>

<div class="container my-2 col-md-5">
	<div class="card line">
		<div class="card-body">
		
		<form action="modifyCustomer" method="post">
		<div class="mb-3">
		<%
		String id = request.getParameter("id");
		int iid = Integer.parseInt(id);
		%>
 
  <input type="hidden" class="form-control" id="id" placeholder="Enter Product Id" name="cid" value="<%= iid %>" required="required">
</div>
<h3 class="text-center col-md-5 offset-md-3" style="color:green;">Update Customer</h3>
<div class="mb-3">
		
  <label for="sku" class="form-label">Business Name</label>
  <input type="text" class="form-control" required="required" id="sku" placeholder="Enter Business Name" name="bname">
</div>
<div class="mb-3">
  <label for="Pdescribed" class="form-label">Address</label>
  <textarea class="form-control" required="required" id="pdescribed" rows="1" placeholder="Enter Address" name="address"></textarea>
</div>


<div class="mb-3">
		
  <label for="pcat" class="form-label">Telephone Number</label>
  <input type="text" class="form-control" required="required" id="pcat" placeholder="Enter Telephone Number" name="no">
</div>


		<div class="col-md-1 offset-md-5">
		<button class="btn btn-warning" type="submit">Submit</button>
		</div>
		
		</form>
		</div>
	</div>
</div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    
  </body>
</html> 