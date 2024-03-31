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
          <a class="nav-link active" aria-current="page" href="orderPage.jsp" style="font-size: 20px;">Order</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="adminLogin.jsp" style="font-size: 20px;">Admin Login</a>
        </li>
      </ul>
      
      
    </div>
  </div>
</nav>

<div class="container my-2 col-md-9">
	<div class="card white">
		<div class="card-body">
	
	
	
	<% String id =request.getParameter("cid");
	int id2 = Integer.parseInt(id);
	
	float sum=0;
	String pid =request.getParameter("pid");
	String[] pid2=pid.split(",");
	int[] vid = new int[pid2.length] ;
	
	
	
	
    	System.out.println(vid);
		for(int i=0;i< pid2.length; i++){
			 vid[i]= Integer.parseInt(pid2[i]);
		
			
		}
		
%>

		 	
		<% 
		 /**
	     * Retrieves  a specific customer from the database based on their ID.
	     */
		 
		 String fqcn2 = "org.sqlite.JDBC";
		   String path=application.getRealPath("WEB-INF/classes/foodstore.db");
		   String url2="jdbc:sqlite:"+path;

	
	String fqrl2  = "select * from customerdetails where customerID=?";
	Connection con=null;
	try {
		Class.forName(fqcn2);
		
		 con = DriverManager.getConnection(url2);
		
		PreparedStatement pstmt = con.prepareStatement(fqrl2);
		pstmt.setInt(1, id2);
		
		ResultSet rs= pstmt.executeQuery();
		
		if(rs.next()){
			int cid = rs.getInt(1);
			String  stid = cid+"";
			 String cName = rs.getString(2);
			 String cAddress = rs.getString(3);
			 Long cNo = rs.getLong(4);
			  System.out.println("step 5 done");
			  
			  %>
			  
			  <h1 class="text-center" style="color: blue;">Customer ID  <%=cid %></h1>
		<h1 class="text-center" style="color: blue;">Customer Name is  <%=cName %></h1>
			  <% 
			  
		}
		 else{
			response.sendRedirect("customerNotFound.jsp");
		
		} 
	} catch (Exception e) {  
		e.printStackTrace(); 
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
	
		<h4 class="text-center" style="color: green;">Order Confirmed !</h4>
		
		
	<div class="container-fluid my-4 ">	
		
	
		<table class="table">
  <thead class="table-dark">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">SKU</th>
      <th  scope="col">Description</th>
      <th scope="col">Category</th>
      <th scope="col">Price</th>
      <!-- class="col-md-6" -->
    </tr>
  </thead>
		<%
		
		for(int i=0;i< vid.length; i++){
			 
		%>
		
		<%-- <h1>Product <%= vid[i] %></h1> --%>
		
		
  <tbody class="table-light">
  
  	<%
  	String fqcn = "org.sqlite.JDBC";
    String path2=application.getRealPath("WEB-INF/classes/foodstore.db");
    String url="jdbc:sqlite:"+path2;

	
	String fqrl = "select * from foodproduct where pid='"+vid[i]+"'";
	
	 Connection con2=null;
	try {
		Class.forName(fqcn);
		
		 con2 = DriverManager.getConnection(url);
		
		PreparedStatement pstmt = con2.prepareStatement(fqrl);
		
		ResultSet rs= pstmt.executeQuery();
		
		if(rs.next()){
			 int aid = rs.getInt(1);
			 String sid = aid+"";
			 String sku = rs.getString(2);
			 String desc = rs.getString(3);
			 String cate = rs.getString(4);
			 float price = rs.getFloat(5);
			 
			  sum=sum+price;
			 
		%>
		
		
		 <tr>
      <th scope="row"><%= aid %></th>
      <td><%= sku %></td>
      <td><%= desc %></td>
      <td><%= cate %></td>
      <td><%= price %> &#163;</td>
       
      
    </tr>
		 
		<%
		
		}
		 else{
			response.sendRedirect("Notfound.jsp");
		
		} 
	} catch (Exception f) {  
		f.printStackTrace(); 
		
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
  
<%
		}
	
		%>	 
		
		  </tbody>
</table>
<h5 style="color:blue;">Total amount is <%=sum %> &#163;</h5>
</div>
</div>
</div>
</div>
	
<!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>