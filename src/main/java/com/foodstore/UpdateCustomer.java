package com.foodstore;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 *Update a customer using servlet .
 */
@WebServlet("/modifyCustomer")
public class UpdateCustomer extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		int cId = Integer.parseInt(req.getParameter("cid"));
		String bName = req.getParameter("bname");
		String cAddress = req.getParameter("address");
		Long No = Long.parseLong(req.getParameter("no"));
		

		String fqcn = "org.sqlite.JDBC";
		  String path=getServletContext().getRealPath("WEB-INF/classes/foodstore.db");
		  String url="jdbc:sqlite:"+path;
		
		String update = "Update customerdetails set businessName='"+bName+"',address='"+cAddress+"' ,telephoneNumber='"+No+"' Where customerID="+cId+"";
		Connection con=null;
		try {
			Class.forName(fqcn);
			
			 con = DriverManager.getConnection(url);
			
			PreparedStatement pstmt = con.prepareStatement(update);
			
		    pstmt.executeUpdate();
		   
		    System.out.println("Customer Details Updated");
		   
		}catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("update error");
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


			resp.sendRedirect("CustomerFetch.jsp");	
	}
}
