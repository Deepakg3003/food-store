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
    <title>Hello, world!</title>
    <style>
    .box{
    display: inline-block;
    }
    
    .upper{
    margin-top: -320px;}
    </style>
  </head>
  <body style="background-image: url('resource/img/storebg.jpg');
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
          <a class="nav-link active" aria-current="page" href="adminLogin.jsp" style="font-size: 20px;">Admin Login</a>
        </li>
      </ul>
      
    
    </div>
  </div>
</nav>



<div class="container-fluid my-4 col-md-1 offset-md-1 box">

<table class="table">
  <thead class="table-dark" >
    <tr>
      <th scope="col">customerID</th>
      <!-- <th scope="col">businessName</th>
      <th scope="col">address</th>
      <th scope="col">telephoneNumber</th> -->
      
    </tr>
  </thead>
  <tbody class="table-success">
  
  	<%
  	
  	 /**
     * Retrieves  all customers from the database.
     */
  	String fqcn = "org.sqlite.JDBC";
    String path=application.getRealPath("WEB-INF/classes/foodstore.db");
    String url="jdbc:sqlite:"+path;
	
	String fqrl = "select * from customerdetails";
	
	Connection con=null;
	
	try {
		Class.forName(fqcn);
		
		 con = DriverManager.getConnection(url);
		
		PreparedStatement pstmt = con.prepareStatement(fqrl);
		
		ResultSet rs= pstmt.executeQuery();
		
		while(rs.next()){
			 int cid = rs.getInt(1);
			 String sid = cid+"";
			 String cName = rs.getString(2);
			 String cAddress = rs.getString(3);
			 Long cNo = rs.getLong(4);
		 
			 
		%>
		
		 <tr>
      <th scope="row"><%= cid %></th>
    
      
    </tr>
		
		<%
		
		}
		System.out.println("Done.....");
	} catch (Exception e) {  
		e.printStackTrace(); 
		
		%>
		
		<h1> Customer Not found </h1>
		
		<% 
			
	}
	  finally {
		try {
		if(con!=null) {
		    con.close();
			}
		}catch(Exception e){
			e.printStackTrace();
			}
		}  



  	%>
  
   
    
  </tbody>
</table>  
</div>

<div class="container-fluid my-4 col-md-8 offset-md-3 box">


<table class="table upper">
  <thead class="table-dark">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">SKU</th>
      <th scope="col">Description</th>
      <th scope="col">Category</th>
      <th scope="col">Price</th>
      
    </tr>
  </thead>
  <tbody class="table-light">
  
  	<%
  	/**
     * Retrieves  all food products from the database.
     */
	String query = "select * from foodproduct";
	
  	 Connection con2=null;
	try {
		Class.forName(fqcn);
		System.out.println("step 1 done");
		 con2 = DriverManager.getConnection(url);
		System.out.println("step 2 done");
		PreparedStatement pstmt = con2.prepareStatement(query);
		System.out.println("step 3 done");
		ResultSet rs= pstmt.executeQuery();
		
		while(rs.next()){
			 int pid = rs.getInt(1);
			 String sid = pid+"";
			 String sku = rs.getString(2);
			 String desc = rs.getString(3);
			 String cate = rs.getString(4);
			 float price = rs.getFloat(5);
			 
			 
			 
		%>
		
		 <tr>
      <th scope="row"><%= pid %></th>
      <td><%= sku %></td>
      <td><%= desc %></td>
      <td><%= cate %></td>
      <td><%= price %> &#163;</td>
     
      
    </tr>
		
		<%
		
		}
		System.out.println("Done.....");
	} catch (Exception e) {  
		e.printStackTrace(); 
		
		%>
		
		<h1> Product Not found </h1>
		
		<% 
			
	}
	 finally {
		try {
		if(con2!=null) {
		    con2.close();
			}
		}catch(Exception e){
			e.printStackTrace();
			}
		} 

  	%>
  
   
    
  </tbody>
</table>
	
	
	
</div>
	 
		
<div class="container-fluid col-md-3 0ffset-md-4 ">
	<div class="card line"> 
		<div class="card-body ">
		
		<form action="orderSummary.jsp">
			
  <label for="id" class="form-label">Enter Customer ID</label>
  <input type="text" class="form-control" id="id" placeholder="Enter Customer Id" name="cid" required="required">


	
  <label for="pid" class="form-label">Enter Product ID</label>
  <input type="text" class="form-control" id="pid" placeholder="For multiple product id eg-1,2,3" name="pid" required="required">
  <h5 style="color:green;font-size: 15px;">For multiple id eg-1,2,3</h5>


		<div class="my-3 col-md-1 offset-md-5">
		<button class="btn btn-warning" type="submit">Submit</button>
		</div>
		
		</form>
		</div>
	</div>
</div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ..="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    
  </body>
</html>