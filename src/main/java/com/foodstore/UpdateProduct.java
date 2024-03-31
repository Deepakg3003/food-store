package com.foodstore;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * Update a Product using servlet
 */
@WebServlet("/modifyProduct")
public class UpdateProduct extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		int pid = Integer.parseInt(req.getParameter("pid"));
		String sku = req.getParameter("psku");
		String decr = req.getParameter("pdes");
		String category = req.getParameter("pcate");
		float price = Float.parseFloat(req.getParameter("price"));

		String fqcn = "org.sqlite.JDBC";
		  String path=getServletContext().getRealPath("WEB-INF/classes/foodstore.db");
		  String url="jdbc:sqlite:"+path;
		String update = "Update foodproduct set psku='"+sku+"',pdescription='"+decr+"' ,pcategory='"+category+"' ,price='"+price+"' Where pid="+pid+"";
		 Connection con=null;
		try {
			Class.forName(fqcn);
			 con = DriverManager.getConnection(url);
			PreparedStatement pstmt = con.prepareStatement(update);
		
		    pstmt.executeUpdate();
		   
		    System.out.println("Product Updated Successfully");
		   
		}catch(Exception e)
		{
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

			resp.sendRedirect("productFetch.jsp");	
	}
}
