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
 * Adds a new food product to the database using servlet.
 */
@WebServlet("/insertProduct")
public class Product extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pid = Integer.parseInt(req.getParameter("pid"));
		String sku = req.getParameter("psku");
		String decr = req.getParameter("pdes");
		String category = req.getParameter("pcate");
		float price = Float.parseFloat(req.getParameter("price"));
		
		
		
		PrintWriter out =resp.getWriter();
		out.println("<html>"
				+"<head> </head> <body> product:- "+ pid+" sku :- "+ sku+" dec:- "+ decr+" cate:- "+ category+ " price:- "+ price+" </body>" +"</html>");
	
		
		
		
		String fqcn = "org.sqlite.JDBC";
		String path=getServletContext().getRealPath("WEB-INF/classes/foodstore.db");
	    String url="jdbc:sqlite:"+path;
		
		String qrl = "insert into foodproduct values(?,?,?,?,?)";
		
		Connection con=null;
		try {
			Class.forName(fqcn);
			 con = DriverManager.getConnection(url);
			PreparedStatement pstmt = con.prepareStatement(qrl);
			
			pstmt.setInt(1,pid);
			pstmt.setString(2,sku);
			pstmt.setString(3,decr);
			pstmt.setString(4,category);
			pstmt.setFloat(5,price);
			
			
			
			pstmt.executeUpdate();
			
			resp.sendRedirect("productFetch.jsp");
		} catch (Exception e) {  
			e.printStackTrace();
			resp.sendRedirect("erroproduct.jsp");
			
			
			
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



	
	
	}
}
