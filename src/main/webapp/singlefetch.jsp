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
          <a class="nav-link active" aria-current="page" href="productFetch.jsp" style="font-size: 20px;">Product</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="CustomerFetch.jsp" style="font-size: 20px;">Customer</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="orderPage.jsp" style="font-size: 20px;">Order</a>
        </li>
      </ul>
      <!-- <form class="d-flex" action="singlefetch.jsp">
        <input class="form-control me-2" name="fid" type="search" placeholder="Search product by ID" aria-label="Search">
        <button class="btn btn-primary mx-2" placeholder="" type="submit">Search</button>
      </form> -->
      <a href="adminLogin.jsp"><button class="btn btn-warning" type="submit">Logout</button></a>
    </div>
  </div>
</nav>

	
	<% 
	
	/**
     * Retrieves  a specific food product from the database based on its ID.
     *
     */

	
	String id =request.getParameter("fid");
		int pid = Integer.parseInt(id);
		
		
		   String fqcn = "org.sqlite.JDBC";
		   String path=application.getRealPath("WEB-INF/classes/foodstore.db");
		   String url="jdbc:sqlite:"+path;		
		   String fqrl = "select * from foodproduct where pid='"+pid+"'";
		
		   Connection con=null;
		try {
			Class.forName(fqcn);
			
			 con = DriverManager.getConnection(url);
			
			PreparedStatement pstmt = con.prepareStatement(fqrl);
			
			ResultSet rs= pstmt.executeQuery();
			System.out.println("Fetch done successfully");
			if(rs.next()){
				 int prid = rs.getInt(1);
				 String sid = prid+"";
				 String sku = rs.getString(2);
				 String desc = rs.getString(3);
				 String cate = rs.getString(4);
				 float price = rs.getFloat(5);
				 
				 
				 
				 %>
				 
				 
<div class="container my-2 col-md-4 my-5">
	<div class="card line">
		<div class="card-body">
			<div class="mb-3 ">
				<h1 class="text-center col-md-9 offset-md-2" style="background-color:green;color:white">Product details</h1>
 			</div>
 			<div class="mb-3 my-5">
 		<h3 >Product ID: <%=prid %></h3>
		<h3>Product SKU: <%=sku %></h3>
		<h3>Product Description: <%=desc %></h3>
		<h3>Product Category: <%=cate %></h3>
		<h3>Product Price: <%=price %> &#163;</h3>
			</div>
		</div>
	</div>
</div>
				 
				
	<% 
			}
			else{
				response.sendRedirect("Notfound.jsp");
				
				
			}
			System.out.println("Done.....");
		} catch (Exception e) {  
			e.printStackTrace(); 
				
		} finally {
			try {
				if(con!=null) {
				    con.close();
					}
				}catch(Exception e){
					e.printStackTrace();
					}
				}


			
			%>
	

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    
  </body>
</html>