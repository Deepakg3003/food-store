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
    <title>updateProduct</title>
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
          <a class="nav-link active" aria-current="page" href="productFetch.jsp" style="font-size: 20px;">Product</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="CustomerFetch.jsp" style="font-size: 20px;">Customer</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="orderPage.jsp" style="font-size: 20px;">Order</a>
        </li>
      </ul>
      <!-- <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-primary mx-2" type="submit">Search</button>
      </form> -->
      <a href="adminLogin.jsp"><button class="btn btn-warning" type="submit">Logout</button></a>
    </div>
  </div>
</nav>


		
		<%
		String description = request.getParameter("desc");
		System.out.println(description);
		boolean b=false;
		%>
<div class="container-fluid my-4 col-md-9 offset-md-1.5">



<table class="table">
  <thead class="table-dark">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">SKU</th>
      <th scope="col">Description</th>
      <th scope="col">Category</th>
      <th scope="col">Price</th>
      <th scope="col">Edit</th>
      <th scope="col">delete</th>
    </tr>
  </thead>
  <tbody class="table-light">
  
  	<%
  	
  	String fqcn = "org.sqlite.JDBC";
    String path=application.getRealPath("WEB-INF/classes/foodstore.db");
    String url="jdbc:sqlite:"+path;
	String fqrl = "select * from foodproduct where pdescription=?";
	
	Connection con=null;
	try {
		Class.forName(fqcn);
		System.out.println("step 1 done");
		 con = DriverManager.getConnection(url);
		System.out.println("step 2 done");
		PreparedStatement pstmt = con.prepareStatement(fqrl);
		pstmt.setString(1, description);
		System.out.println("step 3 done");
		ResultSet rs= pstmt.executeQuery();
		System.out.println("suucesss desc fetch");
		
		
		while(rs.next()){
			 int pid = rs.getInt(1);
			 String sid = pid+"";
			 String sku = rs.getString(2);
			 String desc = rs.getString(3);
			 String cate = rs.getString(4);
			 float price = rs.getFloat(5);
			 b =true;
			
			 if( b= true){
				 System.out.println(pid);
				 System.out.println(sku);
				 System.out.println(desc);
				 System.out.println(cate);
				 System.out.println(price);
				 
				 %>
					
				 <tr>
		      <th scope="row"><%= pid %></th>
		      <td><%= sku %></td>
		      <td><%= desc %></td>
		      <td><%= cate %></td>
		      <td><%= price %> &#163;</td>
		      <td><a href="UpdateProduct.jsp?id=<%= sid%>">edit</a></td>
		      <td><a href="delete.jsp?id=<%= sid%>">delete</a></td>
		      
		    </tr>
				
				<%
				 
				 
			}else{
				System.out.println("fetch Wrong....");
				
				
				
			}   
			 
		
		
		} 
		  
		
		System.out.println("Done.....fetch");
	} catch (Exception e) {  
		e.printStackTrace(); 
		
		%>
		
		<h1> Product Not found </h1>
		
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

		
		 <%
		if(b == false){
			
			%>
			
			<h3 class="text-center" style="color: red;">Product Not Found</h3>
			<%
			
		}
		
		
		%> 
		
		
		
	<div class="add">
	
	<a href="addProduct.jsp"><button class="btn btn-success mx-2 addproduct" type="submit">Add Product</button>
	</a>
	</div>
</div>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    
  </body>
</html>