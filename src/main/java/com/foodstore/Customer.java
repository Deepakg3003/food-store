package com.foodstore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
/**
 * Adds a new Customer to the database using servlet.
 */
@WebServlet("/insertCustomer")
public class Customer extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cId = Integer.parseInt(req.getParameter("cid"));
		String bName = req.getParameter("bname");
		String cAddress = req.getParameter("address");
		Long No = Long.parseLong(req.getParameter("no"));
		
		
		PrintWriter out =resp.getWriter();
		out.println("<html>"
				+"<head> </head> <body> Customer Id:- "+ cId+" name :- "+ bName+" address:- "+ cAddress+" number:- "+  No+ " </body>" +"</html>");
	
	
		
		String fqcn = "org.sqlite.JDBC";
		  String path=getServletContext().getRealPath("WEB-INF/classes/foodstore.db");
		  String url="jdbc:sqlite:"+path;
		
		String qrl = "insert into customerdetails values(?,?,?,?)";
		
		Connection con=null;
		try {
			Class.forName(fqcn);
			
			 con = DriverManager.getConnection(url);
			
			PreparedStatement pstmt = con.prepareStatement(qrl);
			
			pstmt.setInt(1,cId);
			pstmt.setString(2,bName);
			pstmt.setString(3,cAddress);
			pstmt.setLong(4,No);
			
			pstmt.executeUpdate();
			System.out.println("Data inserted to customer table");
			resp.sendRedirect("CustomerFetch.jsp");
		} catch (Exception e) {  
			e.printStackTrace();
			resp.sendRedirect("errorCustomer.jsp");
			
			
			
		}finally {
			try {
				if(con!=null) {
				    con.close();
					}
				}catch(Exception e){
					e.printStackTrace();
					}
				}
	
	
	}
	

	
}
